import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

Future<String?> mensajeError(BuildContext context, String mensaje) {
  return showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => Platform.isAndroid
        ? AlertDialog(
            title: const Text("Error"),
            content: Text(
              mensaje,
              textAlign: TextAlign.justify,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: const Text("Error"),
            content: Text(mensaje),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
  );
}

Future<String?> mensajeOk(BuildContext context, String mensaje) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Platform.isAndroid
        ? AlertDialog(
            title: const Text("Éxito"),
            content: Text(mensaje),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: const Text("Éxito"),
            content: Text(mensaje),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
  );
}

Future<String?> mensajeErrorConAccion(
    BuildContext context, String mensaje, Function accion) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Platform.isAndroid
        ? AlertDialog(
            title: const Text("Error"),
            content: Text(mensaje, textAlign: TextAlign.justify),
            actions: <Widget>[
              TextButton(
                onPressed: () => accion(),
                child: const Text('OK'),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: const Text("Error"),
            content: Text(mensaje),
            actions: <Widget>[
              TextButton(
                onPressed: () => accion(),
                child: const Text('OK'),
              ),
            ],
          ),
  );
}


void displayDialogAndroid(BuildContext context) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          title: const Text("titulo"),
          content: Column(mainAxisSize: MainAxisSize.min, children: const [
            Text("este es el contenido de la alerta"),
            SizedBox(
              height: 10,
            ),
            FlutterLogo(
              size: 60,
            )
          ]),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("cancelar"),
            )
          ],
        );
      });
}

void displayDialogIOS(BuildContext context) {
  showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("titulo"),
          content: Column(mainAxisSize: MainAxisSize.min, children: const [
            Text("este es el contenido de la alerta"),
            SizedBox(
              height: 10,
            ),
            FlutterLogo(
              size: 60,
            )
          ]),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "cancelar",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("cancelar"),
            ),
          ],
        );
      });
}

  Future<bool?> closeAppDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => Platform.isAndroid
          ? AlertDialog(
              title: const Text('Está seguro que desea salir?'),
              actions: [
                TextButton(
                    // style: TextButton.styleFrom(primary: Colors.red),
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text(
                      'No',
                      // style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Si')),
              ],
            )
          : CupertinoAlertDialog(
              title: const Text('Está seguro que desea salir?'),
              actions: [
                TextButton(
                    // style: TextButton.styleFrom(primary: Colors.red),
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text(
                      'No',
                      // style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Si')),
              ],
            ),
    );
  }
