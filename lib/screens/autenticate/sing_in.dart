import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:notas/screens/autenticate/widgets.dart';
import 'package:notas/services/auth.dart';
import 'package:notas/shared/decoration.dart';

class SingIn extends StatefulWidget {
  final Function cambiarVista;
  SingIn({ this.cambiarVista });

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
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
            label: Text('Registrarse')),
        ],
      ),
      body: ModalProgressHUD(
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
                BotonRedondo(
                  texto: 'Sing In',
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);

                      dynamic user = await _authService.singInWithUserAndPassword(email, pwd);

                      if (user == null) {
                        setState(() {
                          error = 'Por favor ingrese un mail valido';
                          loading = false;
                        });
                      }
                    }
                  },
                ),
                // SizedBox(height: 20.0),
                // BotonRedondoConImagen(
                //   texto: "Sing In with Google",
                //   imagen: Image(image: AssetImage("assets/google-logo.png"), height: 35.0),
                //   onPressed: () async {
                //     setState(() => loading = true);

                //     dynamic user = await _authService.signInWithGoogle();

                //     if (user == null) {
                //       setState(() {
                //         error = 'Error de credenciales';
                //         loading = false;
                //       });
                //     }
                //   },
                // ),
                SizedBox(height: 20.0),
                Text(
                  error, 
                  style: TextStyle(color: Colors.red[500], fontSize: 14.0),
                ),
              ],
            ),
          ),
        ), 
        inAsyncCall: loading),
      );
  }
}
