import 'package:flutter_weather_app/utils/helpers.dart';

class Location {
  final int woeid;
  final String city;
  final String country;
  final double lat;
  final double long;
  final String timezoneId;
  Location(
      {this.woeid,
      this.city,
      this.country,
      this.lat,
      this.long,
      this.timezoneId});
  Location.fromJson(Map<dynamic, dynamic> json)
      : woeid = json["woeid"],
        city = json["displayName"],
        country = json["countryName"],
        lat = json["latitude"],
        long = json["longitude"],
        timezoneId = json["timezone_id"];
}

class TemperatureDaily {
  int high;
  int low;

  TemperatureDaily({this.high, this.low});

  TemperatureDaily.fromJson(Map json) {
    high = convertToCel(json['high']);
    low = convertToCel(json['low']);
  }

  Map toJson() {
    final Map data = new Map();
    data['high'] = this.high;
    data['low'] = this.low;
    return data;
  }
}

class Daily {
  int conditionCode;
  String conditionDescription;
  List<DayPartTexts> dayPartTexts;
  TemperatureDaily temperature;
  ObservationTime observationTime;
  int humidity;
  int precipitationProbability;
  ObservationTime localTime;

  Daily(
      {this.conditionCode,
      this.conditionDescription,
      this.dayPartTexts,
      this.temperature,
      this.observationTime,
      this.humidity,
      this.precipitationProbability,
      this.localTime});

  Daily.fromJson(Map json) {
    conditionCode = json['conditionCode'];
    conditionDescription = json['conditionDescription'];
    if (json['dayPartTexts'] != null) {
      dayPartTexts = new List<DayPartTexts>();
      json['dayPartTexts'].forEach((v) {
        dayPartTexts.add(new DayPartTexts.fromJson(v));
      });
    }
    temperature = json['temperature'] != null
        ? new TemperatureDaily.fromJson(json['temperature'])
        : null;
    observationTime = json['observationTime'] != null
        ? new ObservationTime.fromJson(json['observationTime'])
        : null;
    humidity = json['humidity'];
    precipitationProbability = json['precipitationProbability'];
    localTime = json['localTime'] != null
        ? new ObservationTime.fromJson(json['localTime'])
        : null;
  }

  Map toJson() {
    final Map data = new Map();
    data['conditionCode'] = this.conditionCode;
    data['conditionDescription'] = this.conditionDescription;
    if (this.dayPartTexts != null) {
      data['dayPartTexts'] = this.dayPartTexts.map((v) => v.toJson()).toList();
    }
    if (this.temperature != null) {
      data['temperature'] = this.temperature.toJson();
    }
    if (this.observationTime != null) {
      data['observationTime'] = this.observationTime.toJson();
    }
    data['humidity'] = this.humidity;
    data['precipitationProbability'] = this.precipitationProbability;
    if (this.localTime != null) {
      data['localTime'] = this.localTime.toJson();
    }
    return data;
  }
}

class Forecasts {
  List<Hourly> hourly;
  List<Daily> daily;

  Forecasts({this.hourly, this.daily});

