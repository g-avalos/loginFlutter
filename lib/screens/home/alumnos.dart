import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/screens/home/alumno_tile.dart';
import 'package:provider/provider.dart';

class Alumnos extends StatefulWidget {
  Alumnos({Key key}) : super(key: key);

  @override
  _AlumnosState createState() => _AlumnosState();
}

class _AlumnosState extends State<Alumnos> {
  @override
  Widget build(BuildContext context) {
    final alumnos = Provider.of<List<Alumno>>(context) ?? [];

    return ListView.builder(
      itemCount: alumnos.length,
      itemBuilder: (context, index) {
        return AlumnoTile(alumno: alumnos[index]);
      },
    );
  }
}