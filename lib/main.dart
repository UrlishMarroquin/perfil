import 'package:flutter/material.dart';
import 'package:perfil/pages/perfil_page.dart';

void main() {
  runApp(
    MaterialApp(
      /*theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),*/
      home: PerfilPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}