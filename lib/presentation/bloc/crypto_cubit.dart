import 'package:crypto_converter/core/service_locator.dart';
import 'package:crypto_converter/domain/entity/convert_entity.dart';
import 'package:crypto_converter/domain/entity/crypto_entity.dart';
import 'package:crypto_converter/domain/usecases/convert_crypto_usecase.dart';
import 'package:crypto_converter/domain/usecases/get_all_cryptos_usecase.dart';
import 'package:crypto_converter/presentation/bloc/crypto_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCubit extends Cubit<CryptoState> {
  CryptoCubit() : super(CryptoEmptyState());

  Future<void> emitLoading() async {
    emit(CryptoLoadingState());
  }

  Future<void> loadAllCrypto() async {
    emit(CryptoLoadingState());
    final result = await sl<GetAllCryptosUseCase>()();
    result.fold(
      (_) => emit(CryptoFailureState("Lost Internet connection")),
      (data) => emit(CryptoLoadedState(cryptos: data)),
    );
  }

  Future<void> updateCrypto({
    CryptoEntity? from,
    CryptoEntity? to,
    double? amount,
  }) async {
    if (state is! CryptoLoadedState) return;
    final current = state as CryptoLoadedState;

    final updated = current.copyWith(
      from: from,
      to: to,
      fromCount: amount,
    );

    emit(updated);

    if (updated.from != null && updated.to != null && updated.fromCount > 0) {
      final result = await sl<ConvertCryptoUseCase>()(
        param: ConvertEntity(updated.from!, updated.to!, updated.fromCount),
      );
      emit(updated.copyWith(toCount: result));
    }
  }
}
