import 'package:flutter/material.dart';
import '../config.dart';


class TextContent extends StatelessWidget{

   final List<TextContentBean> articleList;

  TextContent({@required this.articleList});


  @override
  Widget build(BuildContext context) {
    //item生成内容  移除出去  文章和广告单独item封装
    Widget _buildRow(TextContentBean bean) {
      return Text(
        bean.mark,
        style: TextStyle(
            color:GlobalConfig.dark?Colors.white :Colors.black
        ),

      );
    }

    //listview生成
    Widget _buildSuggestions() {
      return new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
          // 在偶数行，该函数会为单词对添加一个ListTile row.
          // 在奇数行，该行书湖添加一个分割线widget，来分隔相邻的词对。
          // 注意，在小屏幕上，分割线看起来可能比较吃力。
          itemBuilder: (context, i) {

            //可以根据bean的类型生成不同的widget

            // 在每一列之前，添加一个1像素高的分隔线widget
            if (i.isOdd) return new Divider(height: 16.0,indent: 2.0,);

            // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
            // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
            final index = i ~/ 2;

            if(index>=articleList.length) return null;

            return _buildRow(articleList[index]);
          }
      );
    }


    return _buildSuggestions();

  }

}

class TextContentBean{
  String headUrl;
  String user;
  String action;
  String time;
  String title;
  String mark;
  String imgUrl;
  int agreeNum;
  int commentNum;

  TextContentBean(this.headUrl, this.user, this.action, this.time, this.title, this.mark, this.agreeNum, this.commentNum, {this.imgUrl});
}