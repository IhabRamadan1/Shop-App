import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Models/favModel/getFavModel.dart';
import 'package:untitled/layouts/cubit/shopCubit.dart';
import 'package:untitled/layouts/cubit/shopstate.dart';
class favScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<shopCubit,shopStates>(
      listener: (context,state){},
      builder: (context,state){
        return  ConditionalBuilder(
          condition: state is! loadingFavScreen,
          builder: (context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=> buildFav(shopCubit.get(context).getFav!.data!.data![index],context),
              separatorBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(color:Colors.grey,height: 1, width: double.infinity,),
              ),
              itemCount: shopCubit.get(context).getFav!.data!.data!.length),
          fallback:(context)=> Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
  Widget buildFav(DataM model, context)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Container(
            height: 120,
            width: 120,
            child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children:
                [
                  Image(image: NetworkImage("${model.product!.image}"),
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  if(model.product!.discount!=0)
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
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${model.product!.name}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text("${model.product!.price}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 10,),
                    if(model.product!.oldPrice!=0)
                      Text("${model.product!.oldPrice}",
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                        ),
                      ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: (shopCubit.get(context).fav[model.product!.id]!)? Colors.blue : Colors.grey,
                      radius: 15,
                      child: Center(
                        child: IconButton(
                          onPressed: (){
                            shopCubit.get(context).changeFav(model.product!.id!);
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
    ),
  );
}