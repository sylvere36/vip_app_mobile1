// To parse this JSON data, do
//
//     final vipModel = vipModelFromJson(jsonString);

import 'dart:convert';

VipModel vipModelFromJson(String str) => VipModel.fromJson(json.decode(str));

String vipModelToJson(VipModel data) => json.encode(data.toJson());

class VipModel {
  VipModel({
    this.data,
  });

  List<Datum> data;

  factory VipModel.fromJson(Map<String, dynamic> json) => VipModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.ligue,
    this.photo,
    this.equipes,
    this.winner,
    this.score,
    this.cote,
    this.validate,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String ligue;
  String photo;
  String equipes;
  String winner;
  String score;
  String cote;
  String validate;
  DateTime date;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        ligue: json["ligue"] == null ? null : json["ligue"],
        photo: json["photo"] == null ? null : json["photo"],
        equipes: json["equipes"] == null ? null : json["equipes"],
        winner: json["winner"] == null ? null : json["winner"],
        score: json["score"] == null ? null : json["score"],
        cote: json["cote"] == null ? null : json["cote"],
        validate: json["validate"] == null ? null : json["validate"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "ligue": ligue == null ? null : ligue,
        "photo": photo == null ? null : photo,
        "equipes": equipes == null ? null : equipes,
        "winner": winner == null ? null : winner,
        "score": score == null ? null : score,
        "cote": cote == null ? null : cote,
        "validate": validate == null ? null : validate,
        "date": date == null ? null : date.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
