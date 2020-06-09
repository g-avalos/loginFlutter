import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:notas/screens/autenticate/widgets.dart';
import 'package:notas/services/auth.dart';
import 'package:notas/shared/decoration.dart';

class Register extends StatefulWidget {
  final Function cambiarVista;

  Register({this.cambiarVista});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String pwd = '';
  String error = '';
  bool loading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('I.F.T.S. N° 11',),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                widget.cambiarVista();
              },
              icon: Icon(Icons.person),
              label: Text('Sing In',)
            ),
          ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: loading, 
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textDecoration.copyWith(hintText: 'EMail'),
                    validator: (val) => val.isEmpty ? 'El usuario no puede estar vacio' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length < 6 ? 'La clave debe tener mas de 6 caracteres' : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => pwd = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textDecoration.copyWith(hintText: 'Password'),
                    validator: (val) {
                      return val != pwd ? 'La clave no coincide' : null;
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  BotonRedondo(
                    texto: 'Registrarse',
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() => loading = true);
                        dynamic user = await _authService.registerWithUserAndPassword(email, pwd);

                        if (user == null) {
                          setState(() {
                            error = 'Por favor ingrese un mail valido';
                            loading = false;
                          });
                        }
                      }
                    }
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    error, 
                    style: TextStyle(color: Colors.red[500], fontSize: 14.0),
                  ),
                ],
              )
            )
          ),
        ),
      );
  }
}
