import 'package:hive/hive.dart';
part 'atividade_model.g.dart';

@HiveType(typeId: 0)
class Atividades extends HiveObject {
  @HiveField(0)
  String? nome;

  @HiveField(1)
  bool? isComplete;

  Atividades({this.nome, this.isComplete});
}