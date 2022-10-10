import 'package:untitled/Models/Login/userModel.dart';

abstract class RegisterStates{}
class initialRegister extends RegisterStates{}
class loadingRegister extends RegisterStates{}
class successRegister extends RegisterStates{
  final userModel userMod;

  successRegister(this.userMod);

}
class errorRegister extends RegisterStates
{
  final String error;

  errorRegister(this.error);
}
class successChangeRegister extends RegisterStates{}

class loadingSettingsRegister extends RegisterStates{}
class successSettingsRegister extends RegisterStates{
}
class errorSettingsRegister extends RegisterStates
{
  final String error;

  errorSettingsRegister(this.error);
}