import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:iniciosesion/UI/LogIn/login.dart';
import 'package:iniciosesion/UI/Pages/reporte_vial.dart';

class EncargadoMantVial extends StatefulWidget {
  const EncargadoMantVial({super.key});

  @override
  State<EncargadoMantVial> createState() => _EncargadoMantVialState();
}

class User {
  final String id_reporte;
  final String lugar;
  final String descripcion;

  User({
    required this.id_reporte,
    required this.lugar,
    required this.descripcion,
  });
}

class _EncargadoMantVialState extends State<EncargadoMantVial> {
  final ScrollController _firstController = ScrollController();

  // ignore: non_constant_identifier_names
  Future encargado_vial() async {
    var url = Uri.http("192.168.0.10", 'reporte_vial.php', {'q': '{http}'});
    final response = await http.get(url);
    var responseData = json.decode(response.body);

    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id_reporte: singleUser["id_reporte"],
          lugar: singleUser["lugar"],
          descripcion: singleUser["descripcion"]);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17, top: 30, bottom: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, bottom: 30),
                child: Text(
                  "Encargado de mantenimiento vial! 👨‍✈️",
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
          Expanded(
            child: FutureBuilder(
              future: encargado_vial(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Scrollbar(
                    thickness: 7.0,
                    thumbVisibility: true,
                    radius: Radius.circular(5),
                    controller: _firstController,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFe7e1e1).withOpacity(1),
                                    offset: Offset(2, 10),
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
                                      snapshot.data[index].id_reporte,
                                      style: const TextStyle(
                                        color: Color(0xff9B51E0),
                                        fontSize: 25,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Texto  lugar
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("📍  Lugar",
                                                    textAlign: TextAlign.start,
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
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400)),
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
                                                const Text("🖊️  Descripción",
                                                    textAlign: TextAlign.start,
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
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400)),
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
        ],
      ),
    );
  }
}
