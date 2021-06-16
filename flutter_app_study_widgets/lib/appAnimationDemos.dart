import 'package:flutter/material.dart';
import 'package:flutter_app_study_widgets/appAnimationDemos_Hero.dart';
import 'package:get/get.dart';

class AppAnimationDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              if (index == 0) {
                return IconButton(
                    onPressed: () {
                      Get.to(() => SampleAnimation());
                    },
                    icon: Text("简单的高度变化动画"));
              } else if (index == 1) {
                return IconButton(
                    onPressed: () {
                      Get.to(() => AppAnimatedWdg());
                    },
                    icon: Text("AnimatedWidget动画"));
              } else if (index == 2) {
                return IconButton(
                    onPressed: () {
                      Get.to(() => ControllerMoreTween());
                    },
                    icon: Text("一个animationController使用多个Tween(动画组)"));
              } else if (index == 3) {
                return IconButton(
                    onPressed: () {
                      Get.to(() => HeroAnimationDemo());
                    },
                    icon: Text("Hero动画"));
              }
              return Text("");
            },
            itemCount: 4));
  }
}

class SampleAnimation extends StatefulWidget {
  const SampleAnimation({Key? key}) : super(key: key);

  @override
  _SampleAnimationState createState() => _SampleAnimationState();
}

class _SampleAnimationState extends State<SampleAnimation>
    //多个动画
    with
        TickerProviderStateMixin {
//  单个动画
//     with
//         SingleTickerProviderStateMixin {
  //编写一个动画的流程
  //创建一个动画值变化的范围
  //创建一个控制动画变化速率的controller
  //绑定controller和动画值变化范围
  //执行动画
  //原理就是按照一定速率对一个值进行有规律的变化 这个值用于布局某个控件 值不断变化 然后不断刷新UI

  //生成动画的变化的值 <double>表示生成double类型的值 Animation<Color>表示颜色的色值变化 Animation<Size>表示大小的变化
  //不同类型值可用于实现相应的动画效果
  late Animation<double> _animation;
  late Animation<double> _animation2;

  //AnimationController是一个特殊的Animation对象，
  // 在屏幕刷新的每一帧，就会生成一个新的值。理想状态下是1s 60帧 也就是说每1s会有60个值 触发监听然后刷新UI
  // 默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字,简单来说就是用来控制Animation值变化的速率
  late AnimationController _animationController;
  late AnimationController _animationController2;

  initState() {
    super.initState();

    //声明值变化的范围
    Tween<double> tween = Tween<double>(begin: 0.0, end: 100.0);
    Tween<double> tween2 = Tween<double>(begin: 0.0, end: 100.0);

    //创建一个动画控制器
    //duration 动画的执行时间
    //lowerBound 起始比率 upperBound 结束比率 默认情况下controller的速率是匀速
    //vsync vsync对象会绑定动画的定时器到一个可视的widget，
    // 所以当widget不显示时，动画定时器将会暂停，
    // 当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。
    // 如果要使用自定义的State对象作为vsync时，请包含TickerProviderStateMixin
    _animationController = new AnimationController(
        duration: Duration(milliseconds: 2500),
        lowerBound: 0,
        upperBound: 1,
        vsync: this);
    print("_animationController hashcode = ${_animationController.hashCode}");

    //速率变化的加速度 匀速 淡入淡出 ....
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    print("_animation hashcode = ${_animation.hashCode}");

    //绑定动画值变动范围
    //内部实现 新创建了一个_AnimatedEvaluation实例
    // Animation<T> animate(Animation<double> parent) {
    //   return _AnimatedEvaluation<T>(parent, this);
    // }
    _animation = tween.animate(_animation);
    print("_animation hashcode = ${_animation.hashCode}");

    //稍微改变下顺序 结果报错

    //❌❌❌❌❌CurvedAnimation 仅能处理 0-1的值 所以在此之前不要转成实际值
    //看下CurvedAnimation代码 CurvedAnimation用于处理 0-1的值 所以不能先将_animationController关联tween转成实际值
    // final double t = parent.value;
    // if (activeCurve == null)
    //   return t;
    // if (t == 0.0 || t == 1.0) {
    // _animation = tween.animate(_animationController);
    // _animation = CurvedAnimation(parent: _animation, curve: Curves.bounceOut);

    //监听值的变化 然后刷新UI
    _animation.addListener(() {
      setState(() => {});
    });
    print("_animation hashcode = ${_animation.hashCode}");

    // 第二个动画
    _animationController2 = new AnimationController(
        duration: Duration(milliseconds: 2500),
        lowerBound: 0,
        upperBound: 1,
        vsync: this);

    //速率变化的加速度 匀速 淡入淡出 ....
    _animation2 =
        CurvedAnimation(parent: _animationController2, curve: Curves.bounceOut);

    //绑定控制器和动画值变动范围
    _animation2 = tween2.animate(_animation2);

    //监听值的变化 然后刷新UI
    _animation2.addListener(() {
      setState(() => {});
    });

    _animation2.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        print("动画开始执行");
      } else if (status == AnimationStatus.completed) {
        print("动画执行完成");
        //执行完成后再反向执行一遍
        _animationController2.reverse();
      } else if (status == AnimationStatus.dismissed) {
        print("动画停在了开头 一般是反向动画结束后的状态");
        _animationController2.forward();
      } else if (status == AnimationStatus.reverse) {
        print("动画翻转执行");
      }
    });

    Future.delayed(Duration(seconds: 3), () {
      // 执行动画
      _animationController.forward();
      // 执行动画
      _animationController2.forward();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.blue,
                width: _animation.value, //value = controller的比率 x 动画变化的值范围
                height: _animation.value,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.green,
                width: _animation2.value, //value = controller的比率 x 动画变化的值范围
                height: _animation2.value,
              ),
            )
          ],
        ));
  }
}

