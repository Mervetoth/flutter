// ignore_for_file: file_names

class Meteo {
  var cityName; // le nom de la ville
  var icon; // l'icône représentant la condition météorologique actuelle
  var condition; //la description de la condition météorologique actuelle
  var temp; //la température actuelle
  var wind; //la vitesse du vent actuelle
  var humidity; //l'humidité actuelle
  var wind_dir; //la direction du vent actuelle
  var gust; //la vitesse des rafales de vent actuelle
  var uv; // l'indice UV (ultra violet) actuel
  var pressure; // la pression atmosphérique actuelle
  var pricipe; //la quantité de précipitations actuelle
  var last_update; // l'heure de la dernière mise à jour des données météorologiques
  Meteo(
      {required this.cityName,
      required this.icon,
      required this.condition,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.wind_dir,
      required this.gust,
      required this.uv,
      required this.pressure,
      required this.pricipe,
      required this.last_update});
  Meteo.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    last_update = json['current']['last_updated'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    wind_dir = json['current']['wind_dir'];
    pressure = json['current']['pressure_mb'];
    pricipe = json['current']['precip_mm'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
  }
}
