import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Models/Login/userModel.dart';
import 'package:untitled/Modules/Login/LoginScreen.dart';
import 'package:untitled/Modules/Register/cubit/RegisterCubit.dart';
import 'package:untitled/layouts/cubit/shopCubit.dart';
import 'package:untitled/layouts/cubit/shopstate.dart';
import 'package:untitled/layouts/onboarding_screen.dart';

import '../Login/cubit/AppCubit.dart';

class settingsScreen extends StatelessWidget {

  late var nameC = TextEditingController();
  late var emailC = TextEditingController();
  late var numberC = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<shopCubit,shopStates>(
      listener: (context,state){
      },
      builder: (context,state)
      {
        var model = shopCubit.get(context).settings;
             nameC.text = (model!.data!.name)!;
             numberC.text = (model!.data!.phone)!;
             emailC.text = (model!.data!.email)!;

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 40,),
              TextFormField(
                controller: nameC,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: emailC,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: numberC,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                color: Colors.blue,
                height: 50,
                child: MaterialButton(

                  onPressed:(){
                    //shopCubit.get(context).user;
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>onboardingScreen()), (route) => false);
                },
                  child: Text("LOG OUT"),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}