class userModel
{
  bool? status;
  String? message;
  userData? data;
  userModel( this.status, this.message, this.data);
  userModel.fromjson(Map<String,dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null? userData.fromjson(json['data']) : null;
  }
}
class userData
{
  int? id;
  String? name;
  String ?phone;
  String? email;
  String ?image;
  int? points;
  int ?credits;
  String? token;

  userData(
     this.id,
     this.name,
     this.phone,
     this.image,
     this.points,
     this.credits,
     this.token
  );
  //named constructor
  userData.fromjson(Map<String,dynamic> json)
  {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credits = json['credits'];
    token = json['token'];

  }
}