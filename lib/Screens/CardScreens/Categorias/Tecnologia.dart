import 'package:flutter/material.dart';

import '../../../Widgets/Cards.dart';

class categoritaTecnologia extends StatefulWidget {
  const categoritaTecnologia({super.key});

  @override
  State<categoritaTecnologia> createState() => _categoritaTecnologiaState();
}

class _categoritaTecnologiaState extends State<categoritaTecnologia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categoria de Tecnologia"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
      Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
      child: Align(child: CustomCard(name: "Apple", category: "Tecnologia", imageUrl: "https://images.unsplash.com/photo-1621768216002-5ac171876625?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBwbGUlMjBsb2dvfGVufDB8fDB8fHww&w=1000&q=80"),),
      )
          ]
        ),
      ),
    );
  }
}