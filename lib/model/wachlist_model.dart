class Wachlist {
  List<MoviList>? moviList;
  bool? isPublic;
  String? name;

  Wachlist({this.moviList, this.isPublic, this.name});

  Wachlist.fromJson(Map<String, dynamic> json) {
    if (json['movi_list'] != null) {
      moviList = <MoviList>[];
      json['movi_list'].forEach((v) {
        moviList!.add(MoviList.fromJson(v));
      });
    }
    isPublic = json['is_public'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (moviList != null) {
      data['movi_list'] = moviList!.map((v) => v.toJson()).toList();
    }
    data['is_public'] = isPublic;
    data['name'] = name;
    return data;
  }
}

class MoviList {
  String? imgUrl;
  String? name;
  String? id;

  MoviList({this.imgUrl, this.name, this.id});

  MoviList.fromJson(Map<String, dynamic> json) {
    imgUrl = json['img_url'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img_url'] = imgUrl;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
