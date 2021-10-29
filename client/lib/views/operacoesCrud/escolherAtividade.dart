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
  List<Atividades> atividadesAtribuidas = [];
  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Atividades>('atividades').listenable();

    void adicionarTarefa() {
      final index = widget.id;
      Tecnicos tecnicoModel = Tecnicos(
        nome: widget.nomeCurrent,
        descricao: widget.descricaoCurrent,
        atividadesAtribuidas: atividadesAtribuidas,
      );
      Box<Tecnicos> tecnicoBox = Hive.box<Tecnicos>('tecnicos');
      tecnicoBox.putAt(index!, tecnicoModel);
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.nomeCurrent!),
      ),
      body: ValueListenableBuilder(
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
              });
        },
      ),
    );
  }
}
