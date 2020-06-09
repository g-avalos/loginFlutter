import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/screens/home/alumnos.dart';
import 'package:notas/screens/home/settings_page.dart';
import 'package:notas/services/auth.dart';
import 'package:notas/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showClose() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Salir"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Estas seguro que queres salir?'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Si'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _authService.singOut();
                  },
                )
              ],
            );
          });
    }

    return StreamProvider<List<Alumno>>.value(
      value: DatabaseService().alumnos,
      child: Scaffold(
        appBar: AppBar(
          title: Text('I.F.T.S. N° 11'),
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Menu"),
              ),
              Divider(),
              ListTile(
                  title: Text("Perfil"),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        ));
                  }),
              Divider(),
              ListTile(
                title: Text("Salir"),
                leading: Icon(Icons.exit_to_app),
                onTap: () async {
                  _showClose();
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: Alumnos(),
        ),
      ),
    );
  }
}
