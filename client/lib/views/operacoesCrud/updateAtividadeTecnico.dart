import 'package:client/model/tecnicos_model.dart';
import 'package:flutter/material.dart';
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
    var boxform = Hive.box<Tecnicos>('tecnicos').listenable();
    var boxform1 = Hive.box<Tecnicos>('tecnicos');
    // print(
    //    boxform1.values.where((element) => element.nome == widget.nomeCurrent));
    // print(boxform1.values.toList());
    var listas = boxform1.values.toList();
    var mapaListas = listas.asMap();
    var mapalistaselecionado = mapaListas[widget.id];
    var mapalistaselecionadoCumprimento =
        mapalistaselecionado!.atividadesAtribuidas!.length;
    // Problema é achar as atividades que estão inseridas no nome_achado
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nomeCurrent!),
      ),
      body: Container(
        child: ValueListenableBuilder(
          valueListenable: boxform,
          builder: (context, Box<Tecnicos> boxform, _) {
            if (boxform.values.isEmpty) {
              return Center(
                child: Text("No data available!",
                    style: TextStyle(fontFamily: 'Montserrat')),
              );
            }
            return ListView.builder(
                itemCount: mapalistaselecionadoCumprimento,
                itemBuilder: (context, index) {
                  Tecnicos? tecnicoBox = boxform.getAt(index);

                  return ListTile(
                    title: Text(
                      tecnicoBox!.nome!,
                    ),
                    // Testando
                    trailing: InkWell(
                      onTap: () {},
                      child: Text("Complete/Incomplete"),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
