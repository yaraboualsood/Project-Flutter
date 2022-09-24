import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/home.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  bool isPass = true;
  
  
  Widget build(BuildContext context) {
     return Scaffold( 
      backgroundColor: Colors.white,
    body: ListView(
      children: [
        Container(
        height: 260,
        color: Colors.white,
        child: Stack(
        fit: StackFit.loose
        ,children:[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 190,
          color: Colors.blue,
          child: Center(child: Text("Choose a cover photo", style: TextStyle(color: Colors.grey.shade300),)),
        ),
        Positioned(
          top: 140,
          left: 160,
          child: Container(
            width: 100,
            height: 100,
           decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.9)
            ,shape: BoxShape.circle
           )
          , child: (Icon(Icons.camera_enhance, color: Colors.white,)),
        )
        ),
        ],
      ),
      ),

    Padding(
      padding: EdgeInsets.only(left:10, right:10, top:5),
      child: SingleChildScrollView(
        child:Form(
          autovalidateMode: AutovalidateMode.always,
          key: FormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Edit Your Profile:", style: TextStyle(color: Colors.grey.shade600), ),
      
     SizedBox( height: 15 ),

      // name
             TextFormField(
                controller: nameController,
                 onFieldSubmitted: (value) {            
                  print(value);
                },
                onChanged: (value) {
                   print(value);           
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                  return "please enter your name";
                }
              },          
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                 labelText: "Name",
                prefixIcon: Icon(Icons.person)

               ,errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
               borderSide: BorderSide(color: Colors.red)),
               focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red))),            
             ),
                              
                               
             SizedBox( height: 15 ),
                  
                  
      // Email
           TextFormField(
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
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
       border: OutlineInputBorder(),
       labelText: "Email Address",
       prefixIcon: Icon(Icons.email)

     ,errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red))
     ),
   ),
                  
         SizedBox(height: 15,),
                  
     // Password
         TextFormField(
          controller: passController,
            onFieldSubmitted: (value) {
              print(value);
             },
              onChanged: (value) {
               print(value);
            },
              validator: (String? value) {
                if (value!.length<8) {
                return "your password must be 8 characters or more";
            }
          },
            keyboardType: TextInputType.visiblePassword,
            obscureText: isPass,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Password",
            prefixIcon: Icon(Icons.lock),
             suffixIcon:IconButton( onPressed:(){
              setState(() {
               isPass=!isPass;
             });
           }
          ,icon: Icon(isPass?Icons.visibility_off:Icons.visibility),   
       )
                        
        ,errorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red))
        )
       ),
         
         SizedBox(height: 15),
                  
   // Phone
       TextFormField(
          controller: phoneController,
          onFieldSubmitted: (value) {
            print(value);
       },
          onChanged: (value) {
            print(value);
          },
        validator: (String? value) {
        if (value!.isEmpty) {
        return "please enter your phone number";
        }
      },
       keyboardType: TextInputType.phone,
       decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Phone",
        prefixIcon: Icon(Icons.phone_android)
                                           
        ,errorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
       borderSide: BorderSide(color: Colors.red))),
      ),

     SizedBox(height: 15),

   //Button
       Center(
       child: Container(
      child: MaterialButton(
        onPressed: () {  
        print("name is" + emailController.text);
        print("email is" + passController.text);
        print("password is" + emailController.text);
        print("phone is" + passController.text);
       if (FormKey.currentState!.validate()) {
          Navigator.push(
             context,
          MaterialPageRoute(
         builder: (context) => HomeScreen()));
         }
       },
          child: Text("Save",
             style: TextStyle(fontSize: 20, color: Colors.white),
             ),  
                   ),
          width: 200,
          height: 55,
          decoration: BoxDecoration(
           color: Colors.blue,
            borderRadius: BorderRadius.circular(20)),
          )
         )
      
          ],
        ),
      ),
     )
    )
    ] 
   ) 
  );
 }
} 