/// id : "16d52c15-33bc-4c69-bfe1-9e68cb527ac6"
/// name : "فارسی 3"
/// unit_icon : "https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/subjects-exps/adabiyat3-01.svg"
/// sum_user_study : 0
/// hamdarsUserUnitLevelIndex : 0
/// hamdarsUserCurrentUnitLevelPoint : 28
/// hamdarsUserMaxUnitLevelPoint : 45
/// hamdarsUserMinUnitLevelPoint : 0
/// hamdarsQUnitLearningContentDtos : [{"hamdarsQUnitLearningContentTypeDesc":"جزوه","hamdarsQUnitLearningContentTypeURL":"https://taraz.org/Questions/jozve-12-r-farsi3-all?utm_source=hamdarsapp&utm_unit=farsi3&utm_user=A9E14FF7-B588-4D19-90EF-BE4538A1258F","hamdarsQUnitLearningContentTypeIcon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/jozve.svg","hamdarsQUnitLearningContentTypeColor":"00898A"},{"hamdarsQUnitLearningContentTypeDesc":"گام به گام","hamdarsQUnitLearningContentTypeURL":"https://taraz.org/Questions/gambegam-12-r-farsi3-all?utm_source=hamdarsapp&utm_unit=farsi3&utm_user=A9E14FF7-B588-4D19-90EF-BE4538A1258F","hamdarsQUnitLearningContentTypeIcon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/gambegam.svg","hamdarsQUnitLearningContentTypeColor":"1D3F70"},{"hamdarsQUnitLearningContentTypeDesc":"نمونه سوال","hamdarsQUnitLearningContentTypeURL":"https://taraz.org/Questions/sampleq-12-r-farsi3-all?utm_source=hamdarsapp&utm_unit=farsi3&utm_user=A9E14FF7-B588-4D19-90EF-BE4538A1258F","hamdarsQUnitLearningContentTypeIcon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/sampleq.svg","hamdarsQUnitLearningContentTypeColor":"758BEB"},{"hamdarsQUnitLearningContentTypeDesc":"ویدیو","hamdarsQUnitLearningContentTypeURL":"https://taraz.org/Questions/video-12-r-farsi3-all?utm_source=hamdarsapp&utm_unit=farsi3&utm_user=A9E14FF7-B588-4D19-90EF-BE4538A1258F","hamdarsQUnitLearningContentTypeIcon":"https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/video.svg","hamdarsQUnitLearningContentTypeColor":"0CBABA"}]
library;

class Hamdars {
  Hamdars({
    this.id,
    this.name,
    this.unitIcon,
    this.sumUserStudy,
    this.hamdarsUserUnitLevelIndex,
    this.hamdarsUserCurrentUnitLevelPoint,
    this.hamdarsUserMaxUnitLevelPoint,
    this.hamdarsUserMinUnitLevelPoint,
    this.progress,
    this.hamdarsQUnitLearningContentDtos,
  });

  Hamdars.fromJson(final dynamic json) {
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
            ?.add(HamdarsQUnitLearningContentDtos.fromJson(v));
      });
    }
  }

  String? id;
  String? name;
  String? unitIcon;
  int? sumUserStudy;
  int? hamdarsUserUnitLevelIndex;
  num? hamdarsUserCurrentUnitLevelPoint;
  num? hamdarsUserMaxUnitLevelPoint;
  num? hamdarsUserMinUnitLevelPoint;
  num? progress;
  List<HamdarsQUnitLearningContentDtos>? hamdarsQUnitLearningContentDtos;

  Hamdars copyWith({
    final String? id,
    final String? name,
    final String? unitIcon,
    final int? sumUserStudy,
    final int? hamdarsUserUnitLevelIndex,
    final num? hamdarsUserCurrentUnitLevelPoint,
    final num? hamdarsUserMaxUnitLevelPoint,
    final num? hamdarsUserMinUnitLevelPoint,
    final num? progress,
    final List<HamdarsQUnitLearningContentDtos>?
        hamdarsQUnitLearningContentDtos,
  }) =>
      Hamdars(
        id: id ?? this.id,
        name: name ?? this.name,
        unitIcon: unitIcon ?? this.unitIcon,
        sumUserStudy: sumUserStudy ?? this.sumUserStudy,
        hamdarsUserUnitLevelIndex:
            hamdarsUserUnitLevelIndex ?? this.hamdarsUserUnitLevelIndex,
        hamdarsUserCurrentUnitLevelPoint: hamdarsUserCurrentUnitLevelPoint ??
            this.hamdarsUserCurrentUnitLevelPoint,
        hamdarsUserMaxUnitLevelPoint:
            hamdarsUserMaxUnitLevelPoint ?? this.hamdarsUserMaxUnitLevelPoint,
        hamdarsUserMinUnitLevelPoint:
            hamdarsUserMinUnitLevelPoint ?? this.hamdarsUserMinUnitLevelPoint,
        progress: progress ?? this.progress,
        hamdarsQUnitLearningContentDtos: hamdarsQUnitLearningContentDtos ??
            this.hamdarsQUnitLearningContentDtos,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['unit_icon'] = unitIcon;
    map['sum_user_study'] = sumUserStudy;
    map['hamdarsUserUnitLevelIndex'] = hamdarsUserUnitLevelIndex;
    map['hamdarsUserCurrentUnitLevelPoint'] = hamdarsUserCurrentUnitLevelPoint;
    map['hamdarsUserMaxUnitLevelPoint'] = hamdarsUserMaxUnitLevelPoint;
    map['hamdarsUserMinUnitLevelPoint'] = hamdarsUserMinUnitLevelPoint;
    if (hamdarsQUnitLearningContentDtos != null) {
      map['hamdarsQUnitLearningContentDtos'] = hamdarsQUnitLearningContentDtos
          ?.map((final v) => v.toJson())
          .toList();
    }
    return map;
  }
}

