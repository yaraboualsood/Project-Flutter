import 'package:flutter/material.dart';
import 'package:login/login_provider.dart';
import 'package:login/register.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'navBar.dart';
// ignore_for_file: prefer_const_constructors

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  bool isPass = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 50, left: 30, right: 30),
          child: SingleChildScrollView(
            reverse: true,
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: FormKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    SizedBox(height: 10),

                    Text(
                      "Login now to see our products!",
                      style: TextStyle(color: Colors.grey),
                    ),

                    SizedBox(height: 35),

                    // Email Form Field
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "please enter your email";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email Address",
                          prefixIcon: Icon(Icons.email),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red))),
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    // Password Form Field
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passController,
                      obscureText: isPass,
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      validator: (String? value) {
                        if (value!.length < 8) {
                          return "your password must be 8 characters or more";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPass = !isPass;
                              });
                            },
                            icon: Icon(isPass
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    //Button
                    Center(
                        child: Container(
                      child: Consumer<LoginProvider>(
                          builder: (context, logprov, child) {
                        return MaterialButton(
                          onPressed: () {
                            print("email is" + emailController.text);
                            print("password is" + passController.text);
                            if (FormKey.currentState!.validate()) {
                              logprov.login(
                                email: emailController.text,
                                password: passController.text,
                              )
                              .then((value) {
                                  if(logprov.loginModel!.status==false){
                                    ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                    logprov.loginModel!.message.toString()),
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.blue,
                                  ));

                                  }else{
                                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>Layout()));
                                  }
                                  print("value "+value.toString());
                                });

                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        );
                      }),
                      width: 300,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                    ))

                    //Register button
                    ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Text("Register Now"))
                      ],
                    )
                  ]),
            ),
          )),
    );
  }
}