abstract class A {
  String name;
  // 一个有默认值的构造函数
  // A({this.name = "12"});
  // 一个有无默认值的构造函数
  A({required this.name});
}

class B {
  int age;
  B(this.age);
}

class C extends A {
  C(namepp) : super(name: namepp);

  void test() {
    // ❌print(namepp);
    print(name);
  }
}

class D extends B {
  D(int age) : super(age);
}

class AppAnimatedWdg extends StatefulWidget {
  const AppAnimatedWdg({Key? key}) : super(key: key);

  @override
  _AppAnimatedWdgState createState() => _AppAnimatedWdgState();
}

class _AppAnimatedWdgState extends State<AppAnimatedWdg>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _animation =
        Tween<double>(begin: 0.0, end: 100).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedWidget动画"),
      ),
      body: Center(
        child: AppAnimatedWidget(_animation),
      ),
    );
  }
}

//AnimatedWidget AnimatedBuilder 会自动 addlisten 调用 setstate...

//*********************AnimatedWidget******************//
// AnimatedWidget自动执行 addListener 和 setstate
class AppAnimatedWidget extends AnimatedWidget {
  AppAnimatedWidget(para) : super(listenable: para);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;

    return Container(
      color: Colors.red,
      width: animation.value,
      height: animation.value,
    );
  }
}

//*********************AnimatedBuilder******************//
// AnimatedBuilder 传入的一个组件进行动画操作 将动画能力抽离出来

class AnimatedBuilderWidget extends StatelessWidget {
  Animation<double> animation;
  Widget child;
  AnimatedBuilderWidget(this.animation, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: this.animation,
        builder: (BuildContext context, Widget? child) {
          return new Container(
              height: animation.value, width: animation.value, child: child);
        },
        child: child,
      ),
    );
  }
}

//*********************一个animationController使用多个Tween******************//
//简单来说就是 tween 调用 evaluate 根据controller算出当前比率时实际的值
class ControllerMoreTween extends StatefulWidget {
  const ControllerMoreTween({Key? key}) : super(key: key);

  @override
  _ControllerMoreTweenState createState() => _ControllerMoreTweenState();
}

class _ControllerMoreTweenState extends State<ControllerMoreTween>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Tween<double> _width_height = Tween<double>(begin: 0, end: 100);
  Tween<double> _alpha = Tween<double>(begin: 0, end: 0.5);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("一个animationController使用多个Tween(动画组)"),
      ),
      body: Center(
        child: Opacity(
          //根据controller算出透明度实际值
          opacity: _alpha.evaluate(_animationController),
          child: Container(
            color: Colors.red,
            //根据controller算出宽高实际值
            width: _width_height.evaluate(_animationController),
            height: _width_height.evaluate(_animationController),
          ),
        ),
      ),
    );
  }
}
