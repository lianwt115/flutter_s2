import 'package:flutter/material.dart';
import '../otherwidget/search_input.dart';
import '../config.dart';

//无状态组件和状态组件  和react刷新机制是一样的

class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    //搜索输入
    Widget searchinput(){
      return Container(
        child: Row(
          children: <Widget>[
            Container(
              child: FlatButton.icon(
                onPressed: (){
                  //后退
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back,color: GlobalConfig.fontColor,size: 16.0),
                label: Text('',style: TextStyle(color:GlobalConfig.fontColor )),

              ),

            ),
            Expanded(
              //文本输入框
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration.collapsed(
                      hintText: '搜索所需',
                      hintStyle: TextStyle(color: GlobalConfig.fontColor)
                  ),
                  onChanged: (String content){

                    print('onchang:$content');
                  },
                  onSubmitted:(String content){

                    print('onSubmitted:$content');
                  } ,

                )
            )

          ],

        ),

        //装饰,修饰 背景和shape
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: GlobalConfig.searchBackgroundColor

        ),
      );
    }

    //热词
    Widget hotWord(String content){

      return Container(
        margin: EdgeInsets.only(right: 8.0),
        child: FlatButton(
            onPressed: (){
              print(content);
            },
            child: Text(content,style:TextStyle(color: GlobalConfig.fontColor)),

        ),

          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: GlobalConfig.searchBackgroundColor

          )
      );

    }


    //搜索热点
    Widget searchHot (){

      return Container(
        padding: EdgeInsets.all(16.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('碧湖热搜',style: TextStyle(color: Colors.white,fontSize: 20.0),),

            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Row(
                children: <Widget>[
                  hotWord('it行业什么最火'),
                  hotWord('麻花藤为啥有钱'),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Row(
                children: <Widget>[
                  hotWord('百度为何不送外卖了'),
                  hotWord('女性的口红情怀'),

                ],
              ),
            ),

          ],
        ) ,
      );

    }

    //历史像条目的东西可以惨遭tabpage那样携程list
    Widget hisItem(String text){

      return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.access_time,color: GlobalConfig.fontColor,size: 16.0,),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16.0),
                      child:  Text(text,style: TextStyle(color: GlobalConfig.fontColor,fontSize: 16.0),),
                    )
                ),
                Icon(Icons.clear,color: GlobalConfig.fontColor,size: 16.0,),
              ],
            ),
            Divider(height: 16.0,indent: 2.0,)
          ]
          ,
        )
      );

    }



    //搜索历史
  Widget searchHis(){

    return Container(
      padding: EdgeInsets.all(16.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('搜索历史',style: TextStyle(color: Colors.white,fontSize: 20.0),),
          hisItem('世界杯冠军'),
          hisItem('如何与傻逼共处'),
          hisItem('演员的自我修养'),
        ],
      ) ,
    );
  }

    return MaterialApp(
      theme: GlobalConfig.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: searchinput(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            searchHot (),
            searchHis()
          ],
        )
        ),

    );
    
    
  }
  
}