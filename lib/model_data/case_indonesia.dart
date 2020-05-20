import 'dart:convert';

List<CaseIndonesia> caseIndonesiaFromJson(String str) => List<CaseIndonesia>.from(json.decode(str).map((x) => CaseIndonesia.fromJson(x)));

String caseIndonesiaToJson(List<CaseIndonesia> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CaseIndonesia {
  String name;
  String positif;
  String sembuh;
  String meninggal;

  CaseIndonesia({
    this.name,
    this.positif,
    this.sembuh,
    this.meninggal,
  });

  factory CaseIndonesia.fromJson(Map<String, dynamic> json) => CaseIndonesia(
    name: json["name"],
    positif: json["positif"],
    sembuh: json["sembuh"],
    meninggal: json["meninggal"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "positif": positif,
    "sembuh": sembuh,
    "meninggal": meninggal,
  };
}