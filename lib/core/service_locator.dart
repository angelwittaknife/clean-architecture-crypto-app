import 'package:crypto_converter/data/datasources/crypto_api_service.dart';
import 'package:crypto_converter/data/repository/crypto_repository.dart';
import 'package:crypto_converter/domain/repository/crypto_repository.dart';
import 'package:crypto_converter/domain/usecases/convert_crypto_usecase.dart';
import 'package:crypto_converter/domain/usecases/get_all_cryptos_usecase.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerLazySingleton<CryptoApiService>(CryptoApiServiceImpl.new)
    ..registerLazySingleton<GetAllCryptosUseCase>(GetAllCryptosUseCase.new)
    ..registerLazySingleton<ConvertCryptoUseCase>(ConvertCryptoUseCase.new)
    ..registerLazySingleton<CryptoRepository>(CryptoRepositoryImpl.new);
}
