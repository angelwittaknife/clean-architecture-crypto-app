

import 'package:crypto_converter/core/errors/failure.dart';
import 'package:crypto_converter/core/service_locator.dart';
import 'package:crypto_converter/domain/entity/crypto_entity.dart';
import 'package:crypto_converter/domain/repository/crypto_repository.dart';
import 'package:crypto_converter/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class GetAllCryptosUseCase
    implements
        UseCase<Either<Failure, List<CryptoEntity>>, dynamic> {
  @override
  Future<Either<Failure, List<CryptoEntity>>> call({param}) async =>
      sl<CryptoRepository>().getAllCurrencyes();
}
