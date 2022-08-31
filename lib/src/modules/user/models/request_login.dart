// To parse this JSON data, do
//
//     final requesLogin = requesLoginFromJson(jsonString);

import 'dart:convert';

class RequesLogin {
    RequesLogin({
        required this.user,
        required this.pass,
    });

    String user;
    String pass;

    factory RequesLogin.fromRawJson(String str) => RequesLogin.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RequesLogin.fromJson(Map<String, dynamic> json) => RequesLogin(
        user: json["user"],
        pass: json["pass"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "pass": pass,
    };
}
