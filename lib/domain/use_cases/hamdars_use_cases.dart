import 'package:hamdars/core/utils/service_locator.dart';
import 'package:hamdars/data/models/hamdars_model.dart';
import 'package:hamdars/data/repositories/hamdars_repository.dart';
import 'package:hamdars/domain/entities/hamdars.dart';

class HamDarsUseCases {
  final HamDarsRepository _repository = serviceLocator<HamDarsRepository>();

  Future<List<Hamdars>> loadMain() async => (await _repository.loadMain())
          .map(
            (final HamDarsModel e) => Hamdars(
              id: e.id,
              name: e.name,
              unitIcon: e.unitIcon,
              sumUserStudy: e.sumUserStudy,
              hamdarsUserUnitLevelIndex: e.hamdarsUserUnitLevelIndex,
              hamdarsUserCurrentUnitLevelPoint:
                  e.hamdarsUserCurrentUnitLevelPoint,
              hamdarsUserMaxUnitLevelPoint: e.hamdarsUserMaxUnitLevelPoint,
              hamdarsUserMinUnitLevelPoint: e.hamdarsUserMinUnitLevelPoint,
              progress: e.hamdarsUserCurrentUnitLevelPoint != null &&
                      e.hamdarsUserMaxUnitLevelPoint != null &&
                      e.hamdarsUserMinUnitLevelPoint != null
                  ? (e.hamdarsUserCurrentUnitLevelPoint! /
                      (e.hamdarsUserMaxUnitLevelPoint! -
                          e.hamdarsUserMinUnitLevelPoint!))
                  : 0,
              hamdarsQUnitLearningContentDtos:
                  List<HamdarsQUnitLearningContentDtos>.generate(
                e.hamdarsQUnitLearningContentDtos?.length ?? 0,
                (final int index) => HamdarsQUnitLearningContentDtos(
                  hamdarsQUnitLearningContentTypeDesc: e
                      .hamdarsQUnitLearningContentDtos?[index]
                      .hamdarsQUnitLearningContentTypeDesc,
                  hamdarsQUnitLearningContentTypeURL: e
                      .hamdarsQUnitLearningContentDtos?[index]
                      .hamdarsQUnitLearningContentTypeURL,
                  hamdarsQUnitLearningContentTypeIcon: e
                      .hamdarsQUnitLearningContentDtos?[index]
                      .hamdarsQUnitLearningContentTypeIcon,
                  hamdarsQUnitLearningContentTypeColor: e
                      .hamdarsQUnitLearningContentDtos?[index]
                      .hamdarsQUnitLearningContentTypeColor,
                ),
              ),
            ),
          )
          .toList()

      /*
      .reversed
      .toList()*/
      ;
}
