import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String correo;
  const HomePage(this.correo, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeData datePickerTheme = ThemeData(
    primarySwatch: Colors.red, // Cambia esto al color que desees
  );

  TextEditingController fecha = TextEditingController();
  TextEditingController lugar = TextEditingController();
  TextEditingController descripcion = TextEditingController();

  // ignore: non_constant_identifier_names
  Future register_situationanorm() async {
    var url = Uri.http("192.168.0.10", 'sitanormales.php', {'q': '{http}'});

    var response = await http.post(url, body: {
      "correo": widget.correo,
      "fecha": fecha.text,
      "lugar": lugar.text,
      "descripcion": descripcion.text,
    });
    var data = json.decode(response.body);

    if (data == "Success") {
      Fluttertoast.showToast(
          msg: 'Situación creada con éxito!',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  Future<void> _selectDate() async {
    // ignore: no_leading_underscores_for_local_identifiers
    DateTime? _picked = await showDatePicker(
        builder: (context, child) {
          // ignore: sort_child_properties_last
          return Theme(child: child!, data: datePickerTheme);
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() {
        fecha.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("REPORTAR SITUACIÓN ANORMAL"),
        ),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(30),
                child: TextField(
                    onTap: _selectDate,
                    readOnly: true,
                    controller: fecha,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 243, 135,
                                127), // Establece un color transparente para quitar el color azul
                          ),
                        ),
                        labelText: 'Fecha de la situación',
                        labelStyle: TextStyle(
                          color: Colors
                              .grey, // Cambia el color de la etiqueta cuando no está enfocado
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always))),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: TextField(
                    controller: lugar,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 243, 135,
                                127), // Establece un color transparente para quitar el color azul
                          ),
                        ),
                        labelText: 'Lugar de la situación',
                        labelStyle: TextStyle(
                          color: Colors
                              .grey, // Cambia el color de la etiqueta cuando no está enfocado
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always))),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: TextField(
                  controller: descripcion,
                  maxLines: 7,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 243, 135,
                              127), // Establece un color transparente para quitar el color azul
                        ),
                      ),
                      labelText: 'Descripción de la situación',
                      labelStyle: TextStyle(
                        color: Colors
                            .grey, // Cambia el color de la etiqueta cuando no está enfocado
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                )),
            GestureDetector(
                onTap: () {
                  register_situationanorm();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: Center(
                      child: Container(
                          height: 50,
                          width: 200,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Center(
                              child: Text(
                            "REGISTRAR SITUACIÓN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )))),
                )),
          ],
        ));
  }
}
