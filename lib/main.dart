import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pencatatan_keuangan/app/app.dart';
import 'package:pencatatan_keuangan/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    () => const ProviderScope(child: PencatatanKeuanganApp()),
  );
}
