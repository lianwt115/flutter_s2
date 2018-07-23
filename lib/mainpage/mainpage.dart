import 'package:flutter/material.dart';
import '../otherwidget/search_bar.dart';
import '../config.dart';
import '../otherwidget/care_tab.dart';
import '../otherwidget/item.dart';
import '../searchpage/searchpage.dart';
import '../questionpage/questionpage.dart';
class MainPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }

}

class _MainPageState extends State<MainPage>{

  int _count;
  String _leftContent ;
  String _rightContent ;
  List<ArticletBean> articleListCare;
  List<ArticletBean> articleListPush;
  List<ArticletBean> articleListHot;

  @override
  Widget build(BuildContext context) {

    //search的点击行为
    _searchbarClick(bool left){
      print('_searchbarleftclick:$left');

      switch(left){

      //左边点击进入searchpage
        case true:
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) {
                return new SearchPage();
              }
          ));

          break;
      //进入questionpage
        case false:
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) {
                //可以给Widget传递参数
                return new QuestionPage();
              }
          ));
          break;

      }
    }



    return DefaultTabController(
      //长度
      length: 3,
      //初始位置
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: SearchBar(leftContent: _leftContent,rightContent: _rightContent,click: _searchbarClick),
          bottom: TabBar(
              tabs: [
                Tab(text: '关注'),
                Tab(text: '推荐'),
                Tab(text: '热榜'),
              ],
            labelColor:  Colors.blue,
            unselectedLabelColor: GlobalConfig.dark ? Colors.white : Colors.black,
            indicatorColor:  Colors.blue,
            indicatorPadding: EdgeInsets.only(left: 30.0,right: 30.0),
            indicatorWeight: 2.0,
          ),
        ),
        body: TabBarView(

            children: [
              Center(
                child:TabPage(articleList: articleListCare)
              ),
              Center(
                child: TabPage(articleList: articleListPush)
              ),
              Center(
                child: TabPage(articleList: articleListHot),
              ),

            ]
        ),
      ),
    )
     ;
  }

  @override
  void initState() {
    super.initState();
    _leftContent = '男人为什么不结婚';
    _rightContent = '提问';
    _count=0;
    articleListCare = [
      new ArticletBean(
          "https://pic3.zhimg.com/50/2b8be8010409012e7cdd764e1befc4d1_s.jpg",
          "learner",
          "赞同了回答",
          "2小时前",
          "在三体中，罗辑为什么会把控制权交给程心，难道他没有推测过后果吗？",
          "因为罗辑遵守了人类伦理。这个伦理大概就叫民主。 大刘其实是个典型的精英主义者，在他笔下...",
          32, 10,1,
          imgUrl: "https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg"
      ),
      new ArticletBean(
        "https://pic4.zhimg.com/50/v2-9a3cb5d5ee4339b8cf4470ece18d404f_s.jpg",
        "learner",
        "回答了问题",
        "5小时前",
        "我的手机系统是安卓。无意间发现自己的屏幕被人监控，请问怎样才能彻底摆脱被监控的处境呢？",
        "检查一下你手机里是不是被人装了什么软件，把你不认识的非系统软件删掉。不会删就去找手机店里的小哥，为什么这么多人...",
        38, 13,1,
      ),
      new ArticletBean(
        "https://pic1.zhimg.com/50/v2-0c9de2012cc4c5e8b01657d96da35534_s.jpg",
        "计算机培训",
        "回答了问题",
        "5小时前",
        "考过CPA，非名牌大学也能进名企",
        "还在羡慕别人的好工作？免费领取价值1980元的注册会计师课程，为自己充电！",
        38, 13,2,
          imgUrl: "https://pic2.zhimg.com/50/v2-6416ef6d3181117a0177275286fac8f3_hd.jpg"
      ),
      new ArticletBean(
          "https://pic3.zhimg.com/50/v2-8943c20cecab028e19644cccf0f3a38b_s.jpg",
          "learner",
          "回答了问题",
          "7小时前",
          "如何评价2018年安徽省程序设计竞赛？",
          "带着政治任务和压力去打了比赛，所幸最后被高中生抬了一手。榜可以见另外某回答。大概经历就是前...",
          38, 13,1,
          imgUrl: "https://pic4.zhimg.com/v2-a7493d69f0d8f849c6345f8f693454f3_200x112.jpg"
      ),
      new ArticletBean(
          "https://pic3.zhimg.com/50/v2-8943c20cecab028e19644cccf0f3a38b_s.jpg",
          "learner",
          "回答了问题",
          "7小时前",
          "极致的文明是什么样的？会真的像黑暗森林法则一样对其他低等生物进行屠杀吗？",
          "最喜欢的人物是章北海和维德但最喜欢的情节却是这一段，地球上的人承诺给他们鲜花和荣誉...",
          38, 13,2,
          imgUrl: "https://pic3.zhimg.com/v2-b67be50be51e2e6d6112a64528683b09_b.jpg"
      )
    ];
    articleListPush = [
      new ArticletBean(
        "https://pic1.zhimg.com/50/v2-0c9de2012cc4c5e8b01657d96da35534_s.jpg",
        "计算机培训",
        "回答了问题",
        "5小时前",
        "考过CPA，非名牌大学也能进名企",
        "还在羡慕别人的好工作？免费领取价值1980元的注册会计师课程，为自己充电！",
        38, 13,2,
          imgUrl: "https://pic2.zhimg.com/50/v2-6416ef6d3181117a0177275286fac8f3_hd.jpg"
      ),
      new ArticletBean(
          "https://pic3.zhimg.com/50/2b8be8010409012e7cdd764e1befc4d1_s.jpg",
          "learner",
          "赞同了回答",
          "2小时前",
          "在三体中，罗辑为什么会把控制权交给程心，难道他没有推测过后果吗？",
          "因为罗辑遵守了人类伦理。这个伦理大概就叫民主。 大刘其实是个典型的精英主义者，在他笔下...",
          32, 10,1,
          imgUrl: "https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg"
      ),
      new ArticletBean(
        "https://pic4.zhimg.com/50/v2-9a3cb5d5ee4339b8cf4470ece18d404f_s.jpg",
        "learner",
        "回答了问题",
        "5小时前",
        "我的手机系统是安卓。无意间发现自己的屏幕被人监控，请问怎样才能彻底摆脱被监控的处境呢？",
        "检查一下你手机里是不是被人装了什么软件，把你不认识的非系统软件删掉。不会删就去找手机店里的小哥，为什么这么多人...",
        38, 13,1,
      ),
      new ArticletBean(
          "https://pic3.zhimg.com/50/v2-8943c20cecab028e19644cccf0f3a38b_s.jpg",
          "learner",
          "回答了问题",
          "7小时前",
          "极致的文明是什么样的？会真的像黑暗森林法则一样对其他低等生物进行屠杀吗？",
          "最喜欢的人物是章北海和维德但最喜欢的情节却是这一段，地球上的人承诺给他们鲜花和荣誉...",
          38, 13,2,
          imgUrl: "https://pic3.zhimg.com/v2-b67be50be51e2e6d6112a64528683b09_b.jpg"
      )
    ];
    articleListHot = [
      new ArticletBean(
        "https://pic1.zhimg.com/50/v2-0c9de2012cc4c5e8b01657d96da35534_s.jpg",
        "计算机培训",
        "回答了问题",
        "5小时前",
        "为自己充电,非名牌大学也能进名企",
        "免费领取价值1980元的注册会计师课程，为自己充电！",
        1, 9999,3,
          imgUrl: "https://pic2.zhimg.com/50/v2-6416ef6d3181117a0177275286fac8f3_hd.jpg"
      ),
      new ArticletBean(
          "https://pic3.zhimg.com/50/2b8be8010409012e7cdd764e1befc4d1_s.jpg",
          "learner",
          "赞同了回答",
          "2小时前",
          "难道他没有推测过后果吗？",
          "因为罗辑遵守了人类伦理。这个伦理大概就叫民主...",
          2, 1000,3,
          imgUrl: "https://pic2.zhimg.com/50/v2-710b7a6fea12a7203945b666790b7181_hd.jpg"
      ),

      new ArticletBean(
          "https://pic3.zhimg.com/50/v2-8943c20cecab028e19644cccf0f3a38b_s.jpg",
          "learner",
          "回答了问题",
          "7小时前",
          "极致的文明是什么样的？",
          "最喜欢的人物是章北海和维德但最喜欢的情节却是这一段...",
          3, 1300,3,
          imgUrl: "https://pic3.zhimg.com/v2-b67be50be51e2e6d6112a64528683b09_b.jpg"
      ) ,
      new ArticletBean(
          "https://pic3.zhimg.com/50/v2-8943c20cecab028e19644cccf0f3a38b_s.jpg",
          "learner",
          "回答了问题",
          "7小时前",
          "极致的文明是什么样的？",
          "最喜欢的人物是章北海和维德但最喜欢的情节却是这一段...",
          4, 8989,3,
          imgUrl: "https://pic3.zhimg.com/v2-b67be50be51e2e6d6112a64528683b09_b.jpg"
      )
    ];

  }



}