import 'package:crypto_converter/domain/entity/crypto_entity.dart';
import 'package:crypto_converter/presentation/bloc/crypto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoBox extends StatefulWidget {
  const CryptoBox({super.key, required this.items, required this.isFrom});
  final List<CryptoEntity> items;
  final bool isFrom;

  @override
  State<CryptoBox> createState() => _CryptoBoxState();
}

class _CryptoBoxState extends State<CryptoBox> {
  // final CryptoEntity currency;
  CryptoEntity? _selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: DropdownButton<CryptoEntity>(
        isExpanded: true,
        value: _selected,
        hint: Text('Выберите криптовалюту'),
        items: widget.items.map((crypto) {
          return DropdownMenuItem<CryptoEntity>(
            value: crypto,
            child: Row(
              children: [
                Image.network(crypto.image,scale: 0.5),
                SizedBox(width: 8),
                Text(crypto.name),
                Spacer(),
                Text(crypto.amount.toString()),
              ],
            ),
          );
        }).toList(),

        onChanged: (value) {
          setState(() {
          _selected = value!;

          });
          final cubit = context.read<CryptoCubit>();
          if (widget.isFrom) {
            cubit.updateCrypto(from: value);
          } else {
            cubit.updateCrypto(to: value);
          }
        },
      ),
    );
  }
}
