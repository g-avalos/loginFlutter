import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/models/user.dart';
import 'package:notas/services/database.dart';
import 'package:notas/shared/decoration.dart';
import 'package:provider/provider.dart';

class FormSettings extends StatefulWidget {
  FormSettings({Key key}) : super(key: key);

  @override
  _FormSettingsState createState() => _FormSettingsState();
}

class _FormSettingsState extends State<FormSettings> {
  final _formKey = GlobalKey<FormState>();
  String _currentName;
  String _currentDni;

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    return StreamBuilder<Alumno>(
        stream: DatabaseService(uid: user.uid).alumno,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          Alumno alumno = snapshot.data;

          return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 20, 0),
                        child: Text('Nombre: '),
                      ),
                      Expanded(
                        child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 20, 0),
                          child: TextFormField(
                            maxLength: 50,
                            maxLines: 1,
                            initialValue: alumno.nombre,
                            decoration:
                                textDecoration.copyWith(hintText: 'Nombre'),
                            validator: (val) {
                              return val.isEmpty ? 'Ingresa tu nombre' : null;
                            },
                            onChanged: (val) {
                              setState(() => _currentName = val);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 30, 0),
                          child: Text('D.N.I.: '),
                        ),
                        Expanded(
                          child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 30, 0),
                            child: TextFormField(
                              initialValue: alumno.dni,
                              maxLength: 8,
                              maxLines: 1,
                              decoration:
                                  textDecoration.copyWith(hintText: 'D.N.I.'),
                              validator: (val) {
                                return val.isEmpty ? 'Ingresa tu D.N.I.' : null;
                              },
                              onChanged: (val) {
                                setState(() => _currentDni = val);
                              },
                            ),
                          ),
                        ),
                      ]),
                  RaisedButton(
                      child: Text(
                        'Guardar',
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          alumno.dni = _currentDni ?? alumno.dni;
                          alumno.nombre = _currentName ?? alumno.nombre;
                          await DatabaseService(uid: user.uid)
                              .updateAlumno(alumno);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ));
        });
  }
}
