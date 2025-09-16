import 'package:crypto_converter/core/service_locator.dart';
import 'package:crypto_converter/domain/entity/convert_entity.dart';
import 'package:crypto_converter/domain/repository/crypto_repository.dart';
import 'package:crypto_converter/domain/usecases/use_case.dart';

class ConvertCryptoUseCase implements UseCase<double, ConvertEntity> {
  @override
  Future<double> call({param}) async =>
      sl<CryptoRepository>().convertCurrency(param!);
}
