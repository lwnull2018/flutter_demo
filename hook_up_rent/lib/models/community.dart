
//小区对象
import 'package:json_annotation/json_annotation.dart';

part 'community.g.dart';

@JsonSerializable()
class Community {

  @JsonKey(name: "community")
  final String id;

  @JsonKey(name: "communityName")
  final String name;

  Community(this.id, this.name);

  factory Community.fromJson(Map<String, dynamic> json) => _$CommunityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityToJson(this);

}


List<Community> list = [
  Community('1', '小区一'),
  Community('2', '小区二'),
  Community('3', '小区三'),
  Community('4', '小区四'),
];