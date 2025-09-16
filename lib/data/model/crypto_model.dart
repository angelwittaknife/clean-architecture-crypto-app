import 'package:json_annotation/json_annotation.dart';

part 'crypto_model.g.dart';

@JsonSerializable()
class CryptoModel {
  final String name;
  final String image;
  final double amount;
  const CryptoModel(this.name,this.image, this.amount);

  factory CryptoModel.fromJson(Map<String,dynamic> json)=>_$CryptoModelFromJson(json);

}
