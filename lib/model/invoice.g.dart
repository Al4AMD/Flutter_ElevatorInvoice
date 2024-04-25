// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoiceAdapter extends TypeAdapter<Invoice> {
  @override
  final int typeId = 0;

  @override
  Invoice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Invoice(
      subNumber: fields[0] as String,
      sex: fields[1] as String,
      name: fields[2] as String,
      date: fields[3] as String,
      repairName: fields[4] as String,
      fixPieces: fields[5] as bool,
      floorCondition: fields[6] as bool,
      oilRails: fields[7] as bool,
      doorCondition: fields[8] as bool,
      engineGearCheck: fields[9] as bool,
      parachoutTest: fields[10] as bool,
      controlBanner: fields[11] as bool,
      boxelCheck: fields[12] as bool,
      cabinCondition: fields[13] as bool,
      description: fields[14] as String,
      monthlyCharge: fields[15] as BigInt,
      piecesTotal: fields[16] as BigInt,
      pieceChangeTotal: fields[17] as BigInt,
      remainingDebt: fields[18] as BigInt,
      totalPayment: fields[19] as BigInt,
      totalRemain: fields[20] as BigInt,
    );
  }

  @override
  void write(BinaryWriter writer, Invoice obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.subNumber)
      ..writeByte(1)
      ..write(obj.sex)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.repairName)
      ..writeByte(5)
      ..write(obj.fixPieces)
      ..writeByte(6)
      ..write(obj.floorCondition)
      ..writeByte(7)
      ..write(obj.oilRails)
      ..writeByte(8)
      ..write(obj.doorCondition)
      ..writeByte(9)
      ..write(obj.engineGearCheck)
      ..writeByte(10)
      ..write(obj.parachoutTest)
      ..writeByte(11)
      ..write(obj.controlBanner)
      ..writeByte(12)
      ..write(obj.boxelCheck)
      ..writeByte(13)
      ..write(obj.cabinCondition)
      ..writeByte(14)
      ..write(obj.description)
      ..writeByte(15)
      ..write(obj.monthlyCharge)
      ..writeByte(16)
      ..write(obj.piecesTotal)
      ..writeByte(17)
      ..write(obj.pieceChangeTotal)
      ..writeByte(18)
      ..write(obj.remainingDebt)
      ..writeByte(19)
      ..write(obj.totalPayment)
      ..writeByte(20)
      ..write(obj.totalRemain);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
