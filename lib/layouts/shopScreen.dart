
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Modules/Login/LoginScreen.dart';
import 'package:untitled/Modules/serachScreen/serachScreen.dart';
import 'package:untitled/Network/Remote/sharedPref.dart';
import 'package:untitled/layouts/cubit/shopCubit.dart';
import 'package:untitled/layouts/cubit/shopstate.dart';

class shopScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit,shopStates>(
      listener:(context,state){} ,
      builder:(context,state)
      {
        return  Scaffold(
      appBar: AppBar(
      title: Text("ٍShop App"),
        actions: [
          IconButton(
            onPressed: (){
              shopCubit.get(context).changeLight();
              //Navigator.push(context,MaterialPageRoute(builder: (context)=> searchScreen()));
            },
            icon: Icon(Icons.light_mode_rounded, color: Colors.black,),
          ),
          IconButton(
            onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> searchScreen()));
           },
            icon: Icon(Icons.search,color: Colors.black,),
          ),
        ],
      ),
        body: shopCubit.get(context).screens[shopCubit.get(context).count],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: "Categories"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings"
              ),
            ],
            onTap: (index)
            {
              shopCubit.get(context).changeButton(index);
            },
            currentIndex: shopCubit.get(context).count,
          ),
        );
      },
    );
  }
}
/*Center(
        child: TextButton(
          onPressed: ()
          {
              cachHelper.RemoveData(key: "token").then((value) {
                 if(value)
                   {
                     Navigator.pushAndRemoveUntil(context,
                         MaterialPageRoute(builder: (context)=>LoginScreen()),
                             (route) => false);
                   }
            });
          },
          child: Text("LOG OUT"),
        ),
      ),*/