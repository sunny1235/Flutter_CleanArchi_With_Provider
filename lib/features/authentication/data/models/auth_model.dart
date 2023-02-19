import 'package:flutter_ca_demo/features/authentication/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';
@JsonSerializable()
class AuthModel extends AuthEntity {
  AuthModel({
    required super.email,
    required super.password,
  });


  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