  Forecasts.fromJson(Map json) {
    if (json['hourly'] != null) {
      hourly = new List<Hourly>();
      json['hourly'].forEach((v) {
        hourly.add(new Hourly.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = new List<Daily>();
      json['daily'].forEach((v) {
        daily.add(new Daily.fromJson(v));
      });
    }
  }

  Map toJson() {
    final Map data = new Map();
    if (this.hourly != null) {
      data['hourly'] = this.hourly.map((v) => v.toJson()).toList();
    }
    if (this.daily != null) {
      data['daily'] = this.daily.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TemperatureHourly {
  int now;
  int feelsLike;

  TemperatureHourly({this.now, this.feelsLike});

  TemperatureHourly.fromJson(Map json) {
    now = convertToCel(json['now']);
    feelsLike = convertToCel(json['feelsLike']);
  }

  Map toJson() {
    final Map data = new Map();
    data['now'] = convertToCel(this.now);
    data['feelsLike'] = convertToCel(this.feelsLike);
    return data;
  }
}

class Hourly {
  int conditionCode;
  String conditionDescription;
  List<DayPartTexts> dayPartTexts;
  TemperatureHourly temperature;
  ObservationTime observationTime;
  int humidity;
  int precipitationProbability;
  int windDirection;
  String windDirectionCode;
  int windSpeed;
  ObservationTime localTime;

  Hourly(
      {this.conditionCode,
      this.conditionDescription,
      this.dayPartTexts,
      this.temperature,
      this.observationTime,
      this.humidity,
      this.precipitationProbability,
      this.windDirection,
      this.windDirectionCode,
      this.windSpeed,
      this.localTime});

  Hourly.fromJson(Map json) {
    conditionCode = json['conditionCode'];
    conditionDescription = json['conditionDescription'];
    if (json['dayPartTexts'] != null) {
      dayPartTexts = new List<Null>();
      json['dayPartTexts'].forEach((v) {
        dayPartTexts.add(new DayPartTexts.fromJson(v));
      });
    }
    temperature = json['temperature'] != null
        ? new TemperatureHourly.fromJson(json['temperature'])
        : null;
    observationTime = json['observationTime'] != null
        ? new ObservationTime.fromJson(json['observationTime'])
        : null;
    humidity = json['humidity'];
    precipitationProbability = json['precipitationProbability'];
    windDirection = json['windDirection'];
    windDirectionCode = json['windDirectionCode'];
    windSpeed = json['windSpeed'];
    localTime = json['localTime'] != null
        ? new ObservationTime.fromJson(json['localTime'])
        : null;
  }

  Map toJson() {
    final Map data = new Map();
    data['conditionCode'] = this.conditionCode;
    data['conditionDescription'] = this.conditionDescription;
    if (this.dayPartTexts != null) {
      data['dayPartTexts'] = this.dayPartTexts.map((v) => v.toJson()).toList();
    }
    if (this.temperature != null) {
      data['temperature'] = this.temperature.toJson();
    }
    if (this.observationTime != null) {
      data['observationTime'] = this.observationTime.toJson();
    }
    data['humidity'] = this.humidity;
    data['precipitationProbability'] = this.precipitationProbability;
    data['windDirection'] = this.windDirection;
    data['windDirectionCode'] = this.windDirectionCode;
    data['windSpeed'] = this.windSpeed;
    if (this.localTime != null) {
      data['localTime'] = this.localTime.toJson();
    }
    return data;
  }
}

class ObservationTime {
  int day;
  int hour;
  int weekday;
  String timestamp;

  ObservationTime({this.day, this.hour, this.weekday, this.timestamp});

  ObservationTime.fromJson(Map json) {
    day = json['day'];
    hour = json['hour'];
    weekday = json['weekday'];
    timestamp = json['timestamp'];
  }

  Map toJson() {
    final Map data = new Map();
    data['day'] = this.day;
    data['hour'] = this.hour;
    data['weekday'] = this.weekday;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class DayPartTexts {
  String text;
  String dayPart;

  DayPartTexts({this.text, this.dayPart});

  DayPartTexts.fromJson(Map json) {
    text = json['text'];
    dayPart = json['dayPart'];
  }

  Map toJson() {
    final Map data = new Map();
    data['text'] = this.text;
    data['dayPart'] = this.dayPart;
    return data;
  }
}

class TemperatureObservation {
  int now;
  int high;
  int low;
  int feelsLike;

  TemperatureObservation({this.now, this.high, this.low, this.feelsLike});

  TemperatureObservation.fromJson(Map json) {
    now = convertToCel(json['now']);
    high = convertToCel(json['high']);
    low = convertToCel(json['low']);
    feelsLike = convertToCel(json['feelsLike']);
  }

  Map toJson() {
    final Map data = new Map();
    data['now'] = this.now;
    data['high'] = this.high;
    data['low'] = this.low;
    data['feelsLike'] = this.feelsLike;
    return data;
  }
}

class Observation {
  double barometricPressure;
  int conditionCode;
  String conditionDescription;
  List<DayPartTexts> dayPartTexts;
  TemperatureObservation temperature;
  ObservationTime observationTime;
  int humidity;
  int precipitationProbability;
  String uvDescription;
  int uvIndex;
  double visibility;
  int windDirection;
  String windDirectionCode;
  int windSpeed;
  ObservationTime localTime;

  Observation(
      {this.barometricPressure,
      this.conditionCode,
      this.conditionDescription,
      this.dayPartTexts,
      this.temperature,
      this.observationTime,
      this.humidity,
      this.precipitationProbability,
      this.uvDescription,
      this.uvIndex,
      this.visibility,
      this.windDirection,
      this.windDirectionCode,
      this.windSpeed,
      this.localTime});

  Observation.fromJson(Map json) {
    barometricPressure = json['barometricPressure'];
    conditionCode = json['conditionCode'];
    conditionDescription = json['conditionDescription'];
    if (json['dayPartTexts'] != null) {
      dayPartTexts = new List<DayPartTexts>();
      json['dayPartTexts'].forEach((v) {
        dayPartTexts.add(new DayPartTexts.fromJson(v));
      });
    }
    temperature = json['temperature'] != null
        ? new TemperatureObservation.fromJson(json['temperature'])
        : null;
    observationTime = json['observationTime'] != null
        ? new ObservationTime.fromJson(json['observationTime'])
        : null;
    humidity = json['humidity'];
    precipitationProbability = json['precipitationProbability'];
    uvDescription = json['uvDescription'];
    uvIndex = json['uvIndex'];
    visibility = json['visibility'];
    windDirection = json['windDirection'];
    windDirectionCode = json['windDirectionCode'];
    windSpeed = json['windSpeed'];
    localTime = json['localTime'] != null
        ? new ObservationTime.fromJson(json['localTime'])
        : null;
  }
}

class WeatherDetail {
  int woeid;
  Location location;
  Observation observation;
  Forecasts forecasts;

  WeatherDetail({
    this.woeid,
    this.location,
    this.observation,
    this.forecasts,
  });

  WeatherDetail.fromJson(Map<String, dynamic> json) {
    woeid = json['woeid'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    observation = json['observation'] != null
        ? new Observation.fromJson(json['observation'])
        : null;
    forecasts = json['forecasts'] != null
        ? new Forecasts.fromJson(json['forecasts'])
        : null;
  }
}
