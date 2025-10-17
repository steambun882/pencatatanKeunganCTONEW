import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/domain/domain.dart';

import 'auth_controller.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  bool _showSignIn = true;

  void _toggleForm() {
    setState(() {
      _showSignIn = !_showSignIn;
    });
  }

  Future<void> _handleGoogleSignIn() async {
    FocusScope.of(context).unfocus();
    final controller = ref.read(authControllerProvider.notifier);

    try {
      await controller.signInWithGoogle();
    } on AuthException catch (error) {
      _showErrorSnackBar(error.message);
    }
  }

  Future<void> _handleForgotPassword(String initialEmail) async {
    final email = await _promptForResetEmail(initialEmail: initialEmail);
    if (email == null) {
      return;
    }

    try {
      await ref
          .read(authControllerProvider.notifier)
          .sendPasswordResetEmail(email);
      if (!mounted) {
        return;
      }
      _showSuccessSnackBar('Password reset email sent to $email');
    } on AuthException catch (error) {
      _showErrorSnackBar(error.message);
    }
  }

  Future<String?> _promptForResetEmail({required String initialEmail}) async {
    final emailController = TextEditingController(text: initialEmail);
    final formKey = GlobalKey<FormState>();

    try {
      return await showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Reset password'),
            content: Form(
              key: formKey,
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'you@example.com',
                ),
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                validator: _emailValidator,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    Navigator.of(context).pop(emailController.text.trim());
                  }
                },
                child: const Text('Send reset link'),
              ),
            ],
          );
        },
      );
    } finally {
      emailController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(authControllerProvider);
    final isLoading = asyncState.isLoading;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.pie_chart_rounded,
                        size: 72,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Kelola keuangan Anda dengan mudah',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Buat akun untuk memantau pemasukan, pengeluaran, dan mencapai tujuan finansial dengan aman.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      FilledButton.icon(
                        onPressed: isLoading ? null : _handleGoogleSignIn,
                        icon: const Icon(Icons.g_mobiledata, size: 28),
                        label: const Text('Lanjutkan dengan Google'),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .outlineVariant,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('atau gunakan email'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .outlineVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: _showSignIn
                            ? _SignInForm(
                                key: const ValueKey('sign-in-form'),
                                isLoading: isLoading,
                                onForgotPassword: _handleForgotPassword,
                                onError: _showErrorSnackBar,
                              )
                            : _SignUpForm(
                                key: const ValueKey('sign-up-form'),
                                isLoading: isLoading,
                                onError: _showErrorSnackBar,
                                onSuccess: _showSuccessSnackBar,
                              ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: isLoading ? null : _toggleForm,
                        child: Text(
                          _showSignIn
                              ? 'Belum punya akun? Daftar sekarang'
                              : 'Sudah punya akun? Masuk di sini',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showSuccessSnackBar(String message) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

String? _emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email wajib diisi.';
  }
  final trimmed = value.trim();
  if (!trimmed.contains('@') || !trimmed.contains('.')) {
    return 'Masukkan email yang valid.';
  }
  return null;
}

class _SignInForm extends ConsumerStatefulWidget {
  const _SignInForm({
    super.key,
    required this.isLoading,
    required this.onForgotPassword,
    required this.onError,
  });

  final bool isLoading;
  final ValueChanged<String> onForgotPassword;
  final ValueChanged<String> onError;

  @override
  ConsumerState<_SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<_SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();
    final controller = ref.read(authControllerProvider.notifier);

    try {
      await controller.signInWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    } on AuthException catch (error) {
      widget.onError(error.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = widget.isLoading;

    return Form(
      key: _formKey,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Masuk dengan email',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              textInputAction: TextInputAction.next,
              validator: _emailValidator,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _passwordController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              autofillHints: const [AutofillHints.password],
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password wajib diisi.';
                }
                return null;
              },
              onFieldSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: isLoading
                    ? null
                    : () => widget
                        .onForgotPassword(_emailController.text.trim()),
                child: const Text('Lupa password?'),
              ),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Masuk'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignUpForm extends ConsumerStatefulWidget {
  const _SignUpForm({
    super.key,
    required this.isLoading,
    required this.onError,
    required this.onSuccess,
  });

  final bool isLoading;
  final ValueChanged<String> onError;
  final ValueChanged<String> onSuccess;

  @override
  ConsumerState<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<_SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();
    final controller = ref.read(authControllerProvider.notifier);

    try {
      await controller.registerWithEmail(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      widget.onSuccess('Akun berhasil dibuat. Selamat datang!');
    } on AuthException catch (error) {
      widget.onError(error.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = widget.isLoading;

    return Form(
      key: _formKey,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Daftar dengan email',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nameController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Nama lengkap',
              ),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              textInputAction: TextInputAction.next,
              validator: _emailValidator,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _passwordController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.newPassword],
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Password minimal 6 karakter.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _confirmController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                labelText: 'Konfirmasi password',
              ),
              obscureText: true,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.newPassword],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Konfirmasi password wajib diisi.';
                }
                if (value != _passwordController.text) {
                  return 'Password tidak sama.';
                }
                return null;
              },
              onFieldSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
