import 'package:flutter/material.dart';
import 'administrador.dart';
import 'tecnicos.dart';

class Home extends StatefulWidget {
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
        title: Text("Home Page"),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdministradorPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    height: size.height / 4,
                    width: size.width,
                    child: Center(
                      child: Text(
                        "Área Administradores",
                        style: const TextStyle(
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
                      MaterialPageRoute(builder: (context) => TecnicosPage()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    height: size.height / 4,
                    width: size.width,
                    child: Center(
                      child: Text(
                        "Área dos técnicos",
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
          )),
    );
  }
}
