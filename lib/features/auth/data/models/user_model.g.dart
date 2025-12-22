// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      restaurantId: (json['restaurant_id'] as num).toInt(),
      restaurantName: json['restaurant_name'] as String?,
      branchId: (json['branch_id'] as num).toInt(),
      branchName: json['branch_name'] as String?,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'restaurant_id': instance.restaurantId,
      'restaurant_name': instance.restaurantName,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'roles': instance.roles,
      'permissions': instance.permissions,
    };

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AuthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$AuthDataImpl _$$AuthDataImplFromJson(Map<String, dynamic> json) =>
    _$AuthDataImpl(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      tokenType: json['token_type'] as String?,
    );

Map<String, dynamic> _$$AuthDataImplToJson(_$AuthDataImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'token_type': instance.tokenType,
    };
