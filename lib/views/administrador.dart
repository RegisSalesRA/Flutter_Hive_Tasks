import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/css/colors.dart';
import 'package:flutter_hiver_tasks/views/areaAdministrador/atividadeDetails.dart';
import 'package:flutter_hiver_tasks/views/areaAdministrador/tecnicosDetails.dart';

import '../widget/customAppBar.dart';
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

/*

        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            child: const Icon(
              Icons.add,
              size: 30,
              color: CustomColors.textColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AtribuirAtividadeTecnico()),
              );
            }),

*/
        appBar: MyAppBar(
          title: "Administrador Page",
        ),
        body: SingleChildScrollView(
          child: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(color: CustomColors.background),
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
                          style: TextStyle(
                              color: CustomColors.textColor, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          
                          color: Colors.yellow,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AtribuirAtividadeTecnico()),
                                );
                              },
                              child: const Text(
                                "Clique aqui para atribuir atividade",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                        )
                      ],
                    ),
                    Column(
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
                                color: CustomColors.backgroundCards,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: size.height / 4,
                            width: size.width,
                            child: const Center(
                              child: Text(
                                "Atividades",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: CustomColors.textColor,
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
                                  builder: (context) =>
                                      const TecnicosDetailPage()),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: CustomColors.backgroundCards,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: size.height / 4,
                            width: size.width,
                            child: const Center(
                              child: Text(
                                "Tecnicos",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: CustomColors.textColor,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
