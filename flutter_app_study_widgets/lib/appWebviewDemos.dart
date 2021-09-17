import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as flutter_html;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart'
as flutter_webview_plugin;
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'
as flutter_widget_from_html;
import 'package:webview_flutter/webview_flutter.dart' as webview_flutter;
import 'package:flutter_inappwebview/flutter_inappwebview.dart'
as flutter_inappwebview;

class WebViews extends StatelessWidget {
  const WebViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("webviews")),
      body: ListView.builder(itemBuilder: (context, index) {
        String text = "";
        if (index == 0) {
          text = "webview_flutter";
        } else if (index == 1) {
          text = "flutter_inappwebview";
        } else if (index == 2) {
          text = "flutter_webview_plugin";
        } else if (index == 3) {
          text = "flutter_html";
        } else if (index == 4) {
          text = "flutter_widget_from_html_demo";
        }

        return GestureDetector(
          child: ListTile(
            title: Text(text),
          ),
          onTap: () {
            if (index == 0) {
              Navigator.of(context).pushNamed("webview_flutter");
            } else if (index == 1) {
              Navigator.of(context).pushNamed("flutter_inappwebview");
            } else if (index == 2) {
              Navigator.of(context).pushNamed("flutter_webview_plugin");
            } else if (index == 3) {
              Navigator.of(context).pushNamed("flutter_html");
            } else if (index == 4) {
              Navigator.of(context).pushNamed("flutter_widget_from_html_demo");
            }
          },
        );
      }),
    );
  }
}

//缺点 白屏需要设置延迟显示 250ms 不能作为自适应高度的小控件显示
class webview_flutter_demo extends StatefulWidget {
  const webview_flutter_demo({Key? key}) : super(key: key);

  @override
  _webview_flutter_demoState createState() => _webview_flutter_demoState();
}

class _webview_flutter_demoState extends State<webview_flutter_demo> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          webview_flutter.WebView(
            initialUrl: "http://h5.woniuxingyun.top:8808/static/privacy.html",
            onPageStarted: (url) {
              setState(() {
                index = 1;
              });
            },
            onPageFinished: (url) {
              Future.delayed(Duration(milliseconds: 250), () {
                setState(() {
                  index = 0;
                });
              });
            },
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}

//和webview_flutter没啥区别
class inappwebview_demo extends StatefulWidget {
  const inappwebview_demo({Key? key}) : super(key: key);

  @override
  _inappwebview_demoState createState() => _inappwebview_demoState();
}

class _inappwebview_demoState extends State<inappwebview_demo> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          flutter_inappwebview.InAppWebView(
            initialUrlRequest: flutter_inappwebview.URLRequest(
                url: Uri.parse(
                    "http://h5.woniuxingyun.top:8808/static/privacy.html")),
            onLoadStart:
                (flutter_inappwebview.InAppWebViewController controller,
                Uri? url) {
              setState(() {
                index = 1;
              });
            },
            onLoadStop: (flutter_inappwebview.InAppWebViewController controller,
                Uri? url) {
              setState(() {
                index = 0;
              });
            },
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}

//白屏依旧
class flutter_webview_plugin_demo extends StatefulWidget {
  const flutter_webview_plugin_demo({Key? key}) : super(key: key);

  @override
  _flutter_webview_plugin_demoState createState() =>
      _flutter_webview_plugin_demoState();
}

