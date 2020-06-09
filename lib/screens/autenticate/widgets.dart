import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotonRedondoConImagen extends StatelessWidget {
  final String texto;
  final GestureTapCallback onPressed;
  final Widget imagen;
  final double height;
  BotonRedondoConImagen({@required this.onPressed, this.texto, this.imagen, this.height});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      autofocus: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: height == null ? 35 : height),
            imagen,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                texto,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BotonRedondo extends StatelessWidget {
  final String texto;
  final GestureTapCallback onPressed;
  final double height;

  BotonRedondo({@required this.onPressed, this.texto, this.height});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      autofocus: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: height == null ? 35 : height),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                texto,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
