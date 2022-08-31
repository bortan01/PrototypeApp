import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui/card_container.dart';
import '../provider/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: screenHeight * 0.09),
          CardContainer(
            child: ChangeNotifierProvider(create: (context) => LoginProvider(), child: const _Formulario()),
          ),
          SizedBox(height: screenHeight * 0.09),
        ],
      )),
    );
  }
}

class _Formulario extends StatelessWidget {
  const _Formulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: loginProvider.formKeyLogin,
      autovalidateMode: loginProvider.isAlreadyCheck ? AutovalidateMode.onUserInteraction : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: screenWidth / 2.5,
            padding: const EdgeInsets.only(top: 5),
            child: const Text(
              'Login',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 23.0,
                overflow: TextOverflow.ellipsis,
                fontFamily: "SFUIDisplay",
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Image.asset('assets/img/png/logo.png'),
          const SizedBox(height: 10),
          const _Label(text: "Correo:"),
          const SizedBox(height: 10),
          const _InputCorreo(),
          const SizedBox(height: 10),
          const _Label(text: "Contraseña:"),
          const SizedBox(height: 10),
          const _InputPassword(),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                loginProvider.login(context);
              },
              child: const Text(
                'Ingresar',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;

  const _Label({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 19.0,
        fontFamily: "SFUIDisplay",
        fontWeight: FontWeight.normal,
        color: Colors.black);

    return Align(
      alignment: Alignment.topLeft,
      child: Text(text, style: style),
    );
  }
}

class _InputCorreo extends StatelessWidget {
  const _InputCorreo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return TextFormField(
      initialValue: '',
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => loginProvider.emailLogin = value,
      validator: (value) {
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(pattern);
        return regExp.hasMatch(value ?? '') ? null : "Correo no válido";
      },
    );
  }
}

class _InputPassword extends StatelessWidget {
  const _InputPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return TextFormField(
      initialValue: '',
      autofocus: false,
      obscureText: true,
      validator: (value) {
        if (value == "") {
          return "campo necesario";
        }
        if (value!.length <= 4) {
          return 'Contraseña demasiado corta';
        }
        return null;
      },
      onChanged: (value) => loginProvider.passwordLogin = value,
    );
  }
}
