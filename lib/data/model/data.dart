import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';


@JsonSerializable()
class Data {

  @JsonKey(name: 'data')
  final DataIot data;


  const Data({
    this.data = const DataIot(),

  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    DataIot? data,
  }) {
    return Data(
      data: data ?? this.data,

    );
  }
}


@JsonSerializable()
class DataIot {
  @JsonKey(name: 'temp')
  final int temp;
  @JsonKey(name: 'lampIsActive')
  final bool lampIsActive;

  const DataIot({
    this.temp = 0,
    this.lampIsActive = false,
  });

  factory DataIot.fromJson(Map<String, dynamic> json) => _$DataIotFromJson(json);

  Map<String, dynamic> toJson() => _$DataIotToJson(this);

  DataIot copyWith({
    int? temp,
    bool? lampIsActive,
  }) {
    return DataIot(
      temp: temp ?? this.temp,
      lampIsActive: lampIsActive ?? this.lampIsActive,
    );
  }
}

