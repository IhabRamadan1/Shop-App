import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/Network/local/DioHelper.dart';
import 'package:untitled/Models/Login/userModel.dart';
import 'package:untitled/Modules/Register/cubit/RegisterStates.dart';

import '../../../shared/constant/constants.dart';

class registerCubit extends Cubit<RegisterStates> {
  registerCubit() :super(initialRegister());

  static registerCubit get(context) => BlocProvider.of(context);
  userModel? user;

  void userRegister({
    required String email,
    required String pass,
    required String name,
    required String phone,

  }) {
    emit(loadingRegister());
    DioHelper.postData(
      url: 'register',
      data: {
        "name": name,
        "email": email,
        "password": pass,
        "phone": phone,
      },
    ).then((value) {
      user = userModel.fromjson(value.data);
      print("hhhhhhh ${user!.status}");
      emit(successRegister(user!));
    }).catchError((onError) {
      print(onError.toString());
      emit(errorRegister(onError.toString()));
    });
  }

  bool ispass = true;
  IconData suffix = Icons.visibility_outlined;

  void visibChange() {
    ispass = !ispass;
    suffix = ispass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(successChangeRegister());
  }

  /*userModel ?registerSettigs;
  void getSettingsData()
  {
    emit(loadingSettingsRegister());
    DioHelper.getData(
        url: 'profile',
        token: token
    ).then((value){
      registerSettigs = userModel.fromjson(value.data);
      //print(homeModel!.status);
      //print("hhhhhhhhhhhhhhhhh ${homeModel!.data!.banners[0].image}");
      emit(successSettingsRegister());
    }).catchError((onError){
      print(onError.toString());
      emit(errorSettingsRegister(onError));
    });
  }*/
}