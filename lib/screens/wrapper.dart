import 'package:flutter/material.dart';
import 'package:notas/models/user.dart';
import 'package:notas/screens/autenticate/autenticate.dart';
import 'package:notas/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    return (user == null) ? Autenticate() : Home();
  }
}
