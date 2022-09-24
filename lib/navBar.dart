import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/profile.dart';
import 'package:provider/provider.dart';

import 'categories.dart';
import 'home.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  List<Widget>screens=
  [ 
    HomeScreen(), 
    Categories (),
    MyProfile()
 
  ];
List<String> title=
[
  "Home",
  "Categories",
  "My Account"
];
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    // create: ((context) => bottomProvider()),
    //   child: 
    return Scaffold(
       appBar: AppBar(
        title: Text(title[currentIndex],style: TextStyle(color: Colors.white),)
      , centerTitle: true,
       )
      
       ,body: screens[currentIndex] ,
       
       bottomNavigationBar: 
      // Consumer(builder: (context, navprov, child) {
    //  return
       BottomNavigationBar(       
        items: 
        <BottomNavigationBarItem> [ 
          BottomNavigationBarItem(label: "My Home",icon: Icon(Icons.home)),
          BottomNavigationBarItem( label: "Categories", icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: "My Account", icon: Icon(Icons.person),)
          ],
          
        currentIndex: currentIndex,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        
        onTap: (int index) {
        //  navprov.currentIndexNav(index);
          setState(() {
            currentIndex = index;
            print("setstate");
          });
          print("current index is " + currentIndex.toString());

        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
        },
       )
          
      
     , drawer: Drawer(backgroundColor: Colors.white),

   //}
   );
  
 //   )
   // );
  }
}

// class bottomProvider with ChangeNotifier{
//   int currentIndex=0;
//   void currentIndexNav(index){
//     currentIndex=index;
//     notifyListeners();
//   }
// }