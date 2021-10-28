import 'package:flutter/material.dart';
// import './snackbar.dart';
import './dropdown.dart';
import './home.dart';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final idController = TextEditingController();

  final passController = TextEditingController();

  final emailController = TextEditingController();

  bool _isOff = true;

  @override
  void initState() {
    idController.addListener(checkFormValidity);
    passController.addListener(checkFormValidity);
    emailController.addListener(checkFormValidity);
    super.initState();
  }

  void checkFormValidity() {
    setState(() {
      if (idController.text.isEmpty ||
          passController.text.isEmpty ||
          emailController.text.isEmpty) {
        _isOff = true;
      } else {
        _isOff = false;
      }
    });
  }

  void submitData() {
    final enteredID = idController.text;
    final enteredPASS = passController.text;
    final enteredEMAIL = emailController.text;
    if (enteredID.isEmpty || enteredPASS.isEmpty || enteredEMAIL.isEmpty) {}

    print('$enteredID');
  }

  @override
  void dispose() {
    idController.dispose();
    passController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 100),
                alignment: Alignment.topCenter,
                child: Text(
                  'Welcome Message',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.lightBlue),
                ),
              ),
            ),
            Container(
              child: Image.asset('assets/images/derib.png'),
            ),
            Card(
                child: Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                      controller: idController,
                      onSubmitted: (val) => submitData,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'email'),
                    controller: emailController,
                    onSubmitted: (val) => submitData,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'password'),
                    controller: passController,
                    onSubmitted: (val) => submitData,
                  ),
                  Row(
                    children: [
                      Text('Choose gender: ',
                          style: TextStyle(color: Colors.black)),
                      DropDownDemo(),
                    ],
                  ),
                  ElevatedButton(
                          onPressed: !_isOff
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => home()),
                                  );
                                }
                              : null,
                          child: Text('SIGN UP'),
                        ),
                ],
              ),
            )),

            // ElevatedButton(
            //     child: Text(_isOff ? 'Sign up':'Sign Up',
            //         style: TextStyle(color: Colors.white)),
            //     onPressed: () {
            //       setState((){
            //         _isOff = !_isOff;
            //       }
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => home()),
            // );
            //     );},
            // ),
          ],
        ),
      ),
    );
  }
}
