import 'package:client/views/pageDetails/atividadeDetails.dart';
import 'package:client/views/pageDetails/tecnicosDetails.dart';
import 'package:flutter/material.dart';

import '../operacoesCrud/atribuirAtividadeTecnico.dart';

class AdministradorPage extends StatefulWidget {
  const AdministradorPage({Key? key}) : super(key: key);

  @override
  _AdministradorPageState createState() => _AdministradorPageState();
}

class _AdministradorPageState extends State<AdministradorPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AtribuirAtividadeTecnico()),
              );
            }),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Administrador Page"),
        ),
        body: Container(
            width: size.width,
            decoration: BoxDecoration(color: Colors.blue),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Bem-vindo Sr.adminstrador",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: size.height / 15,
                      ),
                      Text("Para conferir os itens arraste para o lado!",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      Text(
                          "Clique no botão abaixo para adicionar tarefa ao técnico!",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AtividadeDetailsPage()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              height: size.height / 4,
                              width: size.width,
                              child: Center(
                                child: Text(
                                  "Atividades",
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TecnicosDetailPage()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              height: size.height / 4,
                              width: size.width,
                              child: Center(
                                child: Text(
                                  "Tecnicos",
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
