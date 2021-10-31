import 'package:client/model/atividade_model.dart';
import 'package:client/model/tecnicos_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EscolherAtividade extends StatefulWidget {
  final int? id;
  final String? nomeCurrent;
  final String? descricaoCurrent;
  EscolherAtividade(
      {Key? key, this.id, this.nomeCurrent, this.descricaoCurrent})
      : super(key: key);
  @override
  _EscolherAtividadeState createState() => _EscolherAtividadeState();
}

class _EscolherAtividadeState extends State<EscolherAtividade> {

  
  var boxAtividades = Hive.box<Atividades>('atividades').listenable();
  Box<Tecnicos> boxTecnicos = Hive.box<Tecnicos>('tecnicos');

  List<Atividades> listaAdicionadas = [];

  // List<Atividades> listaJaAdicionadas = boxTecnicos.

  void adicionarTarefa() {
    final id = widget.id;

    List<Atividades> listaAdicionadas2 = [];
    for (var iten in listaAdicionadas) {
      listaAdicionadas2.add(iten);
    }

    if (listaAdicionadas2 != []) {
      Tecnicos tecnicoModel = Tecnicos(
        nome: widget.nomeCurrent,
        descricao: widget.descricaoCurrent,
        atividadesAtribuidas: listaAdicionadas2,
      );

      Box<Tecnicos>? tecnicoBox = Hive.box<Tecnicos>('tecnicos');
      tecnicoBox.putAt(id!, tecnicoModel);
      print(tecnicoModel.atividadesAtribuidas!.first.nome);

      // Navigator.of(context).pop();
      print(listaAdicionadas2);
    } else
      () {
        print("Não foi possível adicionar");
      };
  }

  void checarSeExiste(Atividades indexAtividade) {
    if (listaAdicionadas.contains(indexAtividade) ||
        listaAdicionadas.contains(indexAtividade))
      print("A ${indexAtividade.nome} já foi adicionada");
    else {
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
        child: Text("Texto"),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.nomeCurrent!),
      ),
      body: ValueListenableBuilder(
        valueListenable: boxAtividades,
        builder: (context, Box<Atividades> atividadeBox, _) {
          if (atividadeBox.values.isEmpty) {
            return Center(
              child: Text("No data available!",
                  style: TextStyle(fontFamily: 'Montserrat')),
            );
          }
          return ListView.builder(
              itemCount: atividadeBox.length,
              itemBuilder: (context, index) {
                //  print(atividadeBox.values);
                //  print("Finalmente ${listaTeste}");
                List<Atividades> atividadesListas =
                    atividadeBox.values.toList();
                //  print(atividadesListas);
                return ListTile(
                  title: Text(atividadesListas[index].nome.toString(),
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat')),
                  onLongPress: () {
                    //   coletarIndex(atividadeParaLista[index]);
                    checarSeExiste(atividadesListas[index]);
                  },
                );
              });
        },
      ),
    );
  }
}


/*
                Atividades? atividadeBox = box.getAt(index);
                print(atividadeBox!.nome);
                return ListTile(
                    onLongPress: () {
                      atividadesAtribuidas.add(atividadeBox);
                      adicionarTarefa();
                    },
                    title: Text(atividadeBox.nome.toString(),
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Montserrat')));




  var listaTeste = [];
                var atividadeParaLista = atividadeBox.values.toList();
                for (var iten in atividadeBox.values) {
                  listaTeste.add(iten);
                }
*/