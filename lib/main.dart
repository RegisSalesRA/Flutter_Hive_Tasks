import 'package:flutter/material.dart';
import 'package:flutter_hiver_tasks/model/atividade_model.dart';
import 'package:flutter_hiver_tasks/views/home.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'model/tecnicos_model.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Iniciar o banco Hive
  await Hive.initFlutter();
  //Registrar box ( Box is like doc firebase)
  Hive.registerAdapter(AtividadesAdapter());
  // Aqui criamos a box e colocamos o nome onde vai ser inserido os dados
  await Hive.openBox<Atividades>('atividades');
  Hive.registerAdapter(TecnicosAdapter());
  await Hive.openBox<Tecnicos>('tecnicos');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
