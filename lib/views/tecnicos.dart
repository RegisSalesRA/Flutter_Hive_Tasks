// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'areaTecnicos/atividadeTecnicoDetails.dart';

class TecnicosPage extends StatefulWidget {
  const TecnicosPage({Key? key}) : super(key: key);

  @override
  _TecnicosPageState createState() => _TecnicosPageState();
}

class _TecnicosPageState extends State<TecnicosPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Técnicos Page"),
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
                    children: [
                      const Text(
                        "Bem-vindo Sr.técnico",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: size.height / 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AtividadeTecnicoDetails()));
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
                              "Atividade dos Técnicos",
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
                ],
              ),
            )));
  }
}
