import 'package:flutter/material.dart';
import '../config.dart';
import 'item.dart';


class AdItem extends StatelessWidget{

  final ArticletBean adBean;
  final Function adClick;
  AdItem({@required this.adBean,@required this.adClick});


  @override
  Widget build(BuildContext context) {

    return Container(
        child: FlatButton(
          //有默认的padding
          padding:  EdgeInsets.only(),
          onPressed: (){
            adClick(ArticletClick(3, adBean));
          },
          child: Column(
            //左对齐 垂直方向
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(adBean.headUrl),
                        radius: 13.0,

                      )

                  ),
                  Text(adBean.user,
                      style: TextStyle(color:GlobalConfig.fontColor,fontSize: 16.0 )
                  ),
                ],

              ),

              Container(
                margin: EdgeInsets.only(top: 16.0,bottom: 16.0),
                child:AspectRatio(
                    aspectRatio: 3.0 / 1.0,
                    child:  Container(
                      foregroundDecoration:new BoxDecoration(
                          image:  DecorationImage(
                            image:  NetworkImage(adBean.imgUrl),
                            centerSlice:  Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                          ),
                          borderRadius:  BorderRadius.all( Radius.circular(6.0))
                      ),
                    )
                ) ,
              ),
              //文章内容 和图片  可能无图片
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child:  Text(
                    adBean.mark,
                    style: new TextStyle(fontSize: 14.0 , color: GlobalConfig.fontColor)
                ),
              ),

              Container(
                child: Row(
                  children: <Widget>[
                   Container(
                     margin: EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: GlobalConfig.fontColor),
                          borderRadius: BorderRadius.all(Radius.circular(2.0))
                        ),
                        child: Text(
                            '广告',
                            style: TextStyle(color:GlobalConfig.fontColor,fontSize: 14.0 )

                        ),
                      ),
                    Expanded(
                        child:Text('查看详情',style: TextStyle(color:GlobalConfig.fontColor,fontSize: 16.0 ))
                    )
                    ,
                    IconButton(
                        icon: Icon(Icons.clear,color:GlobalConfig.fontColor),
                        onPressed: (){
                          adClick(ArticletClick(4, adBean));
                        })

                  ],
                ),


              ),
             Divider(height: 16.0,indent: 2.0,)
            ],

          ),
        )
    );

  }

}