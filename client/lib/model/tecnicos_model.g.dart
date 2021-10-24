// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tecnicos_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TecnicosAdapter extends TypeAdapter<Tecnicos> {
  @override
  final int typeId = 0;

  @override
  Tecnicos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tecnicos(
      nome: fields[0] as String?,
      descricao: fields[1] as String?,
      atividades_atribuidas: (fields[2] as List?)?.cast<Atividades>(),
    );
  }

  @override
  void write(BinaryWriter writer, Tecnicos obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.descricao)
      ..writeByte(2)
      ..write(obj.atividades_atribuidas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TecnicosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