class _flutter_webview_plugin_demoState
    extends State<flutter_webview_plugin_demo> {
  @override
  Widget build(BuildContext context) {
    return flutter_webview_plugin.WebviewScaffold(
      url: "http://h5.woniuxingyun.top:8808/static/privacy.html",
      initialChild: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

//可以作为小组件 嵌入到页面中
class flutter_html_demo extends StatefulWidget {
  const flutter_html_demo({Key? key}) : super(key: key);

  @override
  _flutter_html_demoState createState() => _flutter_html_demoState();
}

class _flutter_html_demoState extends State<flutter_html_demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: flutter_html.Html(
          data:
          """<div class="w-e-text-container"><div class="w-e-text"><p><font size="2">产品详情<br/></font></p><p><font size="2">产出透明主网数据同步,产出公开透明<br/>顶级运维专家运维服务,高效产出保障<br/>1,独立满存订单将于开始产出日0时开始产出,开始产出时由销售方提供当时主网所需的足额质押FIL.质押FIL冻结540天,到期解冻后归销售方所有.<br/>2,独立满存产品所交付为已完成封存的有效存储合约期最长为540天+540天,前540天合约周期届满前,用户可选择续期540天.续期需一次性支付相关费用,具体数额以续期时 IPFS 主网规则为任.<br/>3,独立满存产品收取20%FIL产出,用以负担带宽、存储设备运维等费用.<br/>4,独立满存库存以标注的存储节点实际封存存储为准,售完即止.<br/>风险提示<br/>1,FIL会发生价格波动的情况,且产出难度会不定期调整。市场价值波动或产出难度调整都可能导致合约的产出变动无论从数字资产还是法币角度,本产品不对合约产出做任何承诺,因产出难度、市场价值波动等因素,导致产出的数字资产价值变动,由用户自行承担.合约发行方对本合约条款保留所有解释权.<br/>2,本合同不涉及数字资产交易,若用户自行参与第三方的数字资产交易,应当自行承担责任和风险.<br/>3,用户理解并同意,如发生合同所约定的合同订立时不能预见、不能避免且不能克服的客观情况而导致合同无法继续履行的,本合同自动终止,合同各方互不承担责任,由此造成的损失须各方自行承担,用户已支付的费用不予退还.</font></p></div></div><style> p {color: #ffffff},.el-autocomplete-suggestion li.divider { margin-top: 6px; border-top: 1px solid rgb(0, 0, 0); } .el-autocomplete-suggestion li.divider:last-child { margin-bottom: -6px; } .el-dropdown-menu__item--divided { position: relative; margin-top: 6px; border-top: 1px solid rgb(230, 235, 245); } .el-dropdown-menu__item--divided::before { content: ""; height: 6px; display: block; margin: 0px -20px;background-color: rgb(32, 32, 32); } .el-dropdown-menu--medium .el-dropdown-menu__item.el-dropdown-menu__item--divided { margin-top: 6px; } .el-dropdown-menu--medium .el-dropdown-menu__item.el-dropdown-menu__item--divided::before { height: 6px; margin: 0px -17px; } .el-dropdown-menu--small .el-dropdown-menu__item.el-dropdown-menu__item--divided { margin-top: 4px; } .el-dropdown-menu--small .el-dropdown-menu__item.el-dropdown-menu__item--divided::before { height: 4px; margin: 0px -15px; } .el-dropdown-menu--mini .el-dropdown-menu__item.el-dropdown-menu__item--divided { margin-top: 3px; } .el-dropdown-menu--mini .el-dropdown-menu__item.el-dropdown-menu__item--divided::before { height: 3px; margin: 0px -10px; } .el-table th.required > div::before { display: inline-block; content: ""; width: 8px; height: 8px; border-radius: 50%; background: rgb(255, 77, 81); margin-right: 5px; vertical-align: middle; } .el-table td div { box-sizing: border-box; } .el-date-table.is-week-mode .el-date-table__row:hover div { background-color: rgb(32, 32, 32); } .el-date-table.is-week-mode .el-date-table__row:hover td:first-child div { margin-left: 5px; border-top-left-radius: 15px; border-bottom-left-radius: 15px; } .el-date-table.is-week-mode .el-date-table__row:hover td:last-child div { margin-right: 5px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; } .el-date-table.is-week-mode .el-date-table__row.current div { background-color: rgb(32, 32, 32); } .el-date-table td, .el-date-table td div { height: 30px; box-sizing: border-box; } .el-date-table td div { padding: 3px 0px; } .el-date-table td.in-range div, .el-date-table td.in-range div:hover { background-color: rgb(32, 32, 32); } .el-date-table td.end-date div, .el-date-table td.start-date div { color: rgb(255, 255, 255); } .el-date-table td.start-date div { margin-left: 5px; border-top-left-radius: 15px; border-bottom-left-radius: 15px; } .el-date-table td.end-date div { margin-right: 5px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; } .el-date-table td.disabled div { background-color: rgb(245, 247, 250); opacity: 1; cursor: not-allowed; color: rgb(192, 196, 204); } .el-date-table td.selected div { margin-left: 5px; margin-right: 5px; background-color: rgb(32, 32, 32); border-radius: 15px; } .el-date-table td.selected div:hover { background-color: rgb(32, 32, 32); } .el-month-table td div { height: 48px; padding: 6px 0px; box-sizing: border-box; } .el-month-table td.in-range div, .el-month-table td.in-range div:hover { background-color: rgb(32, 32, 32); } .el-month-table td.end-date div, .el-month-table td.start-date div { color: rgb(255, 255, 255); } .el-month-table td.start-date div { border-top-left-radius: 24px; border-bottom-left-radius: 24px; } .el-month-table td.end-date div { border-top-right-radius: 24px; border-bottom-right-radius: 24px; } .el-date-range-picker__header div { font-size: 16px; font-weight: 500; margin-right: 50px; } .el-date-range-picker__content .el-date-range-picker__header div { margin-left: 50px; margin-right: 50px; } .el-color-predefine__color-selector > div { display: flex; height: 100%; border-radius: 3px; } .el-color-svpanel__cursor > div { width: 4px; height: 4px; box-shadow: rgb(255, 255, 255) 0px 0px 0px 1.5px, rgba(0, 0, 0, 0.3) 0px 0px 1px 1px inset, rgba(0, 0, 0, 0.4) 0px 0px 1px 2px; border-radius: 50%; transform: translate(-2px, -2px); } .el-input-group__append button.el-button, .el-input-group__append div.el-select .el-input__inner, .el-input-group__append div.el-select:hover .el-input__inner, .el-input-group__prepend button.el-button, .el-input-group__prepend div.el-select .el-input__inner, .el-input-group__prepend div.el-select:hover .el-input__inner { border-right-color: transparent; border-left-color: transparent; background-color: transparent; color: inherit; border-top: 0px; border-bottom: 0px; } .el-divider { background-color: rgb(220, 223, 230); position: relative; } .el-divider--horizontal { display: block; height: 1px; width: 100%; margin: 24px 0px; } .el-divider--vertical { display: inline-block; width: 1px; height: 1em; margin: 0px 8px; vertical-align: middle; position: relative; } .el-divider__text { position: absolute;background-color: rgb(32, 32, 32); padding: 0px 20px; font-weight: 500; color: rgb(48, 49, 51); font-size: 14px; } .el-divider__text.is-left { left: 20px; transform: translateY(-50%); } .el-divider__text.is-center { left: 50%; transform: translateX(-50%) translateY(-50%); } .el-divider__text.is-right { right: 20px; transform: translateY(-50%); } .el-scrollbar__bar.is-vertical > div { width: 100%; } .el-scrollbar__bar.is-horizontal > div { height: 100%; } div:focus { outline: none; } .has-error .w-e-text-container { border-color: rgb(255, 77, 79) !important; } .w-e-menu-panel, .w-e-text-container, .w-e-toolbar { background-color: rgb(32, 32, 32); } .w-e-toolbar, .w-e-text-container, .w-e-menu-panel { padding: 0px; margin: 0px; box-sizing: border-box;background-color: rgb(32, 32, 32); } .w-e-toolbar h1, .w-e-text-container h1, .w-e-menu-panel h1 { font-size: 32px !important; } .w-e-toolbar h2, .w-e-text-container h2, .w-e-menu-panel h2 { font-size: 24px !important; } .w-e-toolbar h3, .w-e-text-container h3, .w-e-menu-panel h3 { font-size: 18.72px !important; } .w-e-toolbar h4, .w-e-text-container h4, .w-e-menu-panel h4 { font-size: 16px !important; } .w-e-toolbar h5, .w-e-text-container h5, .w-e-menu-panel h5 { font-size: 13.28px !important; } .w-e-toolbar p, .w-e-text-container p, .w-e-menu-panel p { font-size: 16px !important; } .w-e-toolbar .eleImg, .w-e-text-container .eleImg, .w-e-menu-panel .eleImg { cursor: pointer; display: inline-block; font-size: 18px; padding: 0px 3px; } .w-e-toolbar *, .w-e-text-container *, .w-e-menu-panel * { padding: 0px; margin: 0px; box-sizing: border-box; } .w-e-toolbar hr, .w-e-text-container hr, .w-e-menu-panel hr { cursor: pointer; display: block; height: 0px; border-width: 3px 0px 0px; border-right-style: initial; border-bottom-style: initial; border-left-style: initial; border-right-color: initial; border-bottom-color: initial; border-left-color: initial; border-image: initial; border-top-style: solid; border-top-color: rgb(204, 204, 204); margin: 20px 0px; } .w-e-text-container { overflow: hidden; } .w-e-text-container .w-e-progress { position: absolute; background-color: rgb(30, 136, 229); top: 0px; left: 0px; height: 1px; } .w-e-text-container .placeholder { color: rgb(212, 212, 212); position: absolute; font-size: 11pt; line-height: 22px; left: 10px; top: 10px; user-select: none; z-index: -1; } .w-e-text { padding: 0px 10px; overflow-y: auto; } .w-e-text p, .w-e-text h1, .w-e-text h2, .w-e-text h3, .w-e-text h4, .w-e-text h5, .w-e-text table, .w-e-text pre { margin: 10px 0px; line-height: 1.5; } .w-e-text ul, .w-e-text ol { margin: 10px 0px 10px 20px; } .w-e-text blockquote { display: block; border-left: 8px solid rgb(208, 229, 242); padding: 5px 10px; margin: 10px 0px; line-height: 1.4; font-size: 100%; background-color: rgb(241, 241, 241); } .w-e-text code { display: inline-block; background-color: rgb(241, 241, 241); border-radius: 3px; padding: 3px 5px; margin: 0px 3px; } .w-e-text pre code { display: block; } .w-e-text table { border-top: 1px solid rgb(204, 204, 204); border-left: 1px solid rgb(204, 204, 204); } .w-e-text table td, .w-e-text table th { border-bottom: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(204, 204, 204); padding: 3px 5px; min-height: 30px; } .w-e-text table th { border-bottom: 2px solid rgb(204, 204, 204); text-align: center; background-color: rgb(241, 241, 241); } .w-e-text:focus { outline: none; } .w-e-text img { cursor: pointer; } .w-e-text img:hover { box-shadow: rgb(51, 51, 51) 0px 0px 5px; } .w-e-text .w-e-todo { margin: 0px 0px 0px 20px; } .w-e-text .w-e-todo li { list-style: none; font-size: 1em; } .w-e-text .w-e-todo li span:nth-child(1) { position: relative; left: -18px; } .w-e-text .w-e-todo li span:nth-child(1) input { position: absolute; margin-right: 3px; } .w-e-text .w-e-todo li span:nth-child(1) input[type="checkbox"] { top: 50%; margin-top: -6px; } .el-table__placeholder { display: inline-block; width: 20px; } .el-date-editor .el-range-input::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-date-editor .el-range-input::placeholder { color: rgb(192, 196, 204); } .el-range-editor.is-disabled input::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-range-editor.is-disabled input::placeholder { color: rgb(192, 196, 204); } .el-cascader__search-input::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-cascader__search-input::placeholder { color: rgb(192, 196, 204); } .el-textarea__inner::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-textarea__inner::placeholder { color: rgb(192, 196, 204); } .el-textarea.is-disabled .el-textarea__inner::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-textarea.is-disabled .el-textarea__inner::placeholder { color: rgb(192, 196, 204); } .el-input__inner::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-input__inner::placeholder { color: rgb(192, 196, 204); } .el-input.is-disabled .el-input__inner::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-input.is-disabled .el-input__inner::placeholder { color: rgb(192, 196, 204); } .el-image__error, .el-image__inner, .el-image__placeholder { width: 100%; height: 100%; } .el-image__error, .el-image__placeholder { background: rgb(245, 247, 250); } .w-e-img-drag-mask { position: absolute; z-index: 1; border: 1px dashed rgb(204, 204, 204); box-sizing: border-box; } .w-e-img-drag-mask .w-e-img-drag-rb { position: absolute; right: -5px; bottom: -5px; width: 16px; height: 16px; border-radius: 50%; background: rgb(204, 204, 204); cursor: se-resize; } .w-e-img-drag-mask .w-e-img-drag-show-size { min-width: 110px; height: 22px; line-height: 22px; font-size: 14px; position: absolute; left: 0px; top: 0px; background-color: rgb(153, 153, 153); color: rgb(255, 255, 255); border-radius: 2px; padding: 0px 5px; }</style>""",
        ),
      ),
    );
  }
}

