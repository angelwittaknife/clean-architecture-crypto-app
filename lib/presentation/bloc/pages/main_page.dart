import 'package:crypto_converter/presentation/bloc/crypto_cubit.dart';
import 'package:crypto_converter/presentation/bloc/crypto_state.dart';
import 'package:crypto_converter/presentation/widgets/crypto_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CryptoCubit()..loadAllCrypto(),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<CryptoCubit, CryptoState>(
            builder: (context, state) {
              final size = MediaQuery.sizeOf(context);

              if (state is CryptoLoadingState) {
                return Center(
                  child: SpinKitCubeGrid(
                    color: Colors.green,
                    size: size.height * 0.25,
                  ),
                );
              }
              if (state is CryptoLoadedState) {
                debugPrint('FROM: ${state.from?.name}');
                debugPrint('TO:   ${state.to?.name}');
                debugPrint('AMT:  ${state.fromCount}');
                debugPrint('=> ${state.toCount}');
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CryptoBox(
                              items: state.cryptos,
                              isFrom: true,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              onChanged: (value) {
                                final cubit = context.read<CryptoCubit>();
                                final amount = double.tryParse(value);
                                if (amount != null) {
                                  cubit.updateCrypto(amount: amount);
                                }
                            
                              },

                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Кол-во',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CryptoBox(
                              items: state.cryptos,
                              isFrom: false,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Text(state.toCount.toStringAsFixed(2)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }

              if (state is CryptoFailureState) {
                return Center(child: Text(state.text));
              }

              return Center(child: Text("Unknown state"));
            },
          ),
        ),
      ),
    );
  }
}
