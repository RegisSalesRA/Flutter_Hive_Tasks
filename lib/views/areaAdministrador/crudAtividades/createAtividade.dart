// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/css/colors.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:flutter_hiver_tasks/widget/customAppBar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../widget/customSnackBar.dart';

class AdicionarAtividade extends StatefulWidget {
  final formkey = GlobalKey<FormState>();
  @override
  _AdicionarAtividadeState createState() => _AdicionarAtividadeState();
}

class _AdicionarAtividadeState extends State<AdicionarAtividade> {
  String nome = "";
  bool isComplete = false;

  adicioniarAtividade() async {
    if (widget.formkey.currentState!.validate()) {
      Box<Atividades> atividadeBox = Hive.box<Atividades>('atividades');
      atividadeBox.add(Atividades(nome: nome, isComplete: isComplete));
      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar("Atividade criada com sucesso!", 2));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Criar Atividade"),
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
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: adicioniarAtividade,
                    style: ElevatedButton.styleFrom(
                        primary: CustomColors.background),
                    child: const Text('Adicionar Atividade'),
                  ),
                ],
              ))),
    );
  }
}
