class ArticletBean{
  String headUrl;
  String user;
  String action;
  String time;
  String title;
  String mark;
  String imgUrl;
  int agreeNum;
  int commentNum;
  //1 文章 2 广告
  int type;

  ArticletBean(this.headUrl, this.user, this.action, this.time, this.title, this.mark, this.agreeNum, this.commentNum,this.type, {this.imgUrl});
}

class ArticletClick{
  //-1 取消 0 屏蔽 1 取关 2 举报 3 条目点击 4 删除
  int type;
  ArticletBean articletBean;

  ArticletClick(this.type, this.articletBean);
}