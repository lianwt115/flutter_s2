import 'package:flutter/material.dart';
import '../config.dart';
import 'article_item.dart';
import 'ad_item.dart';
import 'hot_item.dart';
import 'item.dart';

//生成内容和控制用户操作的行为  是有状态的
class TabPage extends StatefulWidget{

  final List<ArticletBean> articleList;
  TabPage({@required this.articleList});

  @override
  State<StatefulWidget> createState() {
    return new _CareTabPageState(articleList:articleList);
  }

}

class _CareTabPageState extends State<TabPage>{

  final List<ArticletBean> articleList;
  _CareTabPageState({@required this.articleList});

  @override
  Widget build(BuildContext context) {

    _articleClick(ArticletClick click){

      String msg;

      switch (click.type) {

        case -1: msg = 'pop取消';break;
        case 0: msg = 'pop屏蔽';break;
        case 1: msg = 'pop取关';break;
        case 2: msg = 'pop举报';break;
        case 3: msg = '条目点击';break;
        case 4:
          msg = '条目删除';
          articleList.remove(click.articletBean);
          setState(() {

          });
          break;

      }

      print('${click.articletBean.user} 广告${click.articletBean.type==2} $msg');
    }

    //item生成内容  移除出去  文章和广告单独item封装
    Widget _buildRow(ArticletBean bean) {

      Widget item;
      switch (bean.type) {

        case 1:item= ArticleItem(articletBean: bean,articleClick:_articleClick);break;
        case 2:item= AdItem(adBean: bean,adClick: _articleClick);break;
        case 3:item= HotItem(hotBean: bean,hotClick: _articleClick);break;
      }

      return item;
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

            // 在每一列之前，添加一个1像素高的分隔线widget  分割线加入到item中

            if(i>=articleList.length) return null;

            return _buildRow(articleList[i]);
          }
      );
    }

    return _buildSuggestions();

  }
}

