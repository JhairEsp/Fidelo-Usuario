import 'package:fidelo/Screens/CardScreens/DetallesCardScreen.dart';
import 'package:fidelo/Screens/CardScreens/ProgessCard.dart';
import 'package:fidelo/Screens/HomeScreens/HomePage.dart';
import 'package:fidelo/Screens/NotificacionesScreens/NotificacionScreen.dart';
import 'package:fidelo/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:fidelo/Screens/QRScreens/QRScreens.dart';
import 'package:flutter/material.dart';

import '../../Widgets/NavBar.dart';

class MyCards extends StatelessWidget {
  String? titulo;
  String? categoria;
  String? imagen;

  MyCards({this.titulo,this.categoria,this.imagen});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(10), child: AppBar(automaticallyImplyLeading: false,elevation: 0,backgroundColor: Colors.white,)),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: Text("Mis Cartas",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            ExpansionTile(
            title: Row(
              children: [
                CircleAvatar(
                backgroundImage: NetworkImage("https://1000marcas.net/wp-content/uploads/2019/11/Apple-Logo.jpg"),
              ),
              SizedBox(width: 5,),
              Text("Apple")
              ],
            ),
            textColor: Colors.black,
            children: [
              Column(
  mainAxisSize: MainAxisSize.max,
  children: [
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
      child: Text(
        'Obten un 30% en la compra de un Iphone X',
        textAlign: TextAlign.center,
        style: TextStyle(
              fontFamily: 'Readex Pro',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
      ),
    ),
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white ,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Icon(
              Icons.star,
              color: Colors.black,
              size: 15,
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
ElevatedButton(
  onPressed: () {
    print('Registrar button pressed ...');
  },
  style: ElevatedButton.styleFrom( // Color del botón
    elevation: 3, // Elevación del botón
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Borde del botón
    ),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
    child: Text(
      'Registrar',
      style: TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.white,
      ),
    ),
  ),
),

ElevatedButton(
  onPressed: () {
    print('Reclamar button pressed ...');
  },
  style: ElevatedButton.styleFrom(

    elevation: 3, // Elevación del botón
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Borde del botón
    ),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
    child: Text(
      'Reclamar',
      style: TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.white,
      ),
    ),
  ),
),

        ],
      ),
    ),
  ],
)

            ],
            )
          ],
        ),
      ),
      

                    bottomNavigationBar: CustomBottomNavigationBar(
            selectedIndex: 2, 
            onTabChange: (index){
              switch(index){
                case 0 : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)); break;
                case 1 : Navigator.push(context, MaterialPageRoute(builder: (context)=>const QRScreen())); break;
                case 2: null ; break;
                case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=> const notificaciones())); break;
                case 4: Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen())); break;
              }
            }
            ),
    );
  }

}