import 'dart:math';

const _alphabet = '0123456789abcdefghijklmnopqrstuvwxyz';

final Random _random = Random();

String generateOpaqueId({int length = 16}) {
  final buffer = StringBuffer();
  buffer.write(DateTime.now().millisecondsSinceEpoch.toRadixString(36));

  while (buffer.length < length) {
    buffer.write(_alphabet[_random.nextInt(_alphabet.length)]);
  }

  return buffer.toString().substring(0, length);
}
