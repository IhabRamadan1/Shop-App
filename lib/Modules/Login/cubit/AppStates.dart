abstract class AppStates{}
class initialAppState extends AppStates{}

class loadingSettings extends AppStates{}
class successSettings extends AppStates{

}
class errorSettings extends AppStates
{
  final String error;

  errorSettings(this.error);
}