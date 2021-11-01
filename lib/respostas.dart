/*
-Criar componente stateless
-Criar contrutor que recebe texto
-Inserir no raised button onPressed
*/

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onPressedArgument;

  Resposta(this.texto, this.onPressedArgument);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onSurface: Colors.green,
            elevation: 5,
          ),
          child: Text(texto),
          onPressed: onPressedArgument),
    );
  }
}
