
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Models/Login/userModel.dart';
import 'package:untitled/Modules/Login/cubit/AppStates.dart';

import '../../../shared/Network/local/DioHelper.dart';
import '../../../shared/constant/constants.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(initialAppState());
  static AppCubit get(context)=> BlocProvider.of(context);
  userModel ?settings;
  void getSettingsData()
  {
    emit(loadingSettings());
    DioHelper.getData(
        url: 'profile',
        token: token
    ).then((value){
      settings = userModel.fromjson(value.data);
        //print(settings!.status);
      //print("hhhhhhhhhhhhhhhhh ${homeModel!.data!.banners[0].image}");
      emit(successSettings());
    }).catchError((onError){
      print(onError.toString());
      emit(errorSettings(onError));
    });
  }
}
