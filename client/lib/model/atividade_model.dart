import 'package:hive/hive.dart';
part 'atividade_model.g.dart';

@HiveType(typeId: 0)
class Atividades extends HiveObject {
  @HiveField(0)
  String? nome;

  @HiveField(1)
  bool? is_complete;

  Atividades({this.nome, this.is_complete});
}