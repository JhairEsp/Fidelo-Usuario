import 'package:fidelo/Widgets/Cards.dart';
import 'package:flutter/material.dart';

class categoriaComida extends StatefulWidget {
  const categoriaComida({super.key});

  @override
  State<categoriaComida> createState() => _categoriaComidaState();
}

class _categoriaComidaState extends State<categoriaComida> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
                                  CustomCard(name: "Rockys", category: "Comida", imageUrl: "https://mir-s3-cdn-cf.behance.net/projects/404/3e270297243061.Y3JvcCwzOTQ3LDMwODgsNzgsMA.jpg"),
                                  CustomCard(name: "Rockys", category: "Comida", imageUrl: "https://mir-s3-cdn-cf.behance.net/projects/404/3e270297243061.Y3JvcCwzOTQ3LDMwODgsNzgsMA.jpg"),
                                  CustomCard(name: "Rockys", category: "Comida", imageUrl: "https://mir-s3-cdn-cf.behance.net/projects/404/3e270297243061.Y3JvcCwzOTQ3LDMwODgsNzgsMA.jpg"),
          ]
        ),
      ),
    );
  }
}