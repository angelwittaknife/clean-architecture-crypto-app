import 'package:crypto_converter/domain/entity/crypto_entity.dart';
import 'package:equatable/equatable.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object?> get props => [];
}

class CryptoEmptyState extends CryptoState {}

class CryptoLoadingState extends CryptoState {}

class CryptoLoadedState extends CryptoState {
  final List<CryptoEntity> cryptos;
  final CryptoEntity? from;
  final CryptoEntity? to;
  final double fromCount;
  final double toCount;

  const CryptoLoadedState({
    required this.cryptos,
    this.from,
    this.to,
    this.fromCount = 0,
    this.toCount = 0,
  });

  @override
  List<Object?> get props => [
    cryptos,
    from,
    to,
    fromCount,
    toCount,
  ];

  CryptoLoadedState copyWith({
    List<CryptoEntity>? cryptos,
    CryptoEntity? from,
    CryptoEntity? to,
    double? fromCount,
    double? toCount,
  }) {
    return CryptoLoadedState(
      cryptos: cryptos ?? this.cryptos,
      from:    from    ?? this.from,
      to:      to      ?? this.to,
      fromCount: fromCount ?? this.fromCount,
      toCount:   toCount   ?? this.toCount,
    );
  }
}



class CryptoFailureState extends CryptoState {
  final String text;

  const CryptoFailureState(this.text);
}
