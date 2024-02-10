import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_app/core/constants/constant.dart';
import 'package:iot_app/iot_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
            create: (context) => IotBloc()..add(DataGetEvent()),
            child: BlocConsumer<IotBloc, IotState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                print(state);
                if (state is DataLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DataErrorState) {
                  return Center(
                      child: Text(
                    state.pageState.error,
                    style: const TextStyle(color: Colors.white),
                  ));
                } else if (state is DataInitial) {
                  return const SizedBox();
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Температура установлена на'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: () {
                            context
                                .read<IotBloc>()
                                .add(TempEditDown());
                          }, icon: const Icon(
                            Icons.remove_circle_outline_outlined,
                          ),),
                          Text(
                            state.pageState.temp.toString(),
                            style: const TextStyle(fontSize: 78),
                          ),
                          IconButton(onPressed: () {
                            context
                                .read<IotBloc>()
                                .add(TempEditUp());
                          }, icon: Icon(
                            Icons.add_circle_outline_outlined,
                          ),),
                        ],
                      ),
                      IconButton(onPressed: () => {
                        context
                            .read<IotBloc>()
                            .add(LampInvert())
                      }, icon: state.pageState.icon,iconSize: 80,),
                      Text(state.pageState.lampIsActive
                          ? 'Лампа включена'
                          : 'Лампа выключена'),
                      TextButton(onPressed: () => {
                      context
                          .read<IotBloc>()
                          .add(DataUpdateEvent(10, true))
                      }, child: const Text('Обновить'),),

                    ],
                    
                  ),
                );
              },
            )),
      ),
    );
  }
}
