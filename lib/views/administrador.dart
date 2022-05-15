 
import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/views/areaAdministrador/atividadeDetails.dart';
import 'package:flutter_hiver_tasks/views/areaAdministrador/tecnicosDetails.dart';

import 'areaAdministrador/atribuirAtividadeDetails.dart';

class AdministradorPage extends StatefulWidget {
  const AdministradorPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdministradorPageState createState() => _AdministradorPageState();
}

class _AdministradorPageState extends State<AdministradorPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            child: const Icon(
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
          title: const Text("Administrador Page"),
        ),
        body: Container(
            width: size.width,
            decoration: const BoxDecoration(color: Colors.blue),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Bem-vindo Sr.adminstrador",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: size.height / 15,
                      ),
                      const Text("Para conferir os itens arraste para o lado!",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: size.height / 25,
                      ),
                      const Text(
                          "Clique no botão abaixo para adicionar tarefa ao técnico!",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AtividadeDetailsPage()),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: size.height / 4,
                            width: size.width,
                            child: const Center(
                              child: Text(
                                "Atividades",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TecnicosDetailPage()),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: size.height / 4,
                            width: size.width,
                            child: const Center(
                              child: Text(
                                "Tecnicos",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
