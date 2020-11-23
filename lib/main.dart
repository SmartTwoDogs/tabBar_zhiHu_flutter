import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHome();
  }
}

///Flutter 制作带动画效果的 TabBar
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin {
  TabController _tabController;

  TextStyle smlStyle = TextStyle(fontSize: 12);
  TextStyle bigStyle = TextStyle(fontSize: 20);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TabBar Demo",
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("页面1"),
              ),
              Tab(
                child: Text("页面2"),
              ),
              Tab(
                child: Text("页面3"),
              ),
            ],
            controller: _tabController,
            //TabBar指针的宽度
            indicatorWeight: 1,
            //设置指针的内边距使其横向缩短
            indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
            //选中后的style
            labelStyle: bigStyle,
            //未选中的style
            unselectedLabelStyle: smlStyle,
            //选中后的颜色
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          ),
          // leading: Icon(Icons.arrow_back,),
          title: Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "仿知乎APP首页书写",
                  //去掉搜索框默认的线
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  )),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_circle),
              color: Colors.grey[300],
              onPressed: () {},
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
                child: Container(
              child: genContentList(),
            )),
            Center(
                child: Container(
              child: Text(
                "2",
                style: TextStyle(fontSize: 40),
              ),
            )),
            Center(
                child: Container(
              child: Text(
                "3",
                style: TextStyle(fontSize: 40),
              ),
            ))
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class Content {
  String title;

  String subTitle;

  String avatarUrl;

  String userName;

  String userDesc;

  Content() {
    this.title = "在闲鱼上买什么东西比较赚钱？";
    this.subTitle = "这个问题我会！让我来回答！这个问题我会！让我来回答！这个问题我会！让我来回答！这个问题我会！让我来回答！";
    this.avatarUrl =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1605789263727&di=41514512a2e7b0c594d6e1e4fcb45f32&imgtype=0&src=http%3A%2F%2Fww1.sinaimg.cn%2Fmw690%2F5301ff11ly1gb58jwjhikj20p00p0q4l.jpg";
    this.userName = "掘金宝宝_";
    this.userDesc = "像狗哥一样放荡不羁的潇洒生活";
  }
}

genContentList() {
  Content content = Content();

  List<Content> list = List();
  List.generate(10, (index) => list.add(content));
  return ListView.builder(
    padding: EdgeInsets.only(top: 20),
    itemBuilder: (BuildContext context, int dex) {
      return Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(content.title),
              subtitle: Container(
                  padding: EdgeInsets.only(top: 6),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: NetworkImage(content.avatarUrl)),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            content.userName,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(content.userDesc),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        content.subTitle,
                        style: TextStyle(height: 1.2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("520点赞  1314评论"),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                    ],
                  )),
            ),
            Container(height: 10, color: Color(0xFFF0F5F4))
          ],
        ),
      );
    },
    itemCount: list.length,
  );
}
