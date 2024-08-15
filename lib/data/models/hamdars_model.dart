import 'package:hamdars/data/models/hamdars_unit_model.dart';

class HamDarsModel {
  String? id;
  String? name;
  String? unitIcon;
  num? sumUserStudy;
  num? hamdarsUserUnitLevelIndex;
  num? hamdarsUserCurrentUnitLevelPoint;
  num? hamdarsUserMaxUnitLevelPoint;
  num? hamdarsUserMinUnitLevelPoint;
  List<HamDarsUnitModel>? hamdarsQUnitLearningContentDtos;

  HamDarsModel({
    this.id,
    this.name,
    this.unitIcon,
    this.sumUserStudy,
    this.hamdarsUserUnitLevelIndex,
    this.hamdarsUserCurrentUnitLevelPoint,
    this.hamdarsUserMaxUnitLevelPoint,
    this.hamdarsUserMinUnitLevelPoint,
    this.hamdarsQUnitLearningContentDtos,
  });

  HamDarsModel.fromJson(final dynamic json) {
    id = json['id'];
    name = json['name'];
    unitIcon = json['unit_icon'];
    sumUserStudy = json['sum_user_study'];
    hamdarsUserUnitLevelIndex = json['hamdarsUserUnitLevelIndex'];
    hamdarsUserCurrentUnitLevelPoint = json['hamdarsUserCurrentUnitLevelPoint'];
    hamdarsUserMaxUnitLevelPoint = json['hamdarsUserMaxUnitLevelPoint'];
    hamdarsUserMinUnitLevelPoint = json['hamdarsUserMinUnitLevelPoint'];
    if (json['hamdarsQUnitLearningContentDtos'] != null) {
      hamdarsQUnitLearningContentDtos = [];
      json['hamdarsQUnitLearningContentDtos'].forEach((final v) {
        hamdarsQUnitLearningContentDtos
            ?.add(HamDarsUnitModel.fromJson(v));
      });
    }
  }


}
