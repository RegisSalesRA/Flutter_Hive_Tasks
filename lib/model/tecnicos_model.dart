import 'package:hive/hive.dart';

import 'atividade_model.dart';
part 'tecnicos_model.g.dart';

@HiveType(typeId: 1)
class Tecnicos extends HiveObject {
  @HiveField(0)
  String? nome;

  @HiveField(1)
  String? descricao;

  @HiveField(2)
  List<Atividades>? atividadesAtribuidas = [];

  Tecnicos({this.nome, this.descricao, this.atividadesAtribuidas});
}
