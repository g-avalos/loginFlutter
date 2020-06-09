import 'package:flutter/material.dart';
import 'package:notas/screens/autenticate/register.dart';
import 'package:notas/screens/autenticate/sing_in.dart';

class Autenticate extends StatefulWidget {
  Autenticate({Key key}) : super(key: key);

  @override
  _AutenticateState createState() => _AutenticateState();
}

class _AutenticateState extends State<Autenticate> {
  bool mostrarSingIn = true;

  void cambiarVista() {
    setState(() {
      mostrarSingIn = !mostrarSingIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: (mostrarSingIn) ? SingIn(cambiarVista: cambiarVista) : Register(cambiarVista: cambiarVista),
    );
  }
}