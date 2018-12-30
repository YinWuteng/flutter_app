import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

//告诉生成器，这个类是需要成Model类的
@JsonSerializable()
class Data{
  String name;
  String email;

  Data(this.name, this.email);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
