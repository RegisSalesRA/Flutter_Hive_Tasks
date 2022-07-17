// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/css/colors.dart';
import 'package:flutter_hiver_tasks/model/tecnicos_model.dart';
import 'package:flutter_hiver_tasks/views/areaAdministrador/forms/tecnicos.dart';
import 'package:flutter_hiver_tasks/widget/customAppBar.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          backgroundColor: CustomColors.background,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TecnicoForm()),
            );
          }),
      appBar: MyAppBar(title: "Lista de Técnicos"),
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

                return Container(
                  height: 50,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: CustomColors.backgroundCards,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(tecnicoBox!.nome!,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat')),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TecnicoForm(
                                              id: index,
                                            )));
                              },
                              child: Icon(Icons.edit),
                            ),
                            InkWell(
                              onTap: () async {
                                await box.deleteAt(index);
                              },
                              child: Icon(Icons.delete),
                            ),
                          ],
                        )
                      ]),
                );
              });
        },
      ),
    );
  }
}
