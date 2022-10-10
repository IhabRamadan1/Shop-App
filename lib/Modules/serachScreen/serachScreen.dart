import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Models/SearchModel/SearchModel.dart';
import 'package:untitled/Modules/serachScreen/cubit/searchState.dart';
import 'package:untitled/Modules/serachScreen/cubit/serrchCubit.dart';
import 'package:untitled/layouts/cubit/shopCubit.dart';

class searchScreen extends StatelessWidget {
var searchC =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> SearchCubit(),
      child: BlocConsumer<SearchCubit,serachState>(
        listener:(context,state){} ,
        builder: (context,state){
          return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchC,
                  decoration: InputDecoration(
                    labelText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value)
                  {
                    SearchCubit.get(context).getSearch(value);
                  },
                ),
                if(state is successS)
                Expanded(
                  child: ConditionalBuilder(
                  condition: state is! loadingS,
                  builder: (context)=> ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=> buildSearch(SearchCubit.get(context).search!.data!.data![index] ,context),
                      separatorBuilder: (context,index)=>Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(color:Colors.grey,height: 1, width: double.infinity,),
                      ),
                      itemCount: SearchCubit.get(context).search!.data!.data!.length),
                  fallback:(context)=> Center(child: LinearProgressIndicator(),),),
                ),
              ],
            ),
          ),

          );
        },
      ),
    );
  }
  Widget buildSearch(Productt prod, context)=> Padding(
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
                  Image(image: NetworkImage("${prod.image}"),
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  if(prod.discount!=0)
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
                Text("${prod.name}",
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
                    Text("${prod.price}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: (shopCubit.get(context).fav[prod.id]!)? Colors.blue : Colors.grey,
                      radius: 15,
                      child: Center(
                        child: IconButton(
                          onPressed: (){
                            shopCubit.get(context).changeFav(prod.id!);
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
