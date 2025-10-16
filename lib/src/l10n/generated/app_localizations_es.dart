import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Inicio del Proyecto';

  @override
  String counterLabel(int count) {
    return 'Has pulsado $count veces.';
  }

  @override
  String get loadingMessage => 'Cargando historial del contador…';

  @override
  String get genericErrorMessage => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get incrementButton => 'Incrementar';

  @override
  String get resetButton => 'Reiniciar';
}
