class CategoriesModel
{
  bool? status;
  CategoriesDataModel? data;
  CategoriesModel.fromjson(Map<String,dynamic> json)
  {
    status = json['status'];
    data = CategoriesDataModel.fromjson(json['data']);
  }
}
class CategoriesDataModel
{
  int? currentPage;
  List<DataModell> data=[];
  CategoriesDataModel.fromjson(Map<String,dynamic> json)
  {
    currentPage = json['current_page'];
    for( var i in json['data'])
    {
      DataModell dat = DataModell.fromjson(i);
      data.add(dat);
    }
  }
}
class DataModell
{
   int? id;
   String ?name;
   String? image;
   DataModell.fromjson(Map<String, dynamic> json)
   {
     id = json['id'];
     name = json['name'];
     image = json['image'];
   }
}