import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Dio/DioHelper.dart';
import 'package:untitled/Models/Login/userModel.dart';
import 'package:untitled/Models/categories/categoriesModel.dart';
import 'package:untitled/Models/favModel/favModel.dart';
import 'package:untitled/Models/favModel/getFavModel.dart';
import 'package:untitled/Models/homeModel/homeModel.dart';
import 'package:untitled/Modules/categoriesScreen/categoriesScreen.dart';
import 'package:untitled/Modules/favouriteScreen/favouriteScreen.dart';
import 'package:untitled/Modules/homeScreen/homeScreen.dart';
import 'package:untitled/Modules/settingsScreen/settingsScreen.dart';
import 'package:untitled/constant/constants.dart';
import 'package:untitled/layouts/cubit/shopstate.dart';

class shopCubit extends Cubit<shopStates>
{
  shopCubit():super(initialShop());
  static shopCubit get(context)=>BlocProvider.of(context);
 userModel? user;
  void userLogin({
  required String email,
  required String pass,
})
{
  emit(loadingShop());
  DioHelper.postData(
      url: 'login',
      data:{
        "email":email,
        "password":pass,
      },
  ).then((value) {
    user= userModel.fromjson(value.data);
    print("hhhhhhh ${user!.status}");
    //getHomeData();
    emit(successShop(user!));
  }).catchError((onError)
  {
    print(onError.toString());
    emit(errorShop(onError));
  });
}
bool ispass = true;
IconData suffix = Icons.visibility_outlined ;
void visibChange()
{
  ispass =!ispass;
  suffix = ispass? Icons.visibility_outlined : Icons.visibility_off_outlined;
  emit(successChange());
}
var count =0;
List<Widget> screens=[
 homeScreen(),
  categoriesScreen(),
  favScreen(),
  settingsScreen(),
];
void changeButton(int index)
{
  count = index;
  emit(bottomChange());
}
HomeModel? homeModel;
Map<int,bool> fav ={};

void getHomeData()
{
  emit(loadingHome());
  DioHelper.getData(
      url: 'home',
    token: token
  ).then((value){
    homeModel = HomeModel.fromjson(value.data);
    //print(homeModel!.status);
    //print("hhhhhhhhhhhhhhhhh ${homeModel!.data!.banners[0].image}");
    homeModel!.data!.products.forEach((element) {
      fav.addAll({
          element.id! : element.isFav!,
      });
    });
    emit(successHome());
  }).catchError((onError){
    print(onError.toString());
    emit(errorHome(onError));
  });
}

  CategoriesModel? categoryModel;
  void getCategoriesData()
  {
    emit(loadingCategory());
    DioHelper.getData(
        url: 'categories',
        token: token
    ).then((value){
      categoryModel = CategoriesModel.fromjson(value.data);
      //print(homeModel!.status);
      //print("hhhhhhhhhhhhhhhhh ${homeModel!.data!.banners[0].image}");
      emit(successCategory());
    }).catchError((onError){
      print(onError.toString());
      emit(errorCategory(onError));
    });
  }

 late userModel settings;
 void getSettingsData()
  {
    emit(loadingSettings());
    DioHelper.getData(
        url: 'profile',
        token: token
    ).then((value) {
      settings = userModel.fromjson(value.data);
      //print(homeModel!.status);
      //print("hhhhhhhhhhhhhhhhh ${homeModel!.data!.banners[0].image}");
      emit(successSettings());
    }).catchError((onError){
      print(onError.toString());
      emit(errorSettings(onError));
    });
  }
 FavModel? favMod;
 void changeFav(int productId)
 {

   fav[productId] = !(fav[productId]!);
   emit(changefav());
   DioHelper.postData(
       url: "favorites",
       data: {
         "product_id": productId,
       },
     token: token,
   ).then((value){
     favMod = FavModel.fromjson(value.data);
     getFavScreen();
     print(value.data);
     emit(successFav());
   }).catchError((e){
     emit(errorFav(e));
     print("jjjjjjjjjjjjjjj $e");
   });
 }

  getFavMode? getFav;
  void getFavScreen()
  {
    emit(loadingFavScreen());
    DioHelper.getData(
        url: 'favorites',
        token: token
    ).then((value){
      getFav = getFavMode.fromJson(value.data);
      //print(homeModel!.status);
      //print("hhhhhhhhhhhhhhhhh ${homeModel!.data!.banners[0].image}");
      emit(successFavScreen());
    }).catchError((onError){
      print("jjjjjjjjjjjjjjj $onError");
      emit(errorFavScreen(onError));
    });
  }
  bool isDark=false;
  void changeLight()
  {
    isDark = !isDark;
    emit(darkState());
  }
}