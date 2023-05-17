// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:my_kantin/buttonN.dart';
import 'package:my_kantin/controller/loginController.dart';
import 'package:my_kantin/dashboard.dart';
import 'package:my_kantin/forgotpassword.dart';
import 'package:my_kantin/buttonN.dart';
import 'package:my_kantin/requestBarang.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> { 
  TextEditingController namaController = TextEditingController();
  TextEditingController pwController = TextEditingController();


  void proceslogin(context){
    var data = LoginController().login(namaController.text, pwController.text).then((value) {
      if (value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>HalPage(hal: 2,)));
      } else {
        showDialog(context: context, builder: ((BuildContext context){
          return AlertDialog(
            title: Text('login gagal'),
            content: Text('periksa kembali username dan passoword anda'),
            actions: [
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("ok"))
            ],
          );
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _obscureText= true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('myKantin'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: namaController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'username',
                        hintText: 'enter username',
                        prefixIcon: Icon(Icons.people_alt),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter email' : null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: pwController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'enter password',
                        filled: false,
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {},
                      onFieldSubmitted: (text){
                        proceslogin(context);
                      },
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter password' : null;
                      },
                    ),
                  ),
              
                 
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      // Within the `FirstRoute` widget
                      onPressed: () {
                        proceslogin(context);
                      },
              
                      // ignore: sort_child_properties_last
                      child: Text('Login'),
                      color: Colors.black,
                      textColor: Colors.white,
                    ),
                  ),
                    SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder:(context)=> const ForgotPassword() ));
                    },
                    child: Text('Forgot Password?'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
