import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/shared/decoration.dart';

class AlumnoTile extends StatelessWidget {
  final Alumno alumno;

  AlumnoTile({ this.alumno });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListTile(
          leading: Icon(Icons.person_pin_circle),
          title: Text(
            alumno.nombre, 
            style: titulo.copyWith(fontSize: 18, color: Colors.black),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}