 //import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Models/categories/categoriesModel.dart';
import 'package:untitled/Models/homeModel/homeModel.dart';
import 'package:untitled/layouts/cubit/shopCubit.dart';
import 'package:untitled/layouts/cubit/shopstate.dart';

class homeScreen extends StatelessWidget {

   @override
   Widget build(BuildContext context) {

     return BlocConsumer<shopCubit,shopStates>
       (
          listener: (context,state){},
        builder: (context,state)
        {
         return ConditionalBuilder(
             condition: shopCubit.get(context).homeModel!=null && shopCubit.get(context).categoryModel!=null,
             builder: (context)=>buildHome(shopCubit.get(context).homeModel,shopCubit.get(context).categoryModel, context ),
             fallback:(context)=> Center(child: CircularProgressIndicator(),),
         );
        },
       );
   }
   Widget buildHome(HomeModel? model, CategoriesModel? mod, context)=>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                   options: CarouselOptions(
                     viewportFraction: 1,
                     initialPage: 0,
                     enableInfiniteScroll: true,
                     reverse: false,
                     autoPlay: true,
                     autoPlayInterval: Duration(seconds: 3),
                     autoPlayAnimationDuration: Duration(seconds: 1),
                     autoPlayCurve: Curves.fastOutSlowIn,
                     scrollDirection: Axis.horizontal,
                     height: 250,
                   ),
                   items: model!.data!.banners.map((e)=>
                       Image(
                       image: NetworkImage('${e.image}'),width: double.infinity,fit: BoxFit.cover,
                       )

                     ,).toList(),

     ),
                  SizedBox(height: 10,),
                  Text("Categories",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 24,
                     fontWeight: FontWeight.w400
                   ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=> categoryBuilder(mod!.data!.data[index]),
                        separatorBuilder: (context,index )=>SizedBox(width: 10,),
                        itemCount: mod!.data!.data.length,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("New Products",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 10,),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 1/1.7,
                    children: List.generate(model.data!.products.length,
                            (index) =>  BuildProduct(model.data!.products[index],context
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
   Widget BuildProduct(HomeProducts product, context)=>
       Container(
         color: Colors.white,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
         Center(
           child: Stack(
             alignment: AlignmentDirectional.bottomStart,
             children:
               [
                 Image(image: NetworkImage("${product.image}"),
                   height: 200,
                 ),
                 if(product.discount!=0)
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 5),
                   color: Colors.red,
                   child: Text("DISCOUNT",
                   style: TextStyle(
                     color: Colors.white
                   ),
                   ),
                 )
               ]
           ),
         ),
         SizedBox(height: 5,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("${product.name}",
                 overflow: TextOverflow.ellipsis,
                 maxLines: 2,
                 style: TextStyle(
                   fontSize: 14,
                   height: 1.3,
                 ),
               ),
               SizedBox(height: 3,),
               Row(
                 children: [
                   Text("${product.price.round()}",
                   style: TextStyle(
                     fontSize: 12,
                     color: Colors.blue,
                   ),
                   ),
                   SizedBox(width: 10,),
                   if(product.discount!=0)
                     Text("${product.oldPrice.round()}",
                     style: TextStyle(
                       color: Colors.grey,
                       decoration: TextDecoration.lineThrough,
                       fontSize: 12,
                     ),
                   ),
                   Spacer(),
                   CircleAvatar(
                     backgroundColor: (shopCubit.get(context).fav[product.id]!)? Colors.blue : Colors.grey,
                     radius: 15,
                     child: Center(
                       child: IconButton(
                           onPressed: (){
                           shopCubit.get(context).changeFav(product.id!);
                           },
                           icon: Icon(Icons.favorite_border, size: 14, color: Colors.white,),

                       ),
                     ),
                   ),
                 ],
               ),
             ],
           ),
         ),
     ],
   ),
       );

   Widget categoryBuilder( DataModell data) =>
       Stack(
         alignment: AlignmentDirectional.bottomCenter,
       children: [
           Image(
               image: NetworkImage('${data.image}'),
               height: 100,
             width: 100,
             fit: BoxFit.cover,
           ),
           Container(
           color: Colors.black26,
           child: Text("${data.name}",
           maxLines: 1,
           overflow: TextOverflow.ellipsis,
           textAlign: TextAlign.center,
           style: TextStyle(
             color: Colors.white,
           ),
           ),
         ),
         ],
       ) ;
 }
