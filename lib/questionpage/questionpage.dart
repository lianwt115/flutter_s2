import 'package:flutter/material.dart';
import '../config.dart';


//可以改造成有状态的组件根据步骤来渲染不同的组件

class QuestionPage extends StatelessWidget{



  @override
  Widget build(BuildContext context) {


    Widget questionBar(){

      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: (){
                  //后退
                  Navigator.of(context).pop();
                }),
            Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 16.0),
                  child: Text('提问'),
                )
            ),
            FlatButton(
                onPressed: (){
                  print('下一步');
                }, 
                child: Text('下一步',style: TextStyle(color: GlobalConfig.fontColor,fontSize: 16.0),))
          ],
        ),
      );
    }

    Widget questionContent(){
      //

      return Container(
        padding: EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              //不自动获取焦点
                decoration: InputDecoration.collapsed(
                    hintText: '请输入标题',
                    hintStyle: TextStyle(color: Colors.white)
                ),
                onChanged: (String content){

                  print('onchang:$content');
                },
                onSubmitted:(String content){

                  print('onSubmitted:$content');
                },

            ),
            Divider(height: 16.0,indent: 2.0,)
          ],
        ),


      );


    }


    return MaterialApp(
      theme: GlobalConfig.themeData,
      home: Scaffold(
        appBar:AppBar(
          title: questionBar(),
        ) ,
        body: questionContent(),
      ),
    );
  }

}