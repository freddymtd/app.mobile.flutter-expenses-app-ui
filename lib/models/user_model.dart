class User {
  String name;
  String email;
  String password;
  bool keepOn;

  User({this.name, this.email, this.password, this.keepOn});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['keepOn'] = this.keepOn;
    return data;
  }
}
