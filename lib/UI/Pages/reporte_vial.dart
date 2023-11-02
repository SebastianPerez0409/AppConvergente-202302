import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:iniciosesion/UI/Roles/analista_vial.dart';

class ReporteVial extends StatefulWidget {
  const ReporteVial({super.key});

  @override
  State<ReporteVial> createState() => _ReporteVialState();
}

class _ReporteVialState extends State<ReporteVial> {
  TextEditingController lugar = TextEditingController();
  TextEditingController descripcion = TextEditingController();

  Future reporte_vial() async {
    var url = Uri.http("192.168.0.10", 'reporte_vial.php', {'q': '{http}'});

    var response = await http.post(url, body: {
      "lugar": lugar.text,
      "descripcion": descripcion.text,
    });
    var data = json.decode(response.body);

    if (data == "Success") {
      Fluttertoast.showToast(
          msg: 'Reporte creado con éxito!',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT);
    }

    // Limpiar los campos de texto
    lugar.clear();
    descripcion.clear();
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnalistaVial()));
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, bottom: 40),
                child: Text(
                  "Reporte vial 🚳🚸",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff393839),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, bottom: 3, top: 10),
                child: Text(
                  "Lugar",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff393839)),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 30, bottom: 10, right: 30),
                  child: SizedBox(
                    height: 50,
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
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, bottom: 3, top: 10),
                child: Text(
                  "Descripción",
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
                    height: 200,
                    child: TextField(
                      controller: descripcion,
                      maxLines: 5,
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
          GestureDetector(
            onTap: () {
              reporte_vial();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Center(
                  child: Container(
                      height: 45,
                      width: 400,
                      decoration: const BoxDecoration(
                        color: Color(0xff9B51E0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                          child: Text(
                        "Registrar reporte",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )))),
            ),
          ),
        ],
      ),
    );
  }
}
