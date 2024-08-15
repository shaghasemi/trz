import 'package:flutter/foundation.dart';
import 'package:hamdars/core/utils/service_locator.dart';
import 'package:hamdars/data/models/hamdars_model.dart';
import 'package:hamdars/data/web_provider/main_provider.dart';

class HamDarsRepository {
  final MainProvider _mainProvider = serviceLocator<MainProvider>();

  HamDarsRepository();

  Future<List<HamDarsModel>> loadMain({
    final int page = 0,
    final int pageSize = 20,
  }) async {
    final dynamic response = await _mainProvider.loadMain();
    final List<HamDarsModel> list = [];
    debugPrint("Print HamDarsRepository 15: ");
    for (final dynamic item in response as List<dynamic>) {
      list.add(HamDarsModel.fromJson(item));
    }
    // return HamDarsModel.fromJson(data);
    return list;
    // } else {
    //   throw Exception('Failed to load data');
    // }
  }
}
