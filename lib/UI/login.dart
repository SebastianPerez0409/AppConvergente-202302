import 'package:flutter/material.dart';
import 'package:iniciosesion/mundo/mysql.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  var db = new Mysql();
  String usr = "";
  String pws = "";

  void _addUser() {
    db.getConnection().then((conn) {
      String sql =
          "INSERT INTO Usuarios (nombre_usuario, apellido_usuario, cedula_usuario, correo, contraseña) VALUES ('Sebastian','Perez','1006775533','johan.perez@upc.edu.co', 'arrozconatun');";
      conn.query(sql).then((value) => {});
    });
  }

  void mostrarDialogo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Valor Guardado'),
          content: Text("usuario: " +
              usr +
              "\ncontraseña: " +
              pws), // Mostrar el valor guardado aquí
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: TextField(
                controller: TextEditingController(text: usr),
                onChanged: (text) {
                  setState(() {
                    usr = text;
                  });
                },
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo electronico',
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: TextField(
                controller: TextEditingController(text: pws),
                onChanged: (text) {
                  setState(() {
                    pws = text;
                  });
                },
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              )),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  _addUser();
                },
                child: Text("Entrar")),
          ),
        ],
      ),
    );
  }
}
