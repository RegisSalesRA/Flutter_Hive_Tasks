// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:flutter_hiver_tasks/widget/customAppBar.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../widget/customSnackBar.dart';

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

      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar("Tecnico atualizado com sucesso!", 2));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.nomeCurrent!,
      ),
      body: Form(
          key: widget.formkey,
          child: Container(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Por favor preencher os dados";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'Title'),
                    onChanged: (value) {
                      setState(() {
                        nome = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Por favor preencher os dados";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: 'Descrição'),
                    onChanged: (value) {
                      setState(() {
                        descricao = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      onPressed: updateTecnico,
                      child: const Text('Atualizar Técnico')),
                ],
              ))),
    );
  }
}
