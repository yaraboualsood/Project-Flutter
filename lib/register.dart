
import 'package:flutter/material.dart';
import 'package:login/navBar.dart';
import 'package:login/register_provider.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

var formKey = GlobalKey<FormState>();
var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var phoneController = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REGISTER',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    'REGISTER now to get our products',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,

                      //enabled: isClickable,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name address';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,

                      //enabled: isClickable,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your email address';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,

                      //enabled: isClickable,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your passWord address';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'password',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,

                      //enabled: isClickable,

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone is too short';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'phone',
                        prefixIcon: Icon(Icons.phone_android),
                        border: OutlineInputBorder(),
                      )),
                  SizedBox(
                    height: 30.0,
                  ),
                  
                       Consumer<RegisterProvider>(
                        builder: (context,regprov,child){
                          return  GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              
                              regprov.register(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              ).then((value) {
                                if(regprov.registerModel!.status==false){
                                  ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                  regprov.registerModel!.message.toString()),
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.blue,
                                ));

                                }else{
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Layout()));

                                }
                                print("value "+value.toString());
                                 
                               
                               
                              });
                            
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.blue,
                            ),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                                             // );
                                           // },
                                         );
                        },
                       ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
