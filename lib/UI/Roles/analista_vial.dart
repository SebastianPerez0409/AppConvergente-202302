import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:iniciosesion/UI/LogIn/login.dart';
import 'package:iniciosesion/UI/Pages/reporte_vial.dart';

class AnalistaVial extends StatefulWidget {
  const AnalistaVial({super.key});

  @override
  State<AnalistaVial> createState() => _AnalistaVialState();
}

class User {
  final String id_situacion;
  final String correo;
  final String fecha;
  final String lugar;
  final String descripcion;

  User({
    required this.id_situacion,
    required this.correo,
    required this.fecha,
    required this.lugar,
    required this.descripcion,
  });
}

class _AnalistaVialState extends State<AnalistaVial> {
  final ScrollController _firstController = ScrollController();

  Future analista_vial() async {
    var url = Uri.http("192.168.0.10", 'analista_vial.php', {'q': '{http}'});
    final response = await http.get(url);
    var responseData = json.decode(response.body);

    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id_situacion: singleUser["id_situacion"],
          correo: singleUser["correo"],
          fecha: singleUser["fecha"],
          lugar: singleUser["lugar"],
          descripcion: singleUser["descripcion"]);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: EdgeInsets.only(left: 30, bottom: 40),
                  child: Text(
                    "Agende de tránsito! 👨‍✈️",
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
            // ignore: sized_box_for_whitespace
            Container(
              height: 360,
              child: FutureBuilder(
                future: analista_vial(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Scrollbar(
                      thickness: 7.0,
                      thumbVisibility: true,
                      radius: Radius.circular(5),
                      controller: _firstController,
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        controller: _firstController,
                        itemBuilder: (ctx, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height: 252,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFe7e1e1)
                                          .withOpacity(1),
                                      offset: const Offset(2, 10),
                                      blurRadius: 7,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      Text(
                                        snapshot.data[index].id_situacion,
                                        style: const TextStyle(
                                          color: Color(0xff9B51E0),
                                          fontSize: 25,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Texto usuario creación
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "🙎‍♂️  Usuario creación",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxWidth: 250),
                                                    child: Text(
                                                        snapshot
                                                            .data[index].correo,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // Texto fecha creación
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "📅  Fecha creación",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxWidth: 250),
                                                    child: Text(
                                                        snapshot
                                                            .data[index].fecha,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // Texto  lugar
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("📍  Lugar",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxWidth: 250),
                                                    child: Text(
                                                        snapshot
                                                            .data[index].lugar,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "🖊️  Descripción de la situación",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Container(
                                                    constraints:
                                                        const BoxConstraints(
                                                            maxWidth: 250),
                                                    child: Text(
                                                        snapshot.data[index]
                                                            .descripcion,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 40, right: 20),
              child: Text(
                '¿Deseas dar algun reporte a los encargados de mantenimiento vial?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReporteVial()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
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
            )
          ],
        ),
      ),
    );
  }
}
