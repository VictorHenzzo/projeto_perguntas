import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoDoQuiz;
  final int numeroDePerguntas;
  final void Function() funcReiniciarQuestionario;

  Resultado({
    required this.pontuacaoDoQuiz,
    required this.numeroDePerguntas,
    required this.funcReiniciarQuestionario,
  });

  Container get fraseHeading {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              numeroDePerguntas == pontuacaoDoQuiz
                  ? 'Parabéns!'
                  : 'Uh... que pena!',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Text(
            numeroDePerguntas == pontuacaoDoQuiz
                ? 'Você acertou todas as questões!'
                : 'Você acertou $pontuacaoDoQuiz questões de $numeroDePerguntas.\nTente novamente! ;D',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
              ),
              onPressed: funcReiniciarQuestionario,
              child: Text(
                'Reiniciar quiz',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return fraseHeading;
  }
}
