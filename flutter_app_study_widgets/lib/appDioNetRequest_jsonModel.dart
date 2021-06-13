import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_study_widgets/appSimpleWebBrower.dart';
import 'package:flutter_app_study_widgets/app_dio_net_request_entity.dart';
import 'package:flutter_app_study_widgets/generated/json/base/json_convert_content.dart';

// https://v.juhe.cn/toutiao/index?type=shishang&key=483294d5e9b2202317817d0696b47a58

class NetListView extends StatefulWidget {
  @override
  _NetListViewState createState() => _NetListViewState();
}

class _NetListViewState extends State<NetListView> {
  Map data = {};

  static Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio jsonmodel"),
      ),
      body: FutureBuilder(
        //FutureBuilder的使用
        future: _dio.get(
            'https://v.juhe.cn/toutiao/index?type=shishang&key=483294d5e9b2202317817d0696b47a58'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {//网络请求完成

            if (snapshot.hasError){//网络出错
              return Text(snapshot.error.toString());
            }

            if (snapshot.hasData) {//未出错且有数据
              //snapshot.data 服务器返回的数据 Response 包括响应头 响应体 等信息
              Response response = snapshot.data;

              //获取响应体
              var dataMap = response.data;

              //JsonConvert.fromJsonAsT...model转json
              AppDioNetRequestEntity appDioNetRequestModelEntity =
                  JsonConvert.fromJsonAsT<AppDioNetRequestEntity>(dataMap);

              return ListView.builder(
                itemBuilder: (context, index) {
                  AppDioNetRequestResultData data =
                      appDioNetRequestModelEntity.result!.data![index];

                  var date22 = data.date;

                  String finalDateString = formatDate(data.date!,
                      [yyyy, "年", mm, "月", dd, "日", HH, "时", nn, "分", ss, "秒"]);

                  return ListTile(
                    title: Text(data.title ?? "无数据"),
                    //日期解析
                    subtitle: Text(finalDateString),
                    leading: SizedBox(
                      child: Image.network(
                        data.thumbnailPicS ?? "",
                        fit: BoxFit.cover,
                      ),
                      width: 100,
                      height: 100,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AWebBrower(data.url);
                      }));
                    },
                  );
                },
                itemCount:
                    appDioNetRequestModelEntity.result?.data?.length ?? 0,
              );
            } else {
              return Text("暂无数据");
            }
          } else {//未完成 loading...
            return Text("Loading");
          }
        },
      ),
    );
  }
}
