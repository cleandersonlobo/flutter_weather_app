class Condition {
  String text;
  int code;
  int temperature;

  Condition({this.temperature, this.code, this.text});

  Condition.fromJson(Map<dynamic, dynamic> json)
      : text = json["text"],
        code = json["code"],
        temperature = json["temperature"];
}

class Location {
  final int woeid;
  final String city;
  final String region;
  final String country;
  final double lat;
  final double long;
  final String timezoneId;
  Location(
      {this.woeid,
      this.city,
      this.region,
      this.country,
      this.lat,
      this.long,
      this.timezoneId});
  Location.fromJson(Map<dynamic, dynamic> json)
      : woeid = json["woeid"],
        city = json["city"],
        region = json["region"],
        country = json["country"],
        lat = json["lat"],
        long = json["long"],
        timezoneId = json["timezone_id"];
}

class Forecasts {
  String text;
  int code;
  String day;
  int date;
  int low;
  int high;

  Forecasts({this.text, this.code, this.day, this.high, this.date, this.low});

  Forecasts.fromJson(Map<dynamic, dynamic> json)
      : text = json["text"],
        code = json["code"],
        high = json["high"],
        date = json["date"],
        low = json["low"],
        day = json["day"];
}

class CurrentoObservation {
  final Map wind;
  final Map atmosphere;
  final Map astronomy;
  final Condition condition;
  final int pubDate;

  CurrentoObservation(
      {this.wind,
      this.atmosphere,
      this.astronomy,
      this.condition,
      this.pubDate});
  CurrentoObservation.fromJson(Map<dynamic, dynamic> json)
      : wind = json["wind"],
        atmosphere = json["atmosphere"],
        astronomy = json["astronomy"],
        condition = Condition.fromJson(json["condition"]),
        pubDate = json["pubDate"];
}

class Weather {
  final Location location;
  final CurrentoObservation currentObservation;
  final List<Forecasts> forecasts;

  Weather({
    this.location,
    this.currentObservation,
    this.forecasts,
  });

  Weather.fromJson(Map json)
      : forecasts = (json['forecasts'] as List)
            .map((i) => Forecasts.fromJson(i))
            .toList(),
        location = Location.fromJson((json['location'] as Map)),
        currentObservation =
            CurrentoObservation.fromJson((json['current_observation'] as Map));
}
