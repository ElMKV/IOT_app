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
      name: json['name'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$DataIotToJson(DataIot instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
    };
