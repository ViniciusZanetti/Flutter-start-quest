import 'package:flutter/material.dart';
import 'package:questions_project/questao.dart';
import 'package:questions_project/respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () => responder(resp['pontuacao'] as int),
          );
        }).toList(),
      ],
    );
  }
}
