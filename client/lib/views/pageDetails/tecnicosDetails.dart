import 'package:client/model/tecnicos_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../operacoesCrud/createTecnico.dart';
import '../operacoesCrud/updateTecnico.dart';

class TecnicosDetailPage extends StatefulWidget {
  const TecnicosDetailPage({Key? key}) : super(key: key);

  @override
  _TecnicosDetailPageState createState() => _TecnicosDetailPageState();
}

class _TecnicosDetailPageState extends State<TecnicosDetailPage> {
  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Tecnicos>('tecnicos').listenable();
//    print(boxform.value.values.first.atividadesAtribuidas);
    var lista_vaiusar = [];
    var lista_recebida = boxform.value.values.first.atividadesAtribuidas;
    if (lista_recebida != null) {
      for (var iten in lista_recebida) {
        lista_vaiusar.add(iten);
      }
    }
    print(lista_vaiusar.first.isComplete);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateTecnico()),
            );
          }),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Técnicos"),
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
                            TextStyle(fontSize: 20, fontFamily: 'Montserrat')),
                    subtitle: Text(tecnicoBox.nome!),
                  );
                });
          },
        ),
      ),
    );
  }
}
