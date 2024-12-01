class Weather {
  final String cityName;
  final double temp;
  final String mainCondition;
  final String timezone;
  final double windSpeed;
  final double temp_min;
  final double temp_max;

  Weather(
      {required this.cityName,
      required this.temp,
      required this.mainCondition,
      required this.timezone,
      required this.windSpeed,
      required this.temp_min,
      required this.temp_max});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      timezone: json['timezone'].toString(),
      windSpeed: json['wind']['speed'].toDouble(),
      temp_min: json['main']['temp_min'].toDouble(),
      temp_max: json['main']['temp_max'].toDouble(),
    );
  }
}
