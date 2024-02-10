import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/data/model/data.dart';
import 'package:meta/meta.dart';

import 'repositories/data.dart';

part 'iot_event.dart';

part 'iot_state.dart';

class IotBloc extends Bloc<IotEvent, IotState> {
  IotBloc() : super(DataInitial(PageState())) {
    emit(DataLoadingState(state.pageState));
    GetData();
    on<IotEvent>((event, emit) {

    });

    on<DataUpdateEvent>((event, emit) async {
      print('update event ${state.pageState.temp} ${event.lampIsActive}');

      await UpdateData(state.pageState.temp, event.lampIsActive);
      await GetData();


    });

    on<TempEditUp>((event, emit) {
      emit(DataUpState(state.pageState.copyWith(
          temp: state.pageState.temp + 1)));

      print('TempEditUp ${state.pageState.temp}');



    });

    on<TempEditDown>((event, emit) {
      emit(DataUpState(state.pageState.copyWith(
          temp: state.pageState.temp - 1)));

      print('TempEditUp ${state.pageState.temp}');



    });
  }

  Future<void> GetData() async {
    DataRepository dataRepository = DataRepository();
    await dataRepository.getData().then((value) async {
      if (value != null) {
        print(value.data.lampIsActive);
        print(value.data.temp);
        if (value.data.lampIsActive) {
          emit(DataUpState(state.pageState.copyWith(
            icon: Icon(
              Icons.flashlight_on_outlined,
            ),
            temp: value.data.temp
          )));
        } else {
          emit(DataUpState(state.pageState.copyWith(
              icon: Icon(
            Icons.flashlight_off_outlined,
          ))));
        }

        emit(DataUpState(state.pageState.copyWith(
          data: value,
        )));
      } else {
        print('empty');
      }
    });
  }

  Future<void> UpdateData(int temp, bool lampIsActive) async {
    DataRepository dataRepository = DataRepository();
    await dataRepository.updateData(temp, lampIsActive).then((value) async {

    });
  }

}
