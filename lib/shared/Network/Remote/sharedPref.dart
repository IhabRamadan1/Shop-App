
import 'package:shared_preferences/shared_preferences.dart';

class cachHelper
{
   static SharedPreferences? sharepref;
   static init() async
   {
      sharepref = await SharedPreferences.getInstance();
   }
   static  Future<bool> saveData({
   required String key,
      required dynamic value,
}) async
   {
      if(value is String){ return await sharepref!.setString(key, value);};
      if(value is bool){ return await sharepref!.setBool(key, value);};
      if(value is int){ return await sharepref!.setInt(key, value);};
      return await sharepref!.setDouble(key, value);
   }

   static dynamic gatDa({
   required String key,
})
   {
      return sharepref!.get(key);
   }

   static Future<bool> RemoveData({required String key})async
   {
      return await sharepref!.remove(key);
   }
}