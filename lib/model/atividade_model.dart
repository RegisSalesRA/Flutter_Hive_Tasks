import 'package:hive/hive.dart';
part 'atividade_model.g.dart';

@HiveType(typeId: 0)
class Atividades extends HiveObject {
  @HiveField(0)
  String? nome;

  @HiveField(1, defaultValue: false)
  bool? isComplete;

  @HiveField(2, defaultValue: true)
  bool? available;

  @HiveField(3, defaultValue: true)
  Atividades({this.nome, this.isComplete, this.available});
}
