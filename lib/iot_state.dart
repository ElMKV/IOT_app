part of 'iot_bloc.dart';

@immutable
abstract class IotState {
  final PageState pageState;

  const IotState(this.pageState);
}

class DataInitial extends IotState {
  const DataInitial(PageState pageState) : super(pageState);

}

class DataLoadingState extends IotState {
  const DataLoadingState(PageState pageState) : super(pageState);

}

class DataUpState extends IotState {
  const DataUpState(PageState pageState) : super(pageState);

}

class DataErrorState extends IotState {
  const DataErrorState(PageState pageState) : super(pageState);

}


class PageState {
  bool onAwait;
  String error;
  Data data;
  Widget icon;
  int temp;
  bool lampIsActive;


  PageState({
    this.onAwait = false,
    this.error = '',
    this.data = const Data(),
    this.icon = const SizedBox(),
    this.temp = 0,
    this.lampIsActive = false,

  });

  PageState copyWith({
    bool? onAwait,
    String? error,
    Data? data,
    Icon? icon,
    int? temp,
    bool? lampIsActive,

  }) {
    return PageState(
      onAwait: onAwait ?? this.onAwait,
      error: error ?? this.error,
      data: data ?? this.data,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      lampIsActive: lampIsActive ?? this.lampIsActive,

    );
  }
}

