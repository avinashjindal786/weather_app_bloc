import 'package:equatable/equatable.dart';
import 'package:weather_app_bloc/model.dart';

class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}


class WeatherIsNotSearched extends WeatherState{

}

class WeatherIsLoading extends WeatherState{

}

class WeatherIsLoaded extends WeatherState{
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  // TODO: implement props
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherState{

}