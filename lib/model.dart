class WeatherResponse {
  final cityName;
  final temp;
  final weatherDetails;

  WeatherResponse({this.cityName, this.temp, this.weatherDetails});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name']; //extract the field
    final temp = TempInfo.fromJson(json['main']);

    final weatherDetails = WeatherInfo.fromJson(json['weather'][0]);
    return WeatherResponse(
        cityName: cityName,
        temp: temp,
        weatherDetails: weatherDetails); // create object using the constructor
  }
}

class TempInfo {
  final temp;
  final maxTemp;
  final minTemp;

  TempInfo({this.temp, this.maxTemp, this.minTemp});

  factory TempInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final max = json['temp_max'];
    final min = json['temp_min'];

    return TempInfo(
        temp: temp,
        maxTemp: max,
        minTemp: min); // create object using the constructor
  }
}

class WeatherInfo {
  final weather;
  final description;
  final icon;

  WeatherInfo({this.weather, this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    String icon = json['icon'];

    return WeatherInfo(
        weather: json['main'],
        description: json['description'],
        icon: 'https://openweathermap.org/img/wn/${icon}@2x.png');
  }
}

/*
{
 coord: {lon: 72.8479, lat: 19.0144},
 weather: [{id: 711, main: Smoke, description: smoke, icon: 50d}],
 base: stations, 
 main: {temp: 304.14, feels_like: 302.87, temp_min: 301.09, temp_max: 304.14, pressure: 1013, humidity: 30},
 visibility: 3500, 
 wind: {speed: 4.63, deg: 320}, 
 clouds: {all: 0}, 
 dt: 1707477216, 
 sys: {type: 1, id: 9052, country: IN, sunrise: 1707442816, sunset: 1707483925}, 
 timezone: 19800, 
 id: 1275339, 
 name: Mumbai, 
 cod: 200
}
I/flutter ( 4142): 304.14*/