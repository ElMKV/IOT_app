// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      data: json['data'] == null
          ? const DataIot()
          : DataIot.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.data,
    };

DataIot _$DataIotFromJson(Map<String, dynamic> json) => DataIot(
      temp: json['temp'] as int? ?? 0,
      lampIsActive: json['lampIsActive'] as bool? ?? false,
    );

Map<String, dynamic> _$DataIotToJson(DataIot instance) => <String, dynamic>{
      'temp': instance.temp,
      'lampIsActive': instance.lampIsActive,
    };
