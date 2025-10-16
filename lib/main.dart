import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/app/app.dart';

void main() {
  runApp(const ProviderScope(child: PencatatanKeuanganApp()));
}
