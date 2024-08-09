class User{
  String uId;
  String location;
  User({
    required this.uId, required this.location,
    });

  factory User.fromJson(Map<String, dynamic> json) => User(
    uId: json["uId"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "uId": uId,
    "location": location,
  };
}