import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crypto_converter/core/errors/failure.dart';
import 'package:crypto_converter/data/model/crypto_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract interface class CryptoApiService {
  Future<Either<Failure, List<CryptoModel>>> getAllCryptos();
}

class CryptoApiServiceImpl implements CryptoApiService {
  @override
  Future<Either<Failure, List<CryptoModel>>> getAllCryptos() async {
    try {
      final url = Uri.parse(
        'https://api.jsonbin.io/v3/b/68c2ee7b43b1c97be93f8caa',
      );
      final headers = {
        'X-Master-Key': dotenv.env['API_KEY']!,
        'Content-Type': 'application/json',
      };
      final response = await http.get(url,headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final result = (json['record'] as List)
            .map((e) => CryptoModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(result);
      } else {
        return Left(InternetConnectionFailure());
      }
    } on Exception {
      return Left(InternetConnectionFailure());
    }
  }
}
