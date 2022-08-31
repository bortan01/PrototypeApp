import 'package:flutter/material.dart';


class Success {
  int? code;
  Object? response;
  Success({this.code, @required this.response});
}

class Failure {
  int? code;
  Object? errorResponse;
  Failure({this.code, this.errorResponse});
}

class UserError {
  int? code = 0;
  Object? message;
  UserError({this.code, this.message});
}

