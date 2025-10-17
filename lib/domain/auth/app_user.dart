class AppUser {
  const AppUser({
    required this.id,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  final String id;
  final String? email;
  final String? displayName;
  final String? photoUrl;
}
