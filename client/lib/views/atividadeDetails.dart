import 'package:client/model/atividade_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'operacoesCrud/createAtividade.dart';
import 'operacoesCrud/updateAtividade.dart';

class AtividadeDetailsPage extends StatefulWidget {
  const AtividadeDetailsPage({Key? key}) : super(key: key);

  @override
  _AtividadeDetailsPageState createState() => _AtividadeDetailsPageState();
}

class _AtividadeDetailsPageState extends State<AtividadeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Atividades>('atividades').listenable();
    print(boxform.value.values);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("Criar Atividade");
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AdicionarAtividade()),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Atividades"),
      ),
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: boxform,
          builder: (context, Box<Atividades> box, _) {
            if (box.values.isEmpty) {
              return Center(
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
                          style: TextStyle(
                              fontSize: 20, fontFamily: 'Montserrat')));
                });
          },
        ),
      ),
    );
  }
}
