import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:flutter_hiver_tasks/widget/customSnackBar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EscolherAtividade extends StatefulWidget {
  final int? id;
  final String? nomeCurrent;
  final String? descricaoCurrent;
  const EscolherAtividade(
      {Key? key, this.id, this.nomeCurrent, this.descricaoCurrent})
      : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _EscolherAtividadeState createState() => _EscolherAtividadeState();
}

class _EscolherAtividadeState extends State<EscolherAtividade> {
  var boxAtividades = Hive.box<Atividades>('atividades').listenable();
  Box<Tecnicos> boxTecnicos = Hive.box<Tecnicos>('tecnicos');

  List<Atividades> listaAdicionadas = [];

  void adicionarTarefa() {
    final id = widget.id;

    List<Atividades> listaAdicionadas2 = [];
    for (var iten in listaAdicionadas) {
      iten.available = false;
      listaAdicionadas2.add(iten);
    }

    if (listaAdicionadas2 != []) {
      Tecnicos tecnicoModel = Tecnicos(
        nome: widget.nomeCurrent,
        descricao: widget.descricaoCurrent,
        atividadesAtribuidas: listaAdicionadas2,
      );

      Box<Tecnicos> tecnicoBox = Hive.box<Tecnicos>('tecnicos');
      tecnicoBox.putAt(id!, tecnicoModel);

      ScaffoldMessenger.of(context)
          .showSnackBar(snackbar("A Atividade para ${tecnicoModel.nome}!"));
    } else {
      print("Não foi possível adicionar");
    }
  }

  void checarSeExiste(Atividades indexAtividade) {
    if (listaAdicionadas.contains(indexAtividade))
      ScaffoldMessenger.of(context).showSnackBar(
          snackbar("A Atividade ${indexAtividade.nome} já foi adicionada!"));
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
        child: const Text("OK"),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.nomeCurrent!),
      ),
      body: ValueListenableBuilder(
        valueListenable: boxAtividades,
        builder: (context, Box<Atividades?> atividadeBox, _) {
          List<int> keys = [];

          if (keys != []) {
            keys = atividadeBox.keys
                .cast<int>()
                .where((key) => atividadeBox.get(key)!.available! == true)
                .toList();
          }

          if (keys.isEmpty) {
            return const Center(
              child: Text("No data available!",
                  style: TextStyle(fontFamily: 'Montserrat')),
            );
          }

          keys = atividadeBox.keys
              .cast<int>()
              .where((key) => atividadeBox.get(key)!.available! == true)
              .toList();

          return ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index) {
                final int key = keys[index];
                final Atividades? atividadeFiltrada = atividadeBox.get(key);

                return ListTile(
                  title: Text(atividadeFiltrada!.nome!,
                      style: const TextStyle(
                          fontSize: 20, fontFamily: 'Montserrat')),
                  onLongPress: () {
                    checarSeExiste(atividadeFiltrada);
                  },
                );
              });
        },
      ),
    );
  }
}
