import 'dart:io';

class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(
    final SecurityContext? context,
  ) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (
          final X509Certificate cert,
          final String host,
          final int port,
        ) =>
            true;
}
