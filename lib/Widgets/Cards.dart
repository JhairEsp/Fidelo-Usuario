import 'package:fidelo/Screens/CardScreens/Categorias/Cafeteria.dart';
import 'package:fidelo/Screens/CardScreens/Categorias/Comida.dart';
import 'package:fidelo/Screens/CardScreens/Categorias/Tecnologia.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String category;
  final String imageUrl;

  CustomCard({required this.name, required this.category, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
          alignment: AlignmentDirectional(1.00, 0.00),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: 122,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Text(
                              category,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.89, -0.03),
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class CustomCategoryItem extends StatelessWidget {
  final String category;
  final String imageUrl;

  CustomCategoryItem({required this.category, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (category == "Tecnologia") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => categoritaTecnologia(),));
        }
        if (category == "Comida") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => categoriaComida(),));
        }
        if (category == "Cafeteria") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => categoriaCafeteria()));
        }
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 0.2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  width: 90,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl), // Usar la URL proporcionada
                    ),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}