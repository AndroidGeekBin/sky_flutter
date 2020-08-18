//  flutter pub run build_runner build --delete-conflicting-outputs

import 'package:json_annotation/json_annotation.dart';

part  'net_beans.g.dart';
//beans
@JsonSerializable()
class LoginRsponse {
  String mobile;
  String number;

  LoginRsponse(this.mobile, this.number);
}
