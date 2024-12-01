import 'package:json_annotation/json_annotation.dart';

//JSON解析的部分放在这个文件，该文件的另外一部分放在另外一个文件
part 'user_info.g.dart';

//用户信息bean
@JsonSerializable()
class UserInfo {
  final String avatar;
  final String gender;
  final String nickname;
  final String phone;
  final int id;

  UserInfo(this.avatar, this.gender, this.nickname, this.phone, this.id);

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}