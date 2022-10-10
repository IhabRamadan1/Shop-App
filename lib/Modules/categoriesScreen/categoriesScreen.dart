import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Models/categories/categoriesModel.dart';
import 'package:untitled/layouts/cubit/shopCubit.dart';
import 'package:untitled/layouts/cubit/shopstate.dart';

class categoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit,shopStates>
      (
        listener: (context,state){},
        builder: (context,state){
          return ListView.separated(
              itemBuilder: (context,index) => catBuilder(shopCubit.get(context).categoryModel!.data!.data[index]),
              separatorBuilder: (context,index)=> Container(
                width: double.infinity,
                height: 1,
              ),
              itemCount: shopCubit.get(context).categoryModel!.data!.data.length
          );
        },
     );
  }
  Widget catBuilder(DataModell model)=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage("${model.image}"),
        height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 20,),
        Text("${model.name}",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  );
}