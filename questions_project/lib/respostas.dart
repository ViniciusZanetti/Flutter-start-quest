import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  final void Function() onSelect;

  Resposta(this.texto, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
        child: Text(
          this.texto,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onSelect,
      ),
    );
  }
}
