// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividade_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AtividadesAdapter extends TypeAdapter<Atividades> {
  @override
  final int typeId = 0;

  @override
  Atividades read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Atividades(
      nome: fields[0] as String?,
      isComplete: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Atividades obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AtividadesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
