import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UpDateAtividadeTecnico extends StatefulWidget {
  final int? id;
  final String? nomeCurrent;
  final String? descricaoCurrent;
  UpDateAtividadeTecnico(
      {Key? key, this.id, this.nomeCurrent, this.descricaoCurrent})
      : super(key: key);
  @override
  _UpDateAtividadeTecnicoState createState() => _UpDateAtividadeTecnicoState();
}

class _UpDateAtividadeTecnicoState extends State<UpDateAtividadeTecnico> {
  @override
  Widget build(BuildContext context) {
    ValueListenable<Box<Tecnicos>> boxTecnicos =
        Hive.box<Tecnicos>('tecnicos').listenable();

    List<Tecnicos> lista = boxTecnicos.value.values.toList();
    Tecnicos tecnico = lista[widget.id!];
    List<Atividades>? atividadesTecnico = tecnico.atividadesAtribuidas;

    if (atividadesTecnico == null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.nomeCurrent!),
        ),
        body: Center(
          child: Text("Nenhuma atividade cadastrada!",
              style: TextStyle(fontFamily: 'Montserrat')),
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.nomeCurrent!),
        ),
        body: Container(
            child: ListView.builder(
                itemCount: atividadesTecnico.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      tecnico.atividadesAtribuidas![index].nome.toString(),
                    ),
                    // Testando
                    trailing: InkWell(
                      onTap: () {},
                      child: Text("Complete/Incomplete"),
                    ),
                  );
                })));
  }
}
