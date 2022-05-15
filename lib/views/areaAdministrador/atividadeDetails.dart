// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'crudAtividades/createAtividade.dart';
import 'crudAtividades/updateAtividade.dart';

class AtividadeDetailsPage extends StatefulWidget {
  const AtividadeDetailsPage({Key? key}) : super(key: key);

  @override
  _AtividadeDetailsPageState createState() => _AtividadeDetailsPageState();
}

class _AtividadeDetailsPageState extends State<AtividadeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Atividades>('atividades').listenable();
   

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
         
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AdicionarAtividade()),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lista de Atividades"),
      ),
      body: ValueListenableBuilder(
        valueListenable: boxform,
        builder: (context, Box<Atividades> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text("No data available!",
                  style: TextStyle(fontFamily: 'Montserrat')),
            );
          }
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                Atividades? form = box.getAt(index);

                return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateAtividade(
                                    id: index,
                                    nomeCurrent: form!.nome!,
                                  )));
                    },
                    onLongPress: () async {
                      await box.deleteAt(index);
                    },
                    title: Text(form!.nome!,
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'Montserrat')));
              });
        },
      ),
    );
  }
}
