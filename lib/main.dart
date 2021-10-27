import 'package:flutter/material.dart';
// import './snackbar.dart';
import './dropdown.dart';
import './home.dart';
import 'dart:developer';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  final idController = TextEditingController();
  final passController = TextEditingController();
  final emailController = TextEditingController();
  
  bool _isOff = true;

  
  void submitData() {
    final enteredID = idController.text;
    final enteredPASS = passController.text;
    final enteredEMAIL = emailController.text;
    if (enteredID.isEmpty || enteredPASS.isEmpty || enteredEMAIL.isEmpty) {
      return;
    }
    
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
                      TextField(                       
                        decoration: InputDecoration(labelText: 'Name'),
                        controller: idController,
                        onSubmitted: (val) => submitData,
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
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: passController,
                        builder:(context,value,child){
                          return /* Stack(
                            children:[ Positioned(
                              top:50,
                              child:  */ElevatedButton(
                                onPressed: value.text.isNotEmpty ? () {
                                  Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => home()),
                                              );
                                }:null,
                                child: Text('SIGN UP'),
                              ),
                            /* ),
                            ]); */
                        }
                      ),
                      Row(
                        children: [
                          Text('Choose gender: ',style:TextStyle(color: Colors.black)),
                          DropDownDemo(),
                        ],
                      ),
                    ],
                  )),
            ),
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
