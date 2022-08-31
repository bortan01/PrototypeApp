import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/routes/routes.dart';
import 'src/theme/my_theme.dart';
import 'src/utils/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await PreferencesService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // IMPEDIR QUE APP ROTE
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'titleApp',
      routes: getAplicationRoute(),
      initialRoute: "login",
      // AGREGAMOS ESTE BILDER PARA EVITAR QUE LAS FUENTES SEAN AFECTADAS SI ALGUIEN CAMBIA EL TAMAÑO EN LA CONFIGURACION
      builder: (context, myChild) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: scale), child: myChild!);
      },
    );
  }
}
