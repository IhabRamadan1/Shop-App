import 'package:untitled/Models/Login/userModel.dart';

abstract class shopStates{}
class initialShop extends shopStates{}
class loadingShop extends shopStates{}
class successShop extends shopStates{
  final userModel userMod;

  successShop(this.userMod);

}
class errorShop extends shopStates
{
  final String error;

  errorShop(this.error);
}
class successChange extends shopStates{}
class bottomChange extends shopStates{}

class loadingHome extends shopStates{}
class successHome extends shopStates{

}
class errorHome extends shopStates
{
  final String error;

  errorHome(this.error);
}

class loadingCategory extends shopStates{}
class successCategory extends shopStates{

}
class errorCategory extends shopStates
{
  final String error;

  errorCategory(this.error);
}

class loadingSettings extends shopStates{}
class successSettings extends shopStates{

}
class errorSettings extends shopStates
{
  final String error;

  errorSettings(this.error);
}

class loadingFav extends shopStates{}
class successFav extends shopStates{

}
class errorFav extends shopStates
{
  final String error;

  errorFav(this.error);
}
class changefav extends shopStates{}

class loadingFavScreen extends shopStates{}
class successFavScreen extends shopStates{

}
class errorFavScreen extends shopStates
{
  final String error;

  errorFavScreen(this.error);
}

class darkState extends shopStates{}