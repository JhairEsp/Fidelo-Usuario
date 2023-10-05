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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _navigate(context);
              },
              child: ListTile(
                title: Text(titulo!, style: const TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.bold),),
                subtitle: Text(categoria!,style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),),
                leading: Image.network(imagen!,width: 60, height: 60, fit: BoxFit.cover,),
              ),
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
  void _navigate(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProgressCard(imagen: imagen, titulo: titulo,),));
  }
}