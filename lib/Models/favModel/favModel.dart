class FavModel {
  bool? status;
  String? message;

  FavModel.fromjson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
  }
}