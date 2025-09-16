import 'package:flutter/material.dart';

class InputKeyboard extends StatelessWidget {
  const InputKeyboard({super.key});

  @override
  Widget build(Object context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          9,
          (i) => InkWell(
            onTap: () {},
            child: Center(child: Text("${i + 1}")),
          ),
        ),
      ),
    );
  }
}
