import 'package:client/model/tecnicos_model.dart';
import 'package:client/views/operacoesCrud/updateAtividadeTecnico.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AtividadeTecnicoDetails extends StatefulWidget {
  final formkey = GlobalKey<FormState>();
  @override
  _AtividadeTecnicoDetailsState createState() =>
      _AtividadeTecnicoDetailsState();
}

class _AtividadeTecnicoDetailsState extends State<AtividadeTecnicoDetails> {
  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Tecnicos>('tecnicos').listenable();

    return Scaffold(
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Técnicos e atividades"),
      ),
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: boxform,
          builder: (context, Box<Tecnicos> box, _) {
            if (box.values.isEmpty) {
              return Center(
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
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Montserrat')),
                    trailing: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpDateAtividadeTecnico(
                                    id: index,
                                    nomeCurrent: tecnicoBox.nome!,
                                    descricaoCurrent: tecnicoBox.descricao!,
                                    
                                  )),
                        );
                      },
                      child: Text("Conferir atividades"),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
