import 'package:crypto_converter/data/model/crypto_model.dart';

class CryptoEntity {
  final String name;
  final String image;
  final double amount;
  const CryptoEntity(this.name,this.image, this.amount);
  static CryptoEntity fromModel(CryptoModel model)
  {
    return CryptoEntity(model.name, model.image, model.amount);
  }
}
