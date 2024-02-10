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
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'country')
  final String country;

  const DataIot({
    this.name = '',
    this.country = '',
  });

  factory DataIot.fromJson(Map<String, dynamic> json) => _$DataIotFromJson(json);

  Map<String, dynamic> toJson() => _$DataIotToJson(this);

  DataIot copyWith({
    String? name,
    String? country,
  }) {
    return DataIot(
      name: name ?? this.name,
      country: country ?? this.country,
    );
  }
}

