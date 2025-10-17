import 'package:pencatatan_keuangan/bootstrap.dart';
import 'package:pencatatan_keuangan/core/core.dart';

Future<void> main() async {
  await bootstrap(environment: AppEnvironment.prod);
}
