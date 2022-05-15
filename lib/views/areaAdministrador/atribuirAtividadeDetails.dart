import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:hive_flutter/hive_flutter.dart'; 

import 'operacoesAtribuirAtividade/escolherAtividade.dart';

class AtribuirAtividadeTecnico extends StatefulWidget {
  final formkey = GlobalKey<FormState>();

  @override
  _AtribuirAtividadeTecnicoState createState() =>
      _AtribuirAtividadeTecnicoState();
}

class _AtribuirAtividadeTecnicoState extends State<AtribuirAtividadeTecnico> {
  String nome = "";
  String descricao = "";

  @override
  Widget build(BuildContext context) {
    var boxform = Hive.box<Tecnicos>('tecnicos').listenable();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Atribuir Atividade"),
        ),
        body: ValueListenableBuilder(
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
                    Tecnicos? form = box.getAt(index);
                    return ListTile(
                      title: Text(form!.nome!,
                          style: TextStyle(
                              fontSize: 20, fontFamily: 'Montserrat')),
                      trailing: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EscolherAtividade(
                                        id: index,
                                        nomeCurrent: form.nome!,
                                        descricaoCurrent: form.descricao!,
                                      )));
                        },
                        child: Text("Adicionar"),
                      ),
                    );
                  });
            }));
  }
}
