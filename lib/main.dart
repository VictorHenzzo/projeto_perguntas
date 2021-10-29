import './questao.dart';
import 'package:flutter/material.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada == 0
          ? perguntaSelecionada++
          : perguntaSelecionada = 0;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = ['Qual a sua cor favorita?', 'Qual seu animal favorito?'];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Perguntas"),
      ),
      body: Column(
        children: [
          Questao(perguntas[perguntaSelecionada]),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onSurface: Colors.green,
                elevation: 10,
              ),
              child: const Text("Botão 1"),
              onPressed: responder),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onSurface: Colors.green,
                elevation: 10,
              ),
              child: const Text("Botão 2"),
              onPressed: responder),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onSurface: Colors.green,
                elevation: 10,
              ),
              child: const Text("Botão 3"),
              onPressed: responder),
        ],
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
