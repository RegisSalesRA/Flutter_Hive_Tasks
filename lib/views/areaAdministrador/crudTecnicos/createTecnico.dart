 
import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../widget/customSnackBar.dart';

class CreateTecnico extends StatefulWidget {
  final formkey = GlobalKey<FormState>();
  @override
  _CreateTecnicoState createState() => _CreateTecnicoState();
}

class _CreateTecnicoState extends State<CreateTecnico> {
  String nome = "";
  String descricao = "";
  List<Atividades> atividadesAtribuidas = [];

  adicionarTecnico() async {
    if (widget.formkey.currentState!.validate()) {
      Box<Tecnicos> tecnicoBox = Hive.box<Tecnicos>('tecnicos');
      tecnicoBox.add(Tecnicos(
        nome: nome,
        descricao: descricao,
      ));
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar("Tecnico atualizado com sucesso!"));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Criar de Tecnicos",
            style: TextStyle(fontFamily: 'Montserrat')),
      ),
      body: Form(
          key: widget.formkey,
          child: Container(
              padding: EdgeInsets.all(15),
              child: ListView(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Por favor preencher os dados";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Title'),
                    onChanged: (value) {
                      setState(() {
                        nome = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Por favor preencher os dados";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'Descricao'),
                    onChanged: (value) {
                      setState(() {
                        descricao = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      onPressed: adicionarTecnico, child: Text('Submit Data')),
                ],
              ))),
    );
  }
}