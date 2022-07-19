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
  List<Atividades> listasDeAtividadesNaMemoria = [];

  void adicionarTarefa(Atividades indexAtividade) {
    final id = widget.id;
    List<Atividades> listaDeAtividades = [];
    try {
      if (widget.listaAtividadesCurrent == [] ||
          widget.listaAtividadesCurrent == null) {
        listasDeAtividadesNaMemoria.add(indexAtividade);
        for (var iten in listasDeAtividadesNaMemoria) {
          listaDeAtividades.add(iten);
        }
        Tecnicos tecnicoModel = Tecnicos(
          nome: widget.nomeCurrent,
          atividadesAtribuidas: listaDeAtividades,
        );

        Box<Tecnicos> tecnicoBox = Hive.box<Tecnicos>('tecnicos');
        tecnicoBox.putAt(id!, tecnicoModel);
        ScaffoldMessenger.of(context).showSnackBar(
            snackbar("A Atividade para ${tecnicoModel.nome}!", 2));
      } else {
        listasDeAtividadesNaMemoria.add(indexAtividade);
        for (var iten in listasDeAtividadesNaMemoria) {
          listaDeAtividades.add(iten);
          listaDeAtividades.addAll(widget.listaAtividadesCurrent!);
        }
        print(listaDeAtividades.length);
        var listasAtividadesSet = listaDeAtividades.toSet().toList();
        Tecnicos tecnicoModel = Tecnicos(
          nome: widget.nomeCurrent,
          atividadesAtribuidas: listasAtividadesSet,
        );
        Box<Tecnicos> tecnicoBox = Hive.box<Tecnicos>('tecnicos');
        tecnicoBox.putAt(id!, tecnicoModel);
        ScaffoldMessenger.of(context).showSnackBar(
            snackbar("A Atividade para ${tecnicoModel.nome}!", 2));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  adicionarTarefa(atividadesListas[index]!);
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
