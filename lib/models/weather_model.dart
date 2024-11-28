class Weather {
  final String cityName;
  final double temp;
  final String mainCondition;
  final String timezone;
  final double windSpeed;

  Weather(
      {required this.cityName,
      required this.temp,
      required this.mainCondition,
      required this.timezone,
      required this.windSpeed
      });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      timezone: json['timezone'].toString(),
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}
