// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:flutter_hiver_tasks/views/areaAdministrador/operacoesAtribuirAtividade/updateAtividadeTecnico.dart';
import 'package:flutter_hiver_tasks/widget/customAppBar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AtividadeTecnicoDetails extends StatefulWidget {
  final formkey = GlobalKey<FormState>();

  AtividadeTecnicoDetails({Key? key}) : super(key: key);
  @override
  _AtividadeTecnicoDetailsState createState() =>
      _AtividadeTecnicoDetailsState();
}

class _AtividadeTecnicoDetailsState extends State<AtividadeTecnicoDetails> {
  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Tecnicos>('tecnicos').listenable();

    return Scaffold(
      appBar: MyAppBar(title: "Lista de Técnicos e atividades"),
      body: ValueListenableBuilder(
        valueListenable: boxform,
        builder: (context, Box<Tecnicos> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text("No data available!",
                  style: TextStyle(fontFamily: 'Montserrat')),
            );
          }
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                Tecnicos? tecnicoBox = box.getAt(index);
                var itens = [];
                if (tecnicoBox != null) {
                  itens.add(tecnicoBox.atividadesAtribuidas);
                }

                return ListTile(
                  title: Text(tecnicoBox!.nome!,
                      style: const TextStyle(
                          fontSize: 20, fontFamily: 'Montserrat')),
                  trailing: tecnicoBox.atividadesAtribuidas != null
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpDateAtividadeTecnico(
                                        id: index,
                                        nomeCurrent: tecnicoBox.nome!,
                                      )),
                            );
                          },
                          child: const Text("Conferir atividades"),
                        )
                      : const Text("Nenhuma atividade"),
                );
              });
        },
      ),
    );
  }
}
