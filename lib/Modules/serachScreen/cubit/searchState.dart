
abstract class serachState{}
class initialS extends serachState{}
class loadingS extends serachState{}
class successS extends serachState{}
class errorS extends serachState{
  final String error;

  errorS(this.error);
}