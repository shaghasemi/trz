import 'package:hamdars/core/utils/network/web_service.dart';
import 'package:hamdars/core/utils/service_locator.dart';

class MainProvider {
  // final WebClient _webClient = serviceLocator<WebClient>();
  final WebClient _webClient = WebClient();

  Future<dynamic> loadMain() async => _webClient.get(
        uri: 'qb/v4/test_unit',
        queryParameters: {},
      );
}
