import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/css/colors.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:flutter_hiver_tasks/widget/customAppBar.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../widget/customSnackBar.dart';

class TecnicoForm extends StatefulWidget {
  var id = null;
  final formkey = GlobalKey<FormState>();
  TecnicoForm({Key? key, this.id}) : super(key: key);
  @override
  _TecnicoFormState createState() => _TecnicoFormState();
}

class _TecnicoFormState extends State<TecnicoForm> {
  String nome = "";

  formTecnico() async {
    var index = widget.id;
    if (index == null) {
      if (widget.formkey.currentState!.validate()) {
        Box<Tecnicos> tecnicoBox = Hive.box<Tecnicos>('tecnicos');
        tecnicoBox.add(Tecnicos(
          nome: nome,
        ));
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar("Tecnico atualizado com sucesso!", 2));
        Navigator.of(context).pop();
      }
    } else {
      if (widget.formkey.currentState!.validate()) {
        Tecnicos tecnicoModel = Tecnicos(
          nome: nome,
        );
        Box<Tecnicos> tecnicoBox = Hive.box<Tecnicos>('tecnicos');
        tecnicoBox.putAt(index!, tecnicoModel);

        ScaffoldMessenger.of(context)
            .showSnackBar(snackbar("Tecnico atualizado com sucesso!", 2));
        Navigator.of(context).pop();
      }
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
                  const SizedBox(
                    height: 55,
                  ),
                  ElevatedButton(
                      onPressed: formTecnico,
                      style: ElevatedButton.styleFrom(
                          primary: CustomColors.background),
                      child: const Text('Adicionar Técnico')),
                ],
              ))),
    );
  }
}
