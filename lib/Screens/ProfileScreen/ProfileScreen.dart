import 'package:fidelo/Screens/HomeScreens/HomePage.dart';
import 'package:fidelo/models/Auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          'https://picsum.photos/seed/806/600',
                          width: 150,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: Text(
                                'Nombre+Apellido',
                                style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.grey[200],
                        size: 24,
                      ),
                      Text(
                        'email@gmail.com',
                        style: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Colors.grey[200],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$num',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Tarjetas Disponibles',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$num',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Tarjetas Reclamadas',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                  ),
                  title: Text(
                    'Tus Favoritos',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  tileColor: Colors.white,
                  dense: false,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: ListTile(
                  onTap: () => print("Codigo de Referencia"),
                  leading: Icon(
                    Icons.share,
                  ),
                  title: Text(
                    'Codigo de Referencia',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  tileColor: Colors.white,
                  dense: false,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: ListTile(
                  leading: Icon(
                    Icons.percent,
                  ),
                  title: Text(
                    'Promociones',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  tileColor: Colors.white,
                  dense: false,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                  ),
                  title: Text(
                    'Configuracion',
                    style: TextStyle(
                      fontSize:22 ,
                    ),
                  ),
                  tileColor: Colors.white,
                  dense: false,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: ElevatedButton(
  onPressed: () {
    Auth.logout(context);
  },
  style: ElevatedButton.styleFrom(
    primary: Color(0xFFE700FF),
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: Container(
    height: 40,
    width: 150,
    padding: EdgeInsets.symmetric(horizontal: 24),
    alignment: Alignment.center,
    child: Text(
      'Cerrar Sesión',
      style: TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.white,
      ),
    ),
  ),
)

              ),
            ],
          ),
        ),
                bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              onTabChange: (index){
                switch (index) {
                  case 0:
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    break;
                  default:
                }
              },
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(icon: Icons.home, text: "Home",),
                GButton(icon: Icons.qr_code , text:"Qr" ,),
                GButton(icon: Icons.notifications, text: "Notificaciones",),
                GButton(icon: Icons.person_pin, text: "Mi cuenta",),
              ],
              selectedIndex: 3,
            ),
          ),
        )
      ),
    );
  }
}