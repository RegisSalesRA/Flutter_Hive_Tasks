// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'crudTecnicos/createTecnico.dart';
import 'crudTecnicos/updateTecnico.dart';

class TecnicosDetailPage extends StatefulWidget {
  const TecnicosDetailPage({Key? key}) : super(key: key);

  @override
  _TecnicosDetailPageState createState() => _TecnicosDetailPageState();
}

class _TecnicosDetailPageState extends State<TecnicosDetailPage> {
  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Tecnicos>('tecnicos').listenable();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateTecnico()),
            );
          }),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lista de Técnicos"),
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
                Tecnicos? tecnicoBox = box.getAt(index);
                var itens = [];
                if (tecnicoBox != null) {
                  itens.add(tecnicoBox.atividadesAtribuidas);
                }

                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateTecnico(
                                  id: index,
                                  nomeCurrent: tecnicoBox!.nome!,
                                )));
                  },
                  onLongPress: () async {
                    await box.deleteAt(index);
                  },
                  title: Text(tecnicoBox!.descricao!,
                      style:
                          const TextStyle(fontSize: 20, fontFamily: 'Montserrat')),
                  subtitle: Text(tecnicoBox.nome!),
                );
              });
        },
      ),
    );
  }
}
