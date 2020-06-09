import 'package:flutter/material.dart';
import 'package:notas/screens/home/settings_form.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tus datos'),
          elevation: 0.0,
        ),
        body: Container(
          child: FormSettings(),
        ),
      );
  }
}
