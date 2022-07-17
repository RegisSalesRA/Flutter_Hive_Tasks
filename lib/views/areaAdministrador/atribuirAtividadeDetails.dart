// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/css/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Tecnicos>('tecnicos').listenable();

    return Scaffold(
        appBar: MyAppBar(title: "Atribuir Atividade"),
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
                    Tecnicos? atribuirAtividade = box.getAt(index);
                    return Container(
                      height: 50,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: CustomColors.backgroundCards,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ],
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Text(atribuirAtividade!.nome!,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 20,
                                      fontFamily: 'Montserrat')),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EscolherAtividade(
                                              id: index,
                                              nomeCurrent:
                                                  atribuirAtividade.nome!,
                                              listaAtividadesCurrent:
                                                  atribuirAtividade
                                                      .atividadesAtribuidas,
                                            )));
                              },
                              child: const Text("Adicionar",
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: 'Montserrat')),
                            ),
                          ]),
                    );
                  });
            }));
  }
}
