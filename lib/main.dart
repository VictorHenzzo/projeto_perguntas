import './questionario.dart';
import './resultado.dart';
import 'package:flutter/material.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto':
          'Dois pais e dois filhos sentaram-se para comer ovos no café da manhã. Cada um comeu um ovo. Quanto ovos eles comeram no total?',
      'respostas': [
        {'texto': '1', 'pontuacao': 0},
        {'texto': '3', 'pontuacao': 1},
        {'texto': '5', 'pontuacao': 0},
        {'texto': '8', 'pontuacao': 0},
      ]
    },
    {
      'texto':
          'Andando por uma rua, um homem conta 10 árvores à sua direita. Na volta, conta 10 árvores à sua esquerda. Quantas árvores ele viu no total?',
      'respostas': [
        {'texto': '10', 'pontuacao': 1},
        {'texto': '20', 'pontuacao': 0},
        {'texto': '30', 'pontuacao': 0},
        {'texto': '40', 'pontuacao': 0},
      ]
    },
    {
      'texto':
          'Uma mãe tem 30 reais para dividir entre duas filhas. Qual o horário?',
      'respostas': [
        {'texto': '11:50', 'pontuacao': 0},
        {'texto': '13:45', 'pontuacao': 1},
        {'texto': '19:03', 'pontuacao': 0},
        {'texto': '09:30', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Se ontem fosse amanhã, hoje seria sexta-feira. Que dia é hoje?',
      'respostas': [
        {'texto': 'Sexta-feira', 'pontuacao': 0},
        {'texto': 'Domingo', 'pontuacao': 0},
        {'texto': 'Quarta-feira', 'pontuacao': 1},
        {'texto': 'Quinta-feira', 'pontuacao': 0},
      ]
    },
    {
      'texto':
          'Uma garafa com sua rolha custa R\$1,10. Sabendo que a garrafa custa R\$1,00 a mais que a rolha, qual é o preço da rolha?',
      'respostas': [
        {'texto': 'R\$0,50', 'pontuacao': 0},
        {'texto': 'R\$0,10', 'pontuacao': 0},
        {'texto': 'R\$0,05', 'pontuacao': 1},
        {'texto': 'R\$0,01', 'pontuacao': 0},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Perguntas"),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: perguntaSelecionada,
              funcResponder: _responder,
            )
          : Resultado(
              pontuacaoDoQuiz: pontuacaoTotal,
              numeroDePerguntas: perguntaSelecionada,
              funcReiniciarQuestionario: _reiniciarQuestionario,
            ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
