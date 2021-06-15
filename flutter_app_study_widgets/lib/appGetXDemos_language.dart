import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as UI;

// //国际化
// return GetMaterialApp(
// .......
// .......
// translations: LanguageTransition(),//国际化的键值存储对象
// // locale: Locale("zh", "CN"),
// locale: Locale("zhzhzhzhzhzhzhzh", "?????"),//默认的语言
// fallbackLocale: Locale('enenenenenenenen', "?????????"),//应用指定语言失败时，指定一个固定语言
// // fallbackLocale: Locale('en', "US"),

abstract class LanguageTransitionDic {
  //文本对应的KEY
  static const Lang = "language";

  //文本KEY所对应的翻译文本
  static const ch = {
    //哪种语言
    Lang: "我是中文", //具体的键值对
  };
  static const en = {
    //哪种语言
    Lang: "This is English", //具体的键值对
  };
}

class LanguageTransition extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys {
    // return {
    //   "zhzhzhzhzhzhzhzh": {
    //     "language": "我是中文",
    //   },
    //   "enenenenenenenen": {
    //     "language": "This is English",
    //   }
    // };
    //进一步封装
    return {
      "zhzhzhzhzhzhzhzh": LanguageTransitionDic.ch,
      "enenenenenenenen": LanguageTransitionDic.en,
    };
  }
}

class GetxLanguage extends StatelessWidget {
  const GetxLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX 国际化 ${LanguageTransitionDic.Lang.tr}"),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                //设备当前语言
                print(UI.window.locale);

                //更换语言
                if ("language".tr == "我是中文") {
                  Get.updateLocale(Locale("enenenenenenenen", "qqqqqq"));
                } else {
                  Get.updateLocale(Locale("zhzhzhzhzhzhzhzh", "qqqqqq"));
                }
              },
              child: Text(
                "language".tr,
                style: TextStyle(color: Colors.blue),
              )),
          TextButton(
              onPressed: () {
                Get.to(() => GetxLanguage(), preventDuplicates: false);
              },
              child: Text(
                "再打开一个页面",
                style: TextStyle(color: Colors.blue),
              )),
        ],
      ),
    );
  }
}
