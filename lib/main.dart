import 'package:pencatatan_keuangan/bootstrap.dart';
import 'package:pencatatan_keuangan/core/core.dart';

Future<void> main() async {
  const flavorName = String.fromEnvironment('APP_FLAVOR', defaultValue: 'dev');
  final environment = AppEnvironment.fromName(flavorName);

  await bootstrap(environment: environment);
}
