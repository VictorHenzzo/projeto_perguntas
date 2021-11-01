import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) funcResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.funcResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        //Converte a lista de strings para lista de widgets
        ...respostas.map((resp) {
          return (Resposta(resp['texto'].toString(),
              () => funcResponder(int.parse(resp['pontuacao'].toString()))));
        }).toList(),
      ],
    );
  }
}
