import 'package:flutter/material.dart';
import 'package:notas/models/user.dart';
import 'package:notas/screens/wrapper.dart';
import 'package:notas/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          title: 'I.F.T.S. N° 11',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(), 
          home: Wrapper(),
      ),
    );
  }
}
