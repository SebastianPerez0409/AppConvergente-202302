// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:iniciosesion/UI/LogIn/register.dart';
import 'package:iniciosesion/UI/Roles/analista_vial.dart';
import 'package:iniciosesion/UI/Roles/encargado_mant_vial.dart';
import 'package:iniciosesion/UI/Roles/report_sit_anormal.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;

  TextEditingController correo = TextEditingController();
  TextEditingController contrasena = TextEditingController();

  Future login() async {
    var sendCorreo = correo.text;
    var url = Uri.http("192.168.0.10", 'login.php', {'q': '{http}'});
    var response = await http.post(url, body: {
      "correo": correo.text,
      "contraseña": contrasena.text,
    });

    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        print("VALOR DATA:");
        print(data);

        if (data == "UsuarioNormal") {
          Fluttertoast.showToast(
              msg: '¡ Sesión iniciada correctamente !',
              backgroundColor: Colors.green,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage(sendCorreo)));
        } else if (data == "AnalistaVial") {
          Fluttertoast.showToast(
              msg: '¡ Sesión iniciada correctamente !',
              backgroundColor: Colors.green,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AnalistaVial()));
        } else if (data == "EncargadoVial") {
          Fluttertoast.showToast(
              msg: '¡ Sesión iniciada correctamente !',
              backgroundColor: Colors.green,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EncargadoMantVial()));
        }
      } catch (e) {
        print("Error al decodificar JSON: $e");
        Fluttertoast.showToast(
            msg: '¡No se encontró el usuario!',
            backgroundColor: Colors.orange,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT);
      }
    } else {
      print("Error en la solicitud HTTP: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // ignore: sized_box_for_whitespace
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              width: 100, // Ancho deseado
              height: 150, // Alto deseado
              child: Image.asset('assets/imagenes/login.png'),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "¡Bienvenido! Inicia sesión",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff393839)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, bottom: 3, top: 50),
                child: Text(
                  "Correo electrónico",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff393839)),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 30, bottom: 15, right: 30),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: correo,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 135,
                                  127), // Establece un color transparente para quitar el color azul
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, bottom: 3, top: 0),
                child: Text(
                  "Contraseña",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff393839)),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 30, bottom: 40, right: 30),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      obscureText: obscureText,
                      controller: contrasena,
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye_outlined),
                            onPressed: () {
                              setState(() {
                                // Usa setState para cambiar el estado
                                obscureText = !obscureText;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 135,
                                  127), // Establece un color transparente para quitar el color azul
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  )),
            ],
          ),

          GestureDetector(
              onTap: () {
                login();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                child: Center(
                    child: Container(
                        height: 50,
                        width: 400,
                        decoration: const BoxDecoration(
                          color: Color(0xff9B51E0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Center(
                            child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        )))),
              )),

          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Register()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿No tienes una cuenta? ",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff393839))),
                  Text(" Registrarse",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff393839))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
