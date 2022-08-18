import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app_bloc/model.dart';
import 'package:weather_app_bloc/repo.dart';

import 'weather_event.dart';
import 'weather_state.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
 WeatherRepo controller;

  WeatherBloc(this.controller) : super(WeatherIsNotSearched()){
    on<FetchWeather>((event, emit)async {
      emit(WeatherIsLoading());
      try{
        WeatherModel response = await controller.getWeather(event.city);
        emit(WeatherIsLoaded(response));
      }catch(e){
        emit(WeatherIsNotLoaded());
      }
    });
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if(event is FetchWeather){
        yield WeatherIsLoading();
        try{
          WeatherModel response = await controller.getWeather(event.city);
          yield WeatherIsLoaded(response);
        }catch(e){
          yield WeatherIsNotLoaded();
        }
    }
    else if(event is ResetWeather){
      yield WeatherIsNotSearched();
    }
  }
}
