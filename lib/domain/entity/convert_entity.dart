import 'package:crypto_converter/domain/entity/crypto_entity.dart';

class ConvertEntity {
  final CryptoEntity from;
  final CryptoEntity to;
  final double amount;

  ConvertEntity(this.from, this.to, this.amount);
}
