Map<String, String> headers() {
  final Map<String, String> headers = <String, String>{};
  headers.putIfAbsent('Content-Type', () => 'application/json');
  return headers;
}

Map<String, String> headersWithToken(final String token) {
  final Map<String, String> headers = <String, String>{};
  headers.putIfAbsent('Content-Type', () => 'application/json');
  headers.putIfAbsent('Authorization', () => 'Bearer $token');
  return headers;
}

class AppConst {
  static const String baseUrl = 'https://app.tarazorg.ir/api/';
  static const String baseUrlMobile = baseUrl;
}
