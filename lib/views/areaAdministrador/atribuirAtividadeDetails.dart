// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:flutter_hiver_tasks/widget/customAppBar.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'operacoesAtribuirAtividade/escolherAtividade.dart';

class AtribuirAtividadeTecnico extends StatefulWidget {
  final formkey = GlobalKey<FormState>();

  AtribuirAtividadeTecnico({Key? key}) : super(key: key);

  @override
  _AtribuirAtividadeTecnicoState createState() =>
      _AtribuirAtividadeTecnicoState();
}

class _AtribuirAtividadeTecnicoState extends State<AtribuirAtividadeTecnico> {
  String nome = "";
  String descricao = "";

  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Tecnicos>('tecnicos').listenable();

    return Scaffold(
        appBar: MyAppBar( 
          title:  "Atribuir Atividade" 
        ),
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
                    Tecnicos? form = box.getAt(index);
                    return ListTile(
                      title: Text(form!.nome!,
                          style: const TextStyle(
                              fontSize: 20, fontFamily: 'Montserrat')),
                      trailing: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EscolherAtividade(
                                        id: index,
                                        nomeCurrent: form.nome!,
                                        descricaoCurrent: form.descricao!,
                                        listaAtividadesCurrent:
                                            form.atividadesAtribuidas,
                                      )));
                        },
                        child: const Text("Adicionar"),
                      ),
                    );
                  });
            }));
  }
}
