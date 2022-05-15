// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'administrador.dart';
import 'tecnicos.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      body: Container(
          decoration: const BoxDecoration(color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdministradorPage()),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    height: size.height / 4,
                    width: size.width,
                    child: const Center(
                      child: Text(
                        "Área Administradores",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TecnicosPage()),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    height: size.height / 4,
                    width: size.width,
                    child: const Center(
                      child: Text(
                        "Área dos técnicos",
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
          )),
    );
  }
}
