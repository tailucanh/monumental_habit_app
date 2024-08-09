class Weather{
  String uId;
  String strTime;
  String address;
  String description;
  String icon;
  String humidity;
  String temperature;
  String highPressure;
  String lowPressure;

  Weather(
      {
    required this.uId, required this.strTime,
    required this.address, required this.description,
    required this.icon, required this.humidity,
    required this.highPressure, required this.lowPressure,
    required this.temperature
    }
  );

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    uId: json["uId"],
    strTime: json["strTime"],
    address: json["address"],
    description: json["description"],
    icon: json["icon"],
    humidity: json["humidity"],
    temperature: json["temperature"],
    highPressure: json["highPressure"],
    lowPressure: json["lowPressure"],
  );

  Map<String, dynamic> toJson() => {
    "uId": uId,
    "strTime": strTime,
    "address": address,
    "description": description,
    "icon": icon,
    "humidity": humidity,
    "temperature": temperature,
    "highPressure": highPressure,
    "lowPressure": lowPressure,
  };
}