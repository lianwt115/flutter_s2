
import 'package:flutter/material.dart';
import '../config.dart';
import 'item.dart';


class HotItem extends StatelessWidget{

  final ArticletBean hotBean;
  final Function hotClick;

  HotItem({@required this.hotBean,@required this.hotClick});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: FlatButton(
        //有默认的padding
          padding:  EdgeInsets.only(),
          onPressed: (){
            hotClick(ArticletClick(3,hotBean));
          },
          child: Column(
            children: <Widget>[
              Row(
                //左对齐 垂直方向
                mainAxisAlignment:  MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16.0,left: 6.0),
                    //child: ,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('0${hotBean.agreeNum}',style: TextStyle(color: (hotBean.agreeNum%2==0)?Colors.red:Colors.amber,fontSize: 18.0)),
                        Row(

                          children: <Widget>[
                            Icon(Icons.arrow_upward,color: Colors.red,size: 12.0,),
                            Text('${hotBean.agreeNum}',style: TextStyle(color: Colors.red,fontSize: 12.0))
                          ],
                        )

                      ],
                    ),

                  ),

                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(hotBean.title,style: TextStyle(color: Colors.white,fontSize: 18.0),softWrap: true),
                          Container(
                              margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                              child:Text(hotBean.mark,style: TextStyle(color: GlobalConfig.fontColor,fontSize: 14.0),softWrap: true)
                          ),
                          Text('${hotBean.commentNum}  万热度',style: TextStyle(color: GlobalConfig.fontColor,fontSize: 16.0))
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                        flex: 1,
                        child:  AspectRatio(
                            //长宽比
                            aspectRatio: 3.0 / 2.0,
                            child:  Container(
                              foregroundDecoration:new BoxDecoration(
                                  image:  DecorationImage(
                                    image:  NetworkImage(hotBean.imgUrl),
                                    centerSlice:  Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                  ),
                                  borderRadius:  BorderRadius.all( Radius.circular(6.0))
                              ),
                            )
                        )
                    ),

                ]

              ),

              Divider(height: 16.0,indent: 2.0,)

            ],

          ),
      )
    );
  }

}

