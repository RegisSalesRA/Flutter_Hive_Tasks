// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../widget/customSnackBar.dart';

class UpdateAtividade extends StatefulWidget {
  final int? id;
  final String? nomeCurrent;

  UpdateAtividade({Key? key, this.id, this.nomeCurrent}) : super(key: key);

  final formkey = GlobalKey<FormState>();
  @override
  _UpdateAtividadeState createState() => _UpdateAtividadeState();
}

class _UpdateAtividadeState extends State<UpdateAtividade> {
  String nome = "";
  bool isComplete = false;

  submitData() async {
    if (widget.formkey.currentState!.validate()) {
      final index = widget.id;
      Atividades atividadeModel =
          Atividades(nome: nome, isComplete: isComplete);
      Box<Atividades> atividadeBox = Hive.box<Atividades>('atividades');
      atividadeBox.putAt(index!, atividadeModel);

      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar("Atividade atualizada com sucesso!",2));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.nomeCurrent!,
            style: const TextStyle(fontFamily: 'Montserrat')),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Checkbox(
                      value: isComplete,
                      activeColor: Colors.orange,
                      onChanged: (bool? valor) {
                        setState(() {
                          isComplete = valor!;
                        });
                      },
                    ),
                    const Text(
                      'is completed?',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  const SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      onPressed: submitData, child: const Text('Submit Data')),
                ],
              ))),
    );
  }
}
