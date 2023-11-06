import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() onBack;
  final int pontuacao;

  Resultado(this.onBack, this.pontuacao);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!!';
    } else if (pontuacao < 16) {
      return 'Impressionante!!';
    } else {
      return 'Incrível, nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fraseResultado,
          style: TextStyle(fontSize: 28),
        ),
        TextButton(
          onPressed: onBack,
          child: Text("Volte ao ínicio!!"),
        )
      ],
    ));
  }
}
