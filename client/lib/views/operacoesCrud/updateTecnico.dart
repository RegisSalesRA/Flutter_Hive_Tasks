 
import 'package:client/model/tecnicos_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UpdateTecnico extends StatefulWidget {
  final int? id;
  final String? nomeCurrent;

  UpdateTecnico({Key? key, this.id, this.nomeCurrent}) : super(key: key);

  final formkey = GlobalKey<FormState>();
  @override
  _UpdateTecnicoState createState() => _UpdateTecnicoState();
}

class _UpdateTecnicoState extends State<UpdateTecnico> {
  String nome = "";
  String descricao = "";

  updateTecnico() async {
    if (widget.formkey.currentState!.validate()) {
      final index = widget.id;
      Tecnicos tecnicoModel = Tecnicos(
        nome: nome,
        descricao: descricao,
      );
      Box<Tecnicos> tecnicoBox = Hive.box<Tecnicos>('tecnicos');
      tecnicoBox.putAt(index!, tecnicoModel);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.nomeCurrent!,
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
                    decoration: InputDecoration(hintText: 'Descrição'),
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
                      onPressed: updateTecnico,
                      child: Text('Atualizar Técnico')),
                ],
              ))),
    );
  }
}
