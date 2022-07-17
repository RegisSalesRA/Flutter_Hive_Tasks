// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/css/colors.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:flutter_hiver_tasks/widget/customAppBar.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../widget/customSnackBar.dart';

class CreateTecnico extends StatefulWidget {
  final formkey = GlobalKey<FormState>();

  CreateTecnico({Key? key}) : super(key: key);
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
          .showSnackBar(snackbar("Tecnico atualizado com sucesso!", 2));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Criar de Tecnicos",
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
                    decoration: const InputDecoration(hintText: 'Descricao'),
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
                      onPressed: adicionarTecnico,
                      style: ElevatedButton.styleFrom(
                          primary: CustomColors.background),
                      child: const Text('Adicionar Técnico')),
                ],
              ))),
    );
  }
}
