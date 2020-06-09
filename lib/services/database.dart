
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notas/models/alumno.dart';

class DatabaseService {
  final String uid;
  final String mail;

  DatabaseService({ this.uid, this.mail });

  final CollectionReference notas = Firestore.instance.collection('alumnos');

  Future crearDatosIniciales() async {
    Alumno a = Alumno();

    return await notas.document(uid).setData({
        "dni": a.dni,
        "nombre": a.nombre, 
        "mail": mail, 
        "cohorte": a.cohorte,
        "cuatrimestre_ingreso": a.cuatrimestreIngreso
      });
  }

  Future getData() async {
    return await notas.document(uid).get();
  }

  Future updateAlumno(Alumno a) async {
    return await notas.document(uid).setData({
      'nombre': a.nombre,
      'dni': a.dni,
    });
  }
  
  Stream<List<Alumno>> get alumnos {
    return notas.snapshots().map(_alumnosFromSnapshot);
  }

  Stream<Alumno> get alumno {
    return notas.document(uid).snapshots().map(_toAlumno);
  }

  List<Alumno> _alumnosFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(_toAlumno).toList();
  }
  
  Alumno _toAlumno(DocumentSnapshot doc) {
    final Map <String, dynamic> d = doc.data;

    Alumno a;

    try {
      a = Alumno(
        cohorte: d['cohorte'] ?? '',
        cuatrimestreIngreso: d['cuatrimestre_ingreso'] ?? '',
        dni: d['dni'] ?? '',
        mail: d['mail'] ?? '',
        nombre: d['nombre'] ?? ''
      );
    } catch (e) {
      a = Alumno();
      print(e);
    }

    return a;
  }
}