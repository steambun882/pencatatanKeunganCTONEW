import 'package:intl/intl.dart';

final NumberFormat _rupiahFormat = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp',
  decimalDigits: 0,
);

String formatRupiah(int amount) {
  return _rupiahFormat.format(amount);
}
