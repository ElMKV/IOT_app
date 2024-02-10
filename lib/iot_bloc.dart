import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'iot_event.dart';
part 'iot_state.dart';

class IotBloc extends Bloc<IotEvent, IotState> {
  IotBloc() : super(IotInitial()) {
    on<IotEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
