import 'package:flutter/material.dart';

import '../modules/user/views/login_user_page.dart';

Map<String, WidgetBuilder> getAplicationRoute() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => const LoginScreen(),
  };
}
