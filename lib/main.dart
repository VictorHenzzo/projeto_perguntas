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
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 1},
        {'texto': 'Preto', 'pontuacao': 0},
        {'texto': 'Verde', 'pontuacao': 0},
        {'texto': 'Rosa', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Gato', 'pontuacao': 0},
        {'texto': 'Cachorro', 'pontuacao': 1},
        {'texto': 'Pássaro', 'pontuacao': 0},
        {'texto': 'Peixe', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Qual é o seu instrumento favorito?',
      'respostas': [
        {'texto': 'Guitarra', 'pontuacao': 1},
        {'texto': 'Baixo', 'pontuacao': 0},
        {'texto': 'Bateria', 'pontuacao': 0},
        {'texto': 'Teclado', 'pontuacao': 0},
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
