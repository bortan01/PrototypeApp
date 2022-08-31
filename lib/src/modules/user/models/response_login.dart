// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

class ResponseLogin {
    ResponseLogin({
        required this.success,
        required this.message,
        required this.data,
    });

    bool success;
    String message;
    DataLogin data;

    factory ResponseLogin.fromRawJson(String str) => ResponseLogin.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        success: json["success"],
        message: json["message"],
        data: DataLogin.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class DataLogin {
    DataLogin({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.disabled,
        required this.phoneNumber,
        required this.uid,
        required this.roleId,
        required this.countryId,
        required this.regionId,
        required this.cityId,
        required this.token,
    });

    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    bool disabled;
    dynamic phoneNumber;
    dynamic uid;
    int roleId;
    dynamic countryId;
    dynamic regionId;
    dynamic cityId;
    String token;

    factory DataLogin.fromRawJson(String str) => DataLogin.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        disabled: json["disabled"],
        phoneNumber: json["phoneNumber"],
        uid: json["uid"],
        roleId: json["role_id"],
        countryId: json["country_id"],
        regionId: json["region_id"],
        cityId: json["city_id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "disabled": disabled,
        "phoneNumber": phoneNumber,
        "uid": uid,
        "role_id": roleId,
        "country_id": countryId,
        "region_id": regionId,
        "city_id": cityId,
        "token": token,
    };
}
