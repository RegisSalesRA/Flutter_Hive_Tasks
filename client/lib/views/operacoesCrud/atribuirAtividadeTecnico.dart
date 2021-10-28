import 'package:flutter/material.dart';

class AtribuirAtividadeTecnico extends StatefulWidget {
  const AtribuirAtividadeTecnico({Key? key}) : super(key: key);

  @override
  _AtribuirAtividadeTecnicoState createState() =>
      _AtribuirAtividadeTecnicoState();
}

class _AtribuirAtividadeTecnicoState extends State<AtribuirAtividadeTecnico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Atribuir Atividade"),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Text("Ola"), Text("Ola")],
        ),
      ),
    );
  }
}
