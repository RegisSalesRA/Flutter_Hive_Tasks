import 'package:flutter/material.dart';

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
        appBar: AppBar(
          centerTitle: true,
          title: Text("Administrador Page"),
          backgroundColor: Colors.red,
        ),
        body: Container(
            width: size.width,
            decoration: BoxDecoration(color: Colors.red),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Bem-vindo Sr.adminstrador",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: size.height / 5,
                      ),
                      Text("Para conferir os itens arraste para o lado!",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              print("Visualizar Atividades");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
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
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              print("Mudando para pagina de Tecnicos");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
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
