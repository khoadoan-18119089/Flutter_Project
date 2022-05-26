import 'package:flutter/material.dart';

void main() {
  return runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(child: login()),
    ),
  ));
}

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('images/khoa.jpg'),
        ),
        Center(
          child: Text(
            'KhoaDoan',
            style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            'Flutter Developed',
            style: TextStyle(
                fontSize: 45,
                color: Colors.black,
                fontFamily: 'Pacifico',
                letterSpacing: 1.5),
          ),
        ),
        SizedBox(
          height: 20,
          width: 150,
          child: Divider(
            color: Colors.white,
          ),
        ),
        Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.lightBlueAccent,
                ),
                title: Text(
                  '0905257591',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
        Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.lightBlueAccent,
                ),
                title: Text(
                  'doanphamdangkhoa@gmail.com',
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
              )),
        )
      ],
    );
  }
}
