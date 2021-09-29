import 'dart:convert';

class Employer {
  Employer({
    this.id,
    this.name,
    this.image,
    this.logo
  });

  int? id;
  String? name;
  String? image;
  String? logo;

  factory Employer.fromJson(String str) => Employer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Employer.fromMap(Map<String, dynamic> json) => Employer(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    logo: json["logo"] == null ? null : json["logo"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "logo": logo == null ? null : logo,
  };
}