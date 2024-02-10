part of 'iot_bloc.dart';

@immutable
abstract class IotEvent {}


class DataGetEvent extends IotEvent {
  DataGetEvent();
}

class DataUpdateEvent extends IotEvent {
  int temp;
  bool lampIsActive;

  DataUpdateEvent(this.temp, this.lampIsActive);
}


class TempEditUp extends IotEvent {
  TempEditUp();
}
class TempEditDown extends IotEvent {
  TempEditDown();
}
