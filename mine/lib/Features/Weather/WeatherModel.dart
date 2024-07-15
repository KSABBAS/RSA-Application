class WeatherT{
  final String cityName;
  final double temperature;
  final double windSpeed;
  final int pressure;
  final String mainCondition;
  final String description;

  WeatherT({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.pressure,
    required this.description,
    required this.windSpeed,
  });

  factory WeatherT.fromJson(Map<String, dynamic> json) {
    return WeatherT(
      cityName: json['name'],
      temperature: json['main']['temp']-273,
      pressure: json['main']['pressure'],
      windSpeed: json['wind']['speed'],
      mainCondition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
    );
  }
}