
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/Network/local/DioHelper.dart';
import 'package:untitled/Models/SearchModel/SearchModel.dart';
import 'package:untitled/Modules/serachScreen/cubit/searchState.dart';
import 'package:untitled/shared/constant/constants.dart';


class SearchCubit extends Cubit<serachState>
{
  SearchCubit():super(initialS());
  static SearchCubit get(context)=>BlocProvider.of(context);
  searchModel? search;
  void getSearch(String text)
  {
    emit(loadingS());
    DioHelper.postData(url: "products/search",
        token: token,
        data: {
      "text":text
    }).then((value){
      search = searchModel.fromJson(value.data);
      emit(successS());
    }).catchError((onError){
      emit(errorS(onError));
      print(onError.toString());
    });
  }
}