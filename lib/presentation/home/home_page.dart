import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/domain/domain.dart';
import 'package:pencatatan_keuangan/presentation/auth/auth_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencatatan Keuangan'),
        actions: [
          IconButton(
            onPressed:
                isLoading ? null : () => _confirmSignOut(context, ref),
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
          ),
        ],
        bottom: isLoading
            ? const PreferredSize(
                preferredSize: Size.fromHeight(3),
                child: LinearProgressIndicator(minHeight: 3),
              )
            : null,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      child: Text(
                        _initialsFor(user),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      _greetingFor(user),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      user?.email ?? 'Tidak ada email terdaftar',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Mulai catat pemasukan dan pengeluaran harian untuk melihat tren dan membuat keputusan yang lebih baik.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Tambah transaksi pertama'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
    bool clearCache = true;

    final shouldClear = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Keluar dari akun'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Anda akan keluar dari akun Anda. Data transaksi akan tetap tersimpan di cloud.',
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    value: clearCache,
                    onChanged: (value) {
                      setState(() {
                        clearCache = value;
                      });
                    },
                    title: const Text('Hapus data lokal setelah keluar'),
                    subtitle: const Text(
                      'Membersihkan cache dari perangkat ini untuk menjaga keamanan.',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Batal'),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(context).pop(clearCache),
                  child: const Text('Keluar'),
                ),
              ],
            );
          },
        );
      },
    );

    if (shouldClear == null) {
      return;
    }

    try {
      await ref
          .read(authControllerProvider.notifier)
          .signOut(clearCache: shouldClear);
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            shouldClear
                ? 'Anda keluar dan data lokal telah dibersihkan.'
                : 'Anda keluar dari akun.',
          ),
        ),
      );
    } on AuthException catch (error) {
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    }
  }

  String _greetingFor(AppUser? user) {
    final name = user?.displayName?.trim();
    if (name != null && name.isNotEmpty) {
      return 'Selamat datang, $name';
    }
    return 'Selamat datang';
  }

  String _initialsFor(AppUser? user) {
    final displayName = user?.displayName?.trim();
    if (displayName != null && displayName.isNotEmpty) {
      final parts = displayName
          .split(RegExp(r'\s+'))
          .where((part) => part.isNotEmpty)
          .toList();
      if (parts.length == 1) {
        final firstPart = parts.first;
        final length = firstPart.length >= 2 ? 2 : 1;
        return firstPart.substring(0, length).toUpperCase();
      }
      final first = parts.first[0];
      final last = parts.last[0];
      return '$first$last'.toUpperCase();
    }
    final email = user?.email;
    if (email != null && email.isNotEmpty) {
      return email[0].toUpperCase();
    }
    return 'PK';
  }
}
