import 'package:crypto_converter/core/errors/failure.dart';
import 'package:crypto_converter/domain/entity/convert_entity.dart';
import 'package:crypto_converter/domain/entity/crypto_entity.dart';
import 'package:dartz/dartz.dart';
abstract class CryptoRepository {
  Future<Either<Failure,List<CryptoEntity>>> getAllCurrencyes();
  Future<double> convertCurrency(ConvertEntity convert);
}