import 'package:flutter/material.dart';
import 'package:questions_project/questionario.dart';
import 'package:questions_project/resultado.dart';

main() => runApp(new PerguntaApp());

@override
class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoFinal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 4},
        {'texto': 'Elefante', 'pontuacao': 7},
        {'texto': 'Leão', 'pontuacao': 3},
      ]
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Larissa', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 4},
        {'texto': 'Léo', 'pontuacao': 6},
        {'texto': 'Vinicius', 'pontuacao': 10},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoFinal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _back() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoFinal = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Perguntas"),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder,
                  )
                : Resultado(_back, _pontuacaoFinal)));
  }
}