//可以作为小组件 嵌入到页面中 但是原有html的字体等属性不会被解析，可以手动赋予textstyle
class flutter_widget_from_html_demo extends StatefulWidget {
  const flutter_widget_from_html_demo({Key? key}) : super(key: key);

  @override
  _flutter_widget_from_html_demoState createState() =>
      _flutter_widget_from_html_demoState();
}

class _flutter_widget_from_html_demoState
    extends State<flutter_widget_from_html_demo> {
  @override
  Widget build(BuildContext context) {
    return flutter_widget_from_html.HtmlWidget(
      """<div class="w-e-text-container"><div class="w-e-text"><p><font size="2">产品详情<br/></font></p><p><font size="2">产出透明主网数据同步,产出公开透明<br/>顶级运维专家运维服务,高效产出保障<br/>1,独立满存订单将于开始产出日0时开始产出,开始产出时由销售方提供当时主网所需的足额质押FIL.质押FIL冻结540天,到期解冻后归销售方所有.<br/>2,独立满存产品所交付为已完成封存的有效存储合约期最长为540天+540天,前540天合约周期届满前,用户可选择续期540天.续期需一次性支付相关费用,具体数额以续期时 IPFS 主网规则为任.<br/>3,独立满存产品收取20%FIL产出,用以负担带宽、存储设备运维等费用.<br/>4,独立满存库存以标注的存储节点实际封存存储为准,售完即止.<br/>风险提示<br/>1,FIL会发生价格波动的情况,且产出难度会不定期调整。市场价值波动或产出难度调整都可能导致合约的产出变动无论从数字资产还是法币角度,本产品不对合约产出做任何承诺,因产出难度、市场价值波动等因素,导致产出的数字资产价值变动,由用户自行承担.合约发行方对本合约条款保留所有解释权.<br/>2,本合同不涉及数字资产交易,若用户自行参与第三方的数字资产交易,应当自行承担责任和风险.<br/>3,用户理解并同意,如发生合同所约定的合同订立时不能预见、不能避免且不能克服的客观情况而导致合同无法继续履行的,本合同自动终止,合同各方互不承担责任,由此造成的损失须各方自行承担,用户已支付的费用不予退还.</font></p></div></div><style> p {color: #ffffff},.el-autocomplete-suggestion li.divider { margin-top: 6px; border-top: 1px solid rgb(0, 0, 0); } .el-autocomplete-suggestion li.divider:last-child { margin-bottom: -6px; } .el-dropdown-menu__item--divided { position: relative; margin-top: 6px; border-top: 1px solid rgb(230, 235, 245); } .el-dropdown-menu__item--divided::before { content: ""; height: 6px; display: block; margin: 0px -20px;background-color: rgb(32, 32, 32); } .el-dropdown-menu--medium .el-dropdown-menu__item.el-dropdown-menu__item--divided { margin-top: 6px; } .el-dropdown-menu--medium .el-dropdown-menu__item.el-dropdown-menu__item--divided::before { height: 6px; margin: 0px -17px; } .el-dropdown-menu--small .el-dropdown-menu__item.el-dropdown-menu__item--divided { margin-top: 4px; } .el-dropdown-menu--small .el-dropdown-menu__item.el-dropdown-menu__item--divided::before { height: 4px; margin: 0px -15px; } .el-dropdown-menu--mini .el-dropdown-menu__item.el-dropdown-menu__item--divided { margin-top: 3px; } .el-dropdown-menu--mini .el-dropdown-menu__item.el-dropdown-menu__item--divided::before { height: 3px; margin: 0px -10px; } .el-table th.required > div::before { display: inline-block; content: ""; width: 8px; height: 8px; border-radius: 50%; background: rgb(255, 77, 81); margin-right: 5px; vertical-align: middle; } .el-table td div { box-sizing: border-box; } .el-date-table.is-week-mode .el-date-table__row:hover div { background-color: rgb(32, 32, 32); } .el-date-table.is-week-mode .el-date-table__row:hover td:first-child div { margin-left: 5px; border-top-left-radius: 15px; border-bottom-left-radius: 15px; } .el-date-table.is-week-mode .el-date-table__row:hover td:last-child div { margin-right: 5px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; } .el-date-table.is-week-mode .el-date-table__row.current div { background-color: rgb(32, 32, 32); } .el-date-table td, .el-date-table td div { height: 30px; box-sizing: border-box; } .el-date-table td div { padding: 3px 0px; } .el-date-table td.in-range div, .el-date-table td.in-range div:hover { background-color: rgb(32, 32, 32); } .el-date-table td.end-date div, .el-date-table td.start-date div { color: rgb(255, 255, 255); } .el-date-table td.start-date div { margin-left: 5px; border-top-left-radius: 15px; border-bottom-left-radius: 15px; } .el-date-table td.end-date div { margin-right: 5px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; } .el-date-table td.disabled div { background-color: rgb(245, 247, 250); opacity: 1; cursor: not-allowed; color: rgb(192, 196, 204); } .el-date-table td.selected div { margin-left: 5px; margin-right: 5px; background-color: rgb(32, 32, 32); border-radius: 15px; } .el-date-table td.selected div:hover { background-color: rgb(32, 32, 32); } .el-month-table td div { height: 48px; padding: 6px 0px; box-sizing: border-box; } .el-month-table td.in-range div, .el-month-table td.in-range div:hover { background-color: rgb(32, 32, 32); } .el-month-table td.end-date div, .el-month-table td.start-date div { color: rgb(255, 255, 255); } .el-month-table td.start-date div { border-top-left-radius: 24px; border-bottom-left-radius: 24px; } .el-month-table td.end-date div { border-top-right-radius: 24px; border-bottom-right-radius: 24px; } .el-date-range-picker__header div { font-size: 16px; font-weight: 500; margin-right: 50px; } .el-date-range-picker__content .el-date-range-picker__header div { margin-left: 50px; margin-right: 50px; } .el-color-predefine__color-selector > div { display: flex; height: 100%; border-radius: 3px; } .el-color-svpanel__cursor > div { width: 4px; height: 4px; box-shadow: rgb(255, 255, 255) 0px 0px 0px 1.5px, rgba(0, 0, 0, 0.3) 0px 0px 1px 1px inset, rgba(0, 0, 0, 0.4) 0px 0px 1px 2px; border-radius: 50%; transform: translate(-2px, -2px); } .el-input-group__append button.el-button, .el-input-group__append div.el-select .el-input__inner, .el-input-group__append div.el-select:hover .el-input__inner, .el-input-group__prepend button.el-button, .el-input-group__prepend div.el-select .el-input__inner, .el-input-group__prepend div.el-select:hover .el-input__inner { border-right-color: transparent; border-left-color: transparent; background-color: transparent; color: inherit; border-top: 0px; border-bottom: 0px; } .el-divider { background-color: rgb(220, 223, 230); position: relative; } .el-divider--horizontal { display: block; height: 1px; width: 100%; margin: 24px 0px; } .el-divider--vertical { display: inline-block; width: 1px; height: 1em; margin: 0px 8px; vertical-align: middle; position: relative; } .el-divider__text { position: absolute;background-color: rgb(32, 32, 32); padding: 0px 20px; font-weight: 500; color: rgb(48, 49, 51); font-size: 14px; } .el-divider__text.is-left { left: 20px; transform: translateY(-50%); } .el-divider__text.is-center { left: 50%; transform: translateX(-50%) translateY(-50%); } .el-divider__text.is-right { right: 20px; transform: translateY(-50%); } .el-scrollbar__bar.is-vertical > div { width: 100%; } .el-scrollbar__bar.is-horizontal > div { height: 100%; } div:focus { outline: none; } .has-error .w-e-text-container { border-color: rgb(255, 77, 79) !important; } .w-e-menu-panel, .w-e-text-container, .w-e-toolbar { background-color: rgb(32, 32, 32); } .w-e-toolbar, .w-e-text-container, .w-e-menu-panel { padding: 0px; margin: 0px; box-sizing: border-box;background-color: rgb(32, 32, 32); } .w-e-toolbar h1, .w-e-text-container h1, .w-e-menu-panel h1 { font-size: 32px !important; } .w-e-toolbar h2, .w-e-text-container h2, .w-e-menu-panel h2 { font-size: 24px !important; } .w-e-toolbar h3, .w-e-text-container h3, .w-e-menu-panel h3 { font-size: 18.72px !important; } .w-e-toolbar h4, .w-e-text-container h4, .w-e-menu-panel h4 { font-size: 16px !important; } .w-e-toolbar h5, .w-e-text-container h5, .w-e-menu-panel h5 { font-size: 13.28px !important; } .w-e-toolbar p, .w-e-text-container p, .w-e-menu-panel p { font-size: 16px !important; } .w-e-toolbar .eleImg, .w-e-text-container .eleImg, .w-e-menu-panel .eleImg { cursor: pointer; display: inline-block; font-size: 18px; padding: 0px 3px; } .w-e-toolbar *, .w-e-text-container *, .w-e-menu-panel * { padding: 0px; margin: 0px; box-sizing: border-box; } .w-e-toolbar hr, .w-e-text-container hr, .w-e-menu-panel hr { cursor: pointer; display: block; height: 0px; border-width: 3px 0px 0px; border-right-style: initial; border-bottom-style: initial; border-left-style: initial; border-right-color: initial; border-bottom-color: initial; border-left-color: initial; border-image: initial; border-top-style: solid; border-top-color: rgb(204, 204, 204); margin: 20px 0px; } .w-e-text-container { overflow: hidden; } .w-e-text-container .w-e-progress { position: absolute; background-color: rgb(30, 136, 229); top: 0px; left: 0px; height: 1px; } .w-e-text-container .placeholder { color: rgb(212, 212, 212); position: absolute; font-size: 11pt; line-height: 22px; left: 10px; top: 10px; user-select: none; z-index: -1; } .w-e-text { padding: 0px 10px; overflow-y: auto; } .w-e-text p, .w-e-text h1, .w-e-text h2, .w-e-text h3, .w-e-text h4, .w-e-text h5, .w-e-text table, .w-e-text pre { margin: 10px 0px; line-height: 1.5; } .w-e-text ul, .w-e-text ol { margin: 10px 0px 10px 20px; } .w-e-text blockquote { display: block; border-left: 8px solid rgb(208, 229, 242); padding: 5px 10px; margin: 10px 0px; line-height: 1.4; font-size: 100%; background-color: rgb(241, 241, 241); } .w-e-text code { display: inline-block; background-color: rgb(241, 241, 241); border-radius: 3px; padding: 3px 5px; margin: 0px 3px; } .w-e-text pre code { display: block; } .w-e-text table { border-top: 1px solid rgb(204, 204, 204); border-left: 1px solid rgb(204, 204, 204); } .w-e-text table td, .w-e-text table th { border-bottom: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(204, 204, 204); padding: 3px 5px; min-height: 30px; } .w-e-text table th { border-bottom: 2px solid rgb(204, 204, 204); text-align: center; background-color: rgb(241, 241, 241); } .w-e-text:focus { outline: none; } .w-e-text img { cursor: pointer; } .w-e-text img:hover { box-shadow: rgb(51, 51, 51) 0px 0px 5px; } .w-e-text .w-e-todo { margin: 0px 0px 0px 20px; } .w-e-text .w-e-todo li { list-style: none; font-size: 1em; } .w-e-text .w-e-todo li span:nth-child(1) { position: relative; left: -18px; } .w-e-text .w-e-todo li span:nth-child(1) input { position: absolute; margin-right: 3px; } .w-e-text .w-e-todo li span:nth-child(1) input[type="checkbox"] { top: 50%; margin-top: -6px; } .el-table__placeholder { display: inline-block; width: 20px; } .el-date-editor .el-range-input::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-date-editor .el-range-input::placeholder { color: rgb(192, 196, 204); } .el-range-editor.is-disabled input::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-range-editor.is-disabled input::placeholder { color: rgb(192, 196, 204); } .el-cascader__search-input::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-cascader__search-input::placeholder { color: rgb(192, 196, 204); } .el-textarea__inner::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-textarea__inner::placeholder { color: rgb(192, 196, 204); } .el-textarea.is-disabled .el-textarea__inner::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-textarea.is-disabled .el-textarea__inner::placeholder { color: rgb(192, 196, 204); } .el-input__inner::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-input__inner::placeholder { color: rgb(192, 196, 204); } .el-input.is-disabled .el-input__inner::-webkit-input-placeholder { color: rgb(192, 196, 204); } .el-input.is-disabled .el-input__inner::placeholder { color: rgb(192, 196, 204); } .el-image__error, .el-image__inner, .el-image__placeholder { width: 100%; height: 100%; } .el-image__error, .el-image__placeholder { background: rgb(245, 247, 250); } .w-e-img-drag-mask { position: absolute; z-index: 1; border: 1px dashed rgb(204, 204, 204); box-sizing: border-box; } .w-e-img-drag-mask .w-e-img-drag-rb { position: absolute; right: -5px; bottom: -5px; width: 16px; height: 16px; border-radius: 50%; background: rgb(204, 204, 204); cursor: se-resize; } .w-e-img-drag-mask .w-e-img-drag-show-size { min-width: 110px; height: 22px; line-height: 22px; font-size: 14px; position: absolute; left: 0px; top: 0px; background-color: rgb(153, 153, 153); color: rgb(255, 255, 255); border-radius: 2px; padding: 0px 5px; }</style>""",
      textStyle: TextStyle(fontSize: 20),
    );
  }
}