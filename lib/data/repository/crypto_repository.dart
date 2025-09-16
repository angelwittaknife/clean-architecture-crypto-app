import 'package:crypto_converter/core/errors/failure.dart';
import 'package:crypto_converter/core/service_locator.dart';
import 'package:crypto_converter/data/datasources/crypto_api_service.dart';
import 'package:crypto_converter/domain/entity/convert_entity.dart';
import 'package:crypto_converter/domain/entity/crypto_entity.dart';
import 'package:crypto_converter/domain/repository/crypto_repository.dart';
import 'package:dartz/dartz.dart';

class CryptoRepositoryImpl extends CryptoRepository {
  final _api = sl<CryptoApiService>();
  @override
  Future<double> convertCurrency(
    ConvertEntity convert
  ) async => (convert.from.amount / convert.to.amount) * convert.amount;

  @override
  Future<Either<Failure, List<CryptoEntity>>> getAllCurrencyes() async {
    final result = await _api.getAllCryptos();
    return result.fold(
      Left.new,
      (data) => Right(data.map((e) => CryptoEntity.fromModel(e)).toList()),
    );
  }
}
