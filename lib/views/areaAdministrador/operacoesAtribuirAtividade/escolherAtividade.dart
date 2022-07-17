// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:flutter_hiver_tasks/widget/customAppBar.dart';
import 'package:flutter_hiver_tasks/widget/customSnackBar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EscolherAtividade extends StatefulWidget {
  final int? id;
  final String? nomeCurrent;
  final List<Atividades>? listaAtividadesCurrent;

  const EscolherAtividade(
      {Key? key, this.id, this.nomeCurrent, this.listaAtividadesCurrent})
      : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _EscolherAtividadeState createState() => _EscolherAtividadeState();
}

class _EscolherAtividadeState extends State<EscolherAtividade> {
  var boxAtividades = Hive.box<Atividades>('atividades').listenable();

  List<Atividades> listaAdicionadas = [];

  void adicionarTarefa() {
    final id = widget.id;

    List<Atividades> listaAdicionadas2 = [];

    if (widget.listaAtividadesCurrent != null ||
        widget.listaAtividadesCurrent != []) {
      print(widget.listaAtividadesCurrent);

      for (var iten in listaAdicionadas) {
        listaAdicionadas2.add(iten);
      }
    } else {
      List<Atividades> listaAdicionadas2 = [...widget.listaAtividadesCurrent!];
      for (var iten in listaAdicionadas) {
        listaAdicionadas2.add(iten);
      }
    }

    if (listaAdicionadas2 != []) {
      Tecnicos tecnicoModel = Tecnicos(
        nome: widget.nomeCurrent,
        atividadesAtribuidas: listaAdicionadas2,
      );

      Box<Tecnicos> tecnicoBox = Hive.box<Tecnicos>('tecnicos');
      tecnicoBox.putAt(id!, tecnicoModel);

      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar("A Atividade para ${tecnicoModel.nome}!", 2));
    } else {
      print("Não foi possível adicionar");
    }
  }

  void checarSeExiste(Atividades indexAtividade) {
    if (listaAdicionadas.contains(indexAtividade)) {
      ScaffoldMessenger.of(context).showSnackBar(
          snackbar("A Atividade ${indexAtividade.nome} já foi adicionada!", 2));
    } else {
      listaAdicionadas.add(indexAtividade);
    }
    print(listaAdicionadas.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          adicionarTarefa();
        },
        child: const Text("OK"),
      ),
      appBar: MyAppBar(title: widget.nomeCurrent!),
      body: ValueListenableBuilder(
        valueListenable: boxAtividades,
        builder: (context, Box<Atividades?> atividadeBox, _) {
          if (atividadeBox.isEmpty) {
            return const Center(
              child: Text("No data available!",
                  style: TextStyle(fontFamily: 'Montserrat')),
            );
          }

          return ListView.builder(
              itemCount: atividadeBox.length,
              itemBuilder: (context, index) {
                List<Atividades?> atividadesListas =
                    atividadeBox.values.toList();
                return ListTile(
                  title: Text(atividadesListas[index]!.nome.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontFamily: 'Montserrat')),
                  onLongPress: () async {
                    checarSeExiste(atividadesListas[index]!);

//                    await atividadeBox.deleteAt(index);

                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Center(
                            child: Text('Deseja adicionar a atividade?')),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  atividadeBox.deleteAt(index);
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
