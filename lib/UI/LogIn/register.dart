import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:iniciosesion/UI/LogIn/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscureText = true;
  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  TextEditingController cedula = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController contrasena = TextEditingController();

  Future register() async {
    var url = Uri.http("192.168.56.1", 'register.php', {'q': '{http}'});

    var response = await http.post(url, body: {
      "nombre_usuario": nombre.text,
      "apellido_usuario": apellido.text,
      "cedula_usuario": cedula.text,
      "correo": correo.text,
      "contraseña": contrasena.text,
      "rol": "UsuarioNormal"
    });

    var data = json.decode(response.body);

    print("VALOR DATA:");
    print(data);

    if (data == "Error") {
      Fluttertoast.showToast(
          msg: '¡El usuario ya existe!',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT);
    } else {
      Fluttertoast.showToast(
          msg: 'Registration Succesful!',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17, top: 10, bottom: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Crear una cuenta",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff393839)),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, bottom: 3, top: 40),
                child: Text(
                  "Nombre",
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
                    height: 40,
                    child: TextField(
                      controller: nombre,
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
                  "Apellidos",
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
                    height: 40,
                    child: TextField(
                      controller: apellido,
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
                  "Cédula de ciudadanía",
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
                    height: 40,
                    child: TextField(
                      controller: cedula,
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
                    height: 40,
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
                    height: 40,
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
                register();
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
                          "Registrar",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        )))),
              )),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿Ya tienes una cuenta? ",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff393839))),
                Text(" Inicia sesión",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff393839))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
