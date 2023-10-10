import 'package:fidelo/Screens/CardScreens/MisCards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetallesCardScreen extends StatelessWidget {
  String? titulo;
  String? categoria;
  String? imagen;

  DetallesCardScreen({required this.titulo, required this.categoria, required this.imagen});

  
  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: Colors.white,
  body: Stack(
    children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Container(
              width: 600,
              height: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxjYWZldGVyaWF8ZW58MHx8fHwxNjk2OTU4NjU3fDA&ixlib=rb-4.0.3&q=80&w=1080',
                  ).image,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
            child: Text(
              titulo!,
              style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          Text(
            categoria!,
            style: TextStyle(fontSize: 12),
          ),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              ListTile(
                leading: Icon(
                  Icons.location_on,
                ),
                title: Text(
                  'Ubicacion',
                  style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                ),
                tileColor: Colors.white,
                dense: false,
              ),
              ListTile(
                leading: Icon(
                  Icons.schedule,
                ),
                title: Text(
                  'Horarios',
                  style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                ),
                tileColor: Colors.white,
                dense: false,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl pretium fusce id velit ut tortor. Nunc id cursus metus aliquam eleifend mi in nulla posuere. Id diam maecenas ultricies mi eget. Lobortis mattis aliquam faucibus purus in massa. Placerat in egestas erat imperdiet sed euismod. Vitae tempus quam pellentesque nec nam aliquam. Sapien faucibus et molestie ac feugiat sed lectus. Ut sem nulla pharetra diam sit amet. Id interdum velit laoreet id donec. Lorem donec massa sapien faucibus et. Neque vitae tempus quam pellentesque nec nam aliquam sem et. Euismod lacinia at quis risus sed vulputate odio.',
              style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: IntrinsicHeight(
            child: Column(
              children: [
                Text("Tarjeta Registrada"),
                Image.network("https://cdn-icons-png.flaticon.com/256/2058/2058255.png"),

              ],
            ),
          ),
        );
      }
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyCards(),));
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.blue, // Color del botón
    elevation: 3, // Elevación del botón
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // Borde del botón
    ),
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
    child: Text(
      'Afiliarse',
      style: TextStyle(
        fontFamily: 'Readex Pro',
        color: Colors.white,
      ),
    ),
  ),
),


        ],
      ),
      Align(
        alignment: AlignmentDirectional(0.00, -0.45),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                imagen!
              ).image,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x33000000),
                offset: Offset(0, 2),
                spreadRadius: 2,
              )
            ],
          ),
        ),
      ),
IconButton(
  icon: Icon(
    Icons.chevron_left,
    color: Colors.white,
    size: 24,
  ),
  onPressed: () {
    Navigator.pop(context);
    print("cambia");
  },
)

    ],
  ),
);
  }
}
