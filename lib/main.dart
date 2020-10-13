import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '计算器',
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new Container(
          padding: EdgeInsets.only(top: 10.0, left: 10.0),
          color: Colors.black,
          child: new ContentBody(),
          ),
        ),
    );
  }
}

class ContentBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ContentBodyState();

}

class ContentBodyState extends State<ContentBody>{
  String sums = '0';
  String total = '0';
  String flag = '';
  bool isDouble = false;
  int tag = 0;
  List list = [
    {'bgc': '0xFFFF9800', 'color': '0xFFFFFFFFF'},
    {'bgc': '0xFFFF9800', 'color': '0xFFFFFFFFF'},
    {'bgc': '0xFFFF9800', 'color': '0xFFFFFFFFF'},
    {'bgc': '0xFFFF9800', 'color': '0xFFFFFFFFF'},
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Column(
      children: [
        new Container(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 20.0,bottom: 10.0),
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(440),
          alignment: Alignment.bottomRight,
          child: new Text(sums, style: new TextStyle(
            fontSize: 46,
            color: Colors.white
            )
          ),
        ),
        new Container(
          padding: EdgeInsets.only(top: 10.0),
          width: ScreenUtil().setWidth(750),
          child: Column(
            children: [
              new Center(
                child: new Row(
                  children: [
                    Expanded(
                      child: new Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(45)),
                          color: Colors.grey,
                          splashColor: Colors.grey,
                          onPressed: (){btnclick('重置');},
                          child: new Text('AC', style: new TextStyle(color: Colors.black, fontSize: 20)),
                          shape: new CircleBorder(side: BorderSide(color: Colors.grey)),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child:  new Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(45)),
                          color: Colors.grey,
                          splashColor: Colors.grey,
                          onPressed: (){btnclick('加/减');},
                          child: new Text('+/-', style: new TextStyle(color: Colors.black, fontSize: 20)),
                          shape: new CircleBorder(side: BorderSide(color: Colors.grey)),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child:  new Container(
                        child: new RaisedButton(
                            padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
                            color: Colors.grey,
                            splashColor: Colors.grey,
                            onPressed: (){btnclick('百分号');},
                            child: new Text('%', style: new TextStyle(color: Colors.black, fontSize: 25)),
                            shape: new CircleBorder(side: BorderSide(color: Colors.grey)),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child:  new Container(
                        child: RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(34)),
                          color: new Color(int.parse(list[0]['bgc'])),
                          splashColor: new Color(int.parse(list[0]['bgc'])),
                          onPressed: (){btnclick('除');},
                          child: new Text('÷', style: new TextStyle(color: new Color(int.parse(list[0]['color'])), fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(int.parse(list[0]['bgc'])))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.all(5.0),
              ),
              new Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                          color: new Color(0xFF3B3B3B),
                          splashColor: new Color(0xFF3B3B3B),
                          onPressed: (){numClick('7');},
                          child: new Text('7', style: new TextStyle(color: Colors.white, fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: new  Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                          color: new Color(0xFF3B3B3B),
                          splashColor: new Color(0xFF3B3B3B),
                          onPressed: (){numClick('8');},
                          child: new Text('8', style: new TextStyle(color: Colors.white, fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: new  Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                          color: new Color(0xFF3B3B3B),
                          splashColor: new Color(0xFF3B3B3B),
                          onPressed: (){numClick('9');},
                          child: new Text('9', style: new TextStyle(color: Colors.white, fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: new Container(
                        child: RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(34)),
                          color: new Color(int.parse(list[1]['bgc'])),
                          splashColor: new Color(int.parse(list[1]['bgc'])),
                          onPressed: (){btnclick('乘');},
                          child: new Text('×', style: new TextStyle(color: new Color(int.parse(list[1]['color'])), fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(int.parse(list[1]['bgc'])))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.all(5.0),
              ),
              new Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                          color: new Color(0xFF3B3B3B),
                          splashColor: new Color(0xFF3B3B3B),
                          onPressed: (){numClick('4');},
                          child: new Text('4', style: new TextStyle(color: Colors.white, fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                          color: new Color(0xFF3B3B3B),
                          splashColor: new Color(0xFF3B3B3B),
                          onPressed: (){numClick('5');},
                          child: new Text('5', style: new TextStyle(color: Colors.white, fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child:  new Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                          color: new Color(0xFF3B3B3B),
                          splashColor: new Color(0xFF3B3B3B),
                          onPressed: (){numClick('6');},
                          child: new Text('6', style: new TextStyle(color: Colors.white, fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child:  new Container(
                        child: RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(34)),
                          color: new Color(int.parse(list[2]['bgc'])),
                          splashColor: new Color(int.parse(list[2]['bgc'])),
                          onPressed: (){btnclick('减');},
                          child: new Text('—', style: new TextStyle(color: new Color(int.parse(list[2]['color'])), fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(int.parse(list[2]['bgc'])))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.all(5.0),
              ),
              new Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child:  new Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                          color: new Color(0xFF3B3B3B),
                          splashColor: new Color(0xFF3B3B3B),
                          onPressed: (){numClick('1');},
                          child: new Text('1', style: new TextStyle(color: Colors.white, fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child:  new Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                          color: new Color(0xFF3B3B3B),
                          splashColor: new Color(0xFF3B3B3B),
                          onPressed: (){numClick('2');},
                          child: new Text('2', style: new TextStyle(color: Colors.white, fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child:  new Container(
                        child: new RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                          color: new Color(0xFF3B3B3B),
                          splashColor: new Color(0xFF3B3B3B),
                          onPressed: (){numClick('3');},
                          child: new Text('3', style: new TextStyle(color: Colors.white, fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child:  new Container(
                        child: RaisedButton(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(34)),
                          color: new Color(int.parse(list[3]['bgc'])),
                          splashColor: new Color(int.parse(list[3]['bgc'])),
                          onPressed: (){btnclick('加');},
                          child: new Text('+', style: new TextStyle(color: new Color(int.parse(list[3]['color'])), fontSize: 30)),
                          shape: new CircleBorder(side: BorderSide(color: new Color(int.parse(list[3]['bgc'])))),
                        ),
                        alignment: Alignment.center,
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.all(5.0),
              ),
              new Center(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    new Container(
                      child: new RaisedButton(
                        padding: EdgeInsets.only(left: 70.0, top: 20.0, bottom: 20.0, right: 76.0),
                        color: new Color(0xFF3B3B3B),
                        splashColor: new Color(0xFF3B3B3B),
                        onPressed: (){numClick('0');},
                        child: new Text('0', style: new TextStyle(color: Colors.white, fontSize: 30)),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        ),
                      ),
                      margin: EdgeInsets.only(left: 10.0),
                      alignment: Alignment.center,
                    ),
                    new Container(
                      child: new RaisedButton(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(36)),
                        color: new Color(0xFF3B3B3B),
                        splashColor: new Color(0xFF3B3B3B),
                        onPressed: (){numClick('.');},
                        child: new Text('.', style: new TextStyle(color: Colors.white, fontSize: 30)),
                        shape: new CircleBorder(side: BorderSide(color: new Color(0xFF3B3B3B))),
                      ),
                      alignment: Alignment.center,
                    ),
                    new Container(
                      child: RaisedButton(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(34)),
                        color: Colors.orange,
                        splashColor: Colors.orange,
                        onPressed: (){btnclick('等于');},
                        child: new Text('=', style: new TextStyle(color: Colors.white, fontSize: 30)),
                        shape: new CircleBorder(side: BorderSide(color: Colors.orange)),
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ],
          ),

        )
      ],
    );
  }
  numClick(e){
    print(sums);
    if(e == '.'){
      setState(() {
        isDouble = true;
      });
    }
    if(sums == '0'){
      setState(() {
        sums = e;
      });
    }else{
      if(flag != ''){
        if(tag  ==  0 ){
          if(sums.length < 14){
            setState(() {
              sums += e;
            });
          }
        }else{
          setState(() {
            sums = e;
            tag = 0;
          });
        }
      }else{
        if(sums.length < 14){
          setState(() {
            sums += e;
          });
        }
      }
    }
  }
//  计算点击
  btnclick(e){
    list.forEach((element) {
        element['color'] = '0xFFFFFFFFF';
        element['bgc'] = '0xFFFF9800';
    });
    switch(e){
      case '重置': setState(() {
        sums = '0';
      });break;
      case '加': setState(() {
        total = sums;
        tag = 1;
        flag = '加';
        list[3]['bgc'] = '0xFFFFFFFFF';
        list[3]['color'] = '0xFFFF9800';
      });break;
      case '减': setState(() {
        total = sums;
        tag = 1;
        flag = '减';
        list[2]['bgc'] = '0xFFFFFFFFF';
        list[2]['color'] = '0xFFFF9800';
      });break;
      case '乘': setState(() {
        total = sums;
        tag = 1;
        flag = '乘';
        list[1]['bgc'] = '0xFFFFFFFFF';
        list[1]['color'] = '0xFFFF9800';
      });break;
      case '除': setState(() {
        total = sums;
        tag = 1;
        flag = '除';
        list[0]['bgc'] = '0xFFFFFFFFF';
        list[0]['color'] = '0xFFFF9800';
      });break;
      case '百分号': setState(() {
        total = sums;
        tag = 1;
        flag = '百分号';
        sums = (int.parse(sums) / 100).toString();
      });break;
      case '等于':
        sumClac();
        clacVlaue();
    }
  }
// 计算函数
  sumClac(){
    if(flag == '加'){
      if(isDouble){
        double c = double.parse(total) + double.parse(sums);
        setState(() {
          sums = c.toString();
        });
      }else{
        int c = int.parse(total) + int.parse(sums);
        setState(() {
          sums = c.toString();
        });
      }
      setState(() {
        total = '';
        isDouble = false;
        flag = '';
      });
    }else if (flag == '减'){
      if(isDouble){
        double c = double.parse(total) - double.parse(sums);
        setState(() {
          sums = c.toString();
        });
      }else{
        int c = int.parse(total) - int.parse(sums);
        setState(() {
          sums = c.toString();
        });
      }
      setState(() {
        total = '';
        flag = '';
        isDouble = false;
      });
    }else if (flag == '乘'){
      if(isDouble){
        double c = double.parse(total) * double.parse(sums);
        setState(() {
          sums = c.toString();
        });
      }else{
        int c = int.parse(total) * int.parse(sums);
        setState(() {
          sums = c.toString();
        });
      }
      setState(() {
        total = '';
        flag = '';
        isDouble = false;
      });
    }else if (flag == '除'){
      if(isDouble){
        double c = double.parse(total) * double.parse(sums);
        setState(() {
          sums = c.toString();
        });
      }else{
        double c = int.parse(total) / int.parse(sums);
        if(int.parse(total) % int.parse(sums) == 0){
          setState(() {
            sums = c.toInt().toString();
          });
        }else{
          setState(() {
            sums = c.toString();
          });
        }
      }
      setState(() {
        total = '';
        flag = '';
        isDouble = false;
      });
    }
  }
//  判断计算值
  clacVlaue(){
    if(sums.length >14){
      setState(() {
        sums = sums.substring(0, 14);
      });
    }
  }
}