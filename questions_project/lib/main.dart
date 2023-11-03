import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

main() => runApp(new PerguntaApp());

@override
class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    print(_perguntaSelecionada);
  }

  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?'
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Perguntas"),
      ),
      body: Column(
        children: [
          Questao(perguntas[_perguntaSelecionada]),
          Resposta('Resposta 1'),
          Resposta('Resposta 2'),
          Resposta('Resposta 3'),
        ],
      ),
    ));
  }
}
