part of 'objects.dart';

@JsonSerializable()
class UserModel {
  late String uid;
  @JsonKey(name: 'phone')
  late String phoneNo;
  late String name;
  late String email;
  AddressModel? address;

  UserModel({
    required this.uid,
    required this.phoneNo,
    required this.email,
    required this.name,
    this.address,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  // UserModel.fromMap(Map map) {
  //   uid = map['uid'];
  //   phoneNo = map['phone'];
  //   name = map['name'];
  //   email = map['email'];
  // }
}
