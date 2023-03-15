// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:my_kantin/dashboard.dart';
import 'package:my_kantin/forgotpassword.dart';

import '';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  

  @override
  
  Widget build(BuildContext context) {
    bool _obscureText= true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Login Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 35,
              color: Colors.teal,
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'enter email',
                        prefixIcon: Icon(Icons.email),
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
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        
                        labelText: 'Password',
                        hintText: 'enter password',
                        filled: false,
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {},
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                        );
                      },
              
                      // ignore: sort_child_properties_last
                      child: Text('Login'),
                      color: Colors.teal,
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
