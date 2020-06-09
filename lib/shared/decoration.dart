import 'dart:ui';

import 'package:flutter/material.dart';

const textDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 2.0,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 2.0,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 2.0,
    ),
  ),
  );

const bgDecoration = BoxDecoration(
    border: Border(),
    image: DecorationImage(
      fit: BoxFit.fill,
      image: AssetImage("assets/bg.jpg"),
    ),
  );

const titulo = TextStyle(
    fontFamily: "SofiaPro", 
    color: Colors.black, 
    fontSize: 22, 
    fontStyle: FontStyle.normal, 
    fontWeight: FontWeight.bold
  );

const subtitulo = TextStyle(
    fontFamily: "SofiaPro", 
    color: Colors.black, 
    fontSize: 18, 
    fontStyle: FontStyle.normal, 
    fontWeight: FontWeight.normal
  );

const texto = TextStyle(
    fontFamily: "SofiaPro", 
    color: Colors.black, 
    fontSize: 16, 
    fontStyle: FontStyle.normal, 
    fontWeight: FontWeight.normal
  );

const textoFixed = TextStyle(
    fontFamily: "SofiaPro", 
    color: Colors.black, 
    fontSize: 16, 
    fontStyle: FontStyle.normal, 
    fontWeight: FontWeight.normal,
    fontFeatures: [
      FontFeature.tabularFigures()
    ],  
  );