/// hamdarsQUnitLearningContentTypeDesc : "جزوه"
/// hamdarsQUnitLearningContentTypeURL : "https://taraz.org/Questions/jozve-12-r-farsi3-all?utm_source=hamdarsapp&utm_unit=farsi3&utm_user=A9E14FF7-B588-4D19-90EF-BE4538A1258F"
/// hamdarsQUnitLearningContentTypeIcon : "https://s3.ir-thr-at1.arvanstorage.com/taraz-public-bucket/app/jozve.svg"
/// hamdarsQUnitLearningContentTypeColor : "00898A"

class HamdarsQUnitLearningContentDtos {
  HamdarsQUnitLearningContentDtos({
    this.hamdarsQUnitLearningContentTypeDesc,
    this.hamdarsQUnitLearningContentTypeURL,
    this.hamdarsQUnitLearningContentTypeIcon,
    this.hamdarsQUnitLearningContentTypeColor,
  });

  HamdarsQUnitLearningContentDtos.fromJson(final dynamic json) {
    hamdarsQUnitLearningContentTypeDesc =
        json['hamdarsQUnitLearningContentTypeDesc'];
    hamdarsQUnitLearningContentTypeURL =
        json['hamdarsQUnitLearningContentTypeURL'];
    hamdarsQUnitLearningContentTypeIcon =
        json['hamdarsQUnitLearningContentTypeIcon'];
    hamdarsQUnitLearningContentTypeColor =
        json['hamdarsQUnitLearningContentTypeColor'];
  }

  String? hamdarsQUnitLearningContentTypeDesc;
  String? hamdarsQUnitLearningContentTypeURL;
  String? hamdarsQUnitLearningContentTypeIcon;
  String? hamdarsQUnitLearningContentTypeColor;

  HamdarsQUnitLearningContentDtos copyWith({
    final String? hamdarsQUnitLearningContentTypeDesc,
    final String? hamdarsQUnitLearningContentTypeURL,
    final String? hamdarsQUnitLearningContentTypeIcon,
    final String? hamdarsQUnitLearningContentTypeColor,
  }) =>
      HamdarsQUnitLearningContentDtos(
        hamdarsQUnitLearningContentTypeDesc:
            hamdarsQUnitLearningContentTypeDesc ??
                this.hamdarsQUnitLearningContentTypeDesc,
        hamdarsQUnitLearningContentTypeURL:
            hamdarsQUnitLearningContentTypeURL ??
                this.hamdarsQUnitLearningContentTypeURL,
        hamdarsQUnitLearningContentTypeIcon:
            hamdarsQUnitLearningContentTypeIcon ??
                this.hamdarsQUnitLearningContentTypeIcon,
        hamdarsQUnitLearningContentTypeColor:
            hamdarsQUnitLearningContentTypeColor ??
                this.hamdarsQUnitLearningContentTypeColor,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hamdarsQUnitLearningContentTypeDesc'] =
        hamdarsQUnitLearningContentTypeDesc;
    map['hamdarsQUnitLearningContentTypeURL'] =
        hamdarsQUnitLearningContentTypeURL;
    map['hamdarsQUnitLearningContentTypeIcon'] =
        hamdarsQUnitLearningContentTypeIcon;
    map['hamdarsQUnitLearningContentTypeColor'] =
        hamdarsQUnitLearningContentTypeColor;
    return map;
  }
}
