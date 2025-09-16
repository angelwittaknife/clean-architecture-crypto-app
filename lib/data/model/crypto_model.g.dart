// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoModel _$CryptoModelFromJson(Map<String, dynamic> json) => CryptoModel(
  json['name'] as String,
  json['image'] as String,
  (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$CryptoModelToJson(CryptoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'amount': instance.amount,
    };
