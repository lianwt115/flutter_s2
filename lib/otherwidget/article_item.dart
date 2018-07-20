
import 'package:flutter/material.dart';
import '../config.dart';
import 'item.dart';


class ArticleItem extends StatelessWidget{

  final ArticletBean articletBean;
  final Function articleClick;

  ArticleItem({@required this.articletBean,@required this.articleClick});

  @override
  Widget build(BuildContext context) {


    Widget imgWidget(ArticletBean article){
      Widget markWidget;
      if (article.imgUrl == null) {
        markWidget = Text(
            article.mark,
            style:  TextStyle(fontSize: 14.0 , color: GlobalConfig.fontColor)
        );
      } else {
        markWidget =  Row(
          children: <Widget>[
             Expanded(
              flex: 2,
              child:  Container(
                margin: EdgeInsets.only(right: 10.0),
                child:  Text(
                    article.mark,
                    style: new TextStyle(fontSize: 14.0 , color: GlobalConfig.fontColor)
                ),
              ),
            ),
             Expanded(
                flex: 1,
                child:  AspectRatio(
                    aspectRatio: 3.0 / 2.0,
                    child:  Container(
                      foregroundDecoration:new BoxDecoration(
                          image:  DecorationImage(
                            image:  NetworkImage(article.imgUrl),
                            centerSlice:  Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                          ),
                          borderRadius:  BorderRadius.all( Radius.circular(6.0))
                      ),
                    )
                )
            ),
          ],
        );
      }

      return markWidget;
    }


    return Container(
      child: FlatButton(
        //有默认的padding
          padding:  EdgeInsets.only(),
          onPressed: (){
            articleClick(ArticletClick(3,articletBean));
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
                        backgroundImage: NetworkImage(articletBean.headUrl),
                        radius: 13.0,

                      )

                  ),
                  Text(articletBean.user + '  '+articletBean.action+' '+'  ·  ' +' '+articletBean.time,
                      style: TextStyle(color:GlobalConfig.fontColor,fontSize: 16.0 )
                  ),
                ],

              ),
              //文章标题
              Container(
                  margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                  child:Text(articletBean.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:18.0
                    ),
                  )
              ),

              //文章内容 和图片  可能无图片
              Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child:imgWidget(articletBean)
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                          '${articletBean.agreeNum} 赞同  ·  ${articletBean.commentNum}  评论',
                          style: TextStyle(color:GlobalConfig.fontColor,fontSize: 16.0 )

                      ),

                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.linear_scale,color: GlobalConfig.fontColor),
                      itemBuilder: (BuildContext context) => <PopupMenuItem<ArticletClick>>[

                        PopupMenuItem(
                            value: ArticletClick(0,articletBean),
                            child: Text('屏蔽这个问题')
                        ),
                        PopupMenuItem(
                            value: ArticletClick(1,articletBean),
                            child: Text('取消关注   ${articletBean.user}')
                        ),PopupMenuItem(
                            value: ArticletClick(2,articletBean),
                            child: Text('举报')
                        )

                      ],
                      onCanceled: (){
                        articleClick(ArticletClick(-1,articletBean));
                      },
                      onSelected: (value){
                        articleClick(value);
                      },

                    )
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

