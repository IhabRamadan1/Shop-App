import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/Modules/Login/LoginScreen.dart';
import 'package:untitled/Network/Remote/sharedPref.dart';
class boardModel
{
  final String title;
  final String body;
  final String image;

  boardModel(this.title, this.body, this.image);

}
class onboardingScreen extends StatefulWidget {
  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
 List<boardModel> boardList =[
   boardModel("On Board 1 Title", "On Board 1 Body", "assets/images/onboard_1.jpg"),
   boardModel("On Board 2 Title", "On Board 2 Body", "assets/images/onboard_1.jpg"),
   boardModel("On Board 3 Title", "On Board 3 Body", "assets/images/onboard_1.jpg"),
 ];

 bool isLast = false;

 var pageControl= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: ()
              {
                cachHelper.saveData(key: "onBoard", value: true).then((value) {
                  if(value)
                    {
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context)=>LoginScreen())
                          , (route) => false
                      );
                    }
                  print("hellllll $value");
                });
              },
              child: Text("SKIP")),
        ],
      ),
      body: PageView.builder(
        onPageChanged: (int index)
        {
          if(index == boardList.length-1)
            {
              setState((){
                isLast=true;
              });
            }
          else
          {
            setState((){
              isLast=false;
            });          }
        },
        controller: pageControl,
        physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=> boardBuild(boardList[index],context),
          itemCount: boardList.length,
      ),
    );
  }

  Widget boardBuild(boardModel mode,context)
  {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Expanded(
  child: Image(
  image: AssetImage('${mode.image}'),
  ),
  ),
      // SizedBox(height: 15,),
      Text(
      "${mode.title} ",
      style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      ),
      ),
      SizedBox(height: 15,),
      Text("${mode.body}"),
      SizedBox(height: 70,),
      Row(
        children: [
          SmoothPageIndicator(
              controller: pageControl,
              count: boardList.length,
            effect: ExpandingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: Colors.blue,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 5,
              expansionFactor: 4,
            ),
          ),
          Spacer(),
          FloatingActionButton(
              onPressed: (){
                if(isLast)
                  {
                  cachHelper.saveData(key: "onBoard", value: true).then((value) {
                    if(value)
                      {
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (context)=>LoginScreen())
                            , (route) => false
                        );};
                      });
                  }
                else
                  {
                    pageControl.nextPage(
                      duration: Duration(
                        milliseconds: 700,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
              },
               child: Icon(
                 Icons.arrow_forward_ios,
               ),
          )
        ],
      ),
      SizedBox(height: 30,),
      ],
      ),
    ) ;
  }
}