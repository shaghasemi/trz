class HamDarsUnitModel {
  String? hamdarsQUnitLearningContentTypeDesc;
  String? hamdarsQUnitLearningContentTypeURL;
  String? hamdarsQUnitLearningContentTypeIcon;
  String? hamdarsQUnitLearningContentTypeColor;

  HamDarsUnitModel({
    this.hamdarsQUnitLearningContentTypeDesc,
    this.hamdarsQUnitLearningContentTypeURL,
    this.hamdarsQUnitLearningContentTypeIcon,
    this.hamdarsQUnitLearningContentTypeColor,
  });

  HamDarsUnitModel.fromJson(final dynamic json) {
    hamdarsQUnitLearningContentTypeDesc =
        json['hamdarsQUnitLearningContentTypeDesc'];
    hamdarsQUnitLearningContentTypeURL =
        json['hamdarsQUnitLearningContentTypeURL'];
    hamdarsQUnitLearningContentTypeIcon =
        json['hamdarsQUnitLearningContentTypeIcon'];
    hamdarsQUnitLearningContentTypeColor =
        json['hamdarsQUnitLearningContentTypeColor'];
  }
}
