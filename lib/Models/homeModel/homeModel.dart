class HomeModel
{
  bool? status;
  HomeData? data;
  HomeModel.fromjson(Map<String,dynamic>json)
  {
    status = json['status'];
    data = HomeData.fromjson(json['data']);
  }
}
class HomeData
{
  List<HomeBanners> banners = [];
  List<HomeProducts> products = [];
  HomeData.fromjson(Map<String,dynamic>json)
  {
    try {
      for( var i in json['banners'])
        {
          HomeBanners bann = HomeBanners.fromjson(i);
          banners.add(bann);
        }
      for( var i in json['products'])
      {
        HomeProducts product = HomeProducts.fromjson(i);
        products.add(product);
      }
    }
    catch(error)
    {
      print(error.toString());
    }
  }
}
class HomeBanners
{

  int? id;
  String? image;
  HomeBanners.fromjson(Map<String, dynamic> json)
  {
    id = json['id'];
    image = json['image'];
  }
}
class HomeProducts
{
  int? id;
  dynamic? price;
  dynamic? oldPrice;
  dynamic? discount;
  String? image;
  String? name;
  bool? isFav;
  bool? isCart;
  HomeProducts.fromjson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    isFav = json['in_favorites'];
    isCart = json['in_cart'];

  }

}