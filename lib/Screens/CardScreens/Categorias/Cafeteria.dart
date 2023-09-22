import 'package:fidelo/Widgets/Cards.dart';
import 'package:flutter/material.dart';

class categoriaCafeteria extends StatefulWidget {
  const categoriaCafeteria({super.key});

  @override
  State<categoriaCafeteria> createState() => _categoriaCafeteriaState();
}

class _categoriaCafeteriaState extends State<categoriaCafeteria> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          CustomCard(name: "Starbucks", category: "Cafeteria", imageUrl: "https://purepng.com/public/uploads/large/purepng.com-starbucks-logologobrand-logoiconslogos-251519940454ao8bk.png"),
          ]
          ),
      ));
  }
}