import 'package:client/model/atividade_model.dart';
import 'package:client/model/tecnicos_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UpDateAtividadeTecnico extends StatefulWidget {
  @override
  _UpDateAtividadeTecnicoState createState() => _UpDateAtividadeTecnicoState();
}

class _UpDateAtividadeTecnicoState extends State<UpDateAtividadeTecnico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Atividade completa/incompleta"),
    ));
  }
}
