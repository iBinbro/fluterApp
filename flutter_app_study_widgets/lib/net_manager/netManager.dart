// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import '../generated/json/base/json_convert_content.dart';
// import '../model/net_code_entity.dart';
// import '../net_manager/netUrls.dart';
// import '../utils/utils.dart';
//
// typedef NetSuccessCallback = Function(dynamic);
// typedef NetErrorCallback = Function(dynamic);
// typedef NetRequestingCallback = Function();
//
// class NetManager {
//   static Dio _dio = Dio();
//   static const String _DioGet = "GET";
//   static const String _DioPost = "POST";
//
//   static final int _connectTimeOut = 10 * 1000;
//   static final int _ResponseTimeOut = 10 * 1000;
//
//   static const String NetErrorMsg = "网络错误，请稍后再试";
//
//   static final NetManager _netManager = new NetManager._internal();
//   factory NetManager() => _netManager;
//   //初始化拦截器 请求配置
//   NetManager._internal() {
//     print("NetManager => 初始化");
//
//     _dio.options.baseUrl = NetUrls.baseUrl;
//     _dio.options.connectTimeout = _connectTimeOut;
//     _dio.options.receiveTimeout = _ResponseTimeOut;
//
//     (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (client) {
//       client.findProxy = (url) {
//         // ///设置代理 电脑ip地址
//         return "PROXY 192.168.72.57:8888";
//         return 'DIRECT';
//       };
//     };
//
//     _dio.interceptors.add(InterceptorsWrapper(onRequest: (
//         RequestOptions options,
//         RequestInterceptorHandler handler,
//         ) {
//       print("网络开始请求");
//
//       if (Global.getLogin()?.data?.token != null) {
//         options.headers["token"] = Global.getLogin()?.data?.token ?? "";
//       }
//       if (Global.getXauthtoken() != null && Global.getXauthtoken().length > 0) {
//         options.headers["X-Auth-Token"] = Global.getXauthtoken();
//       }
//
//       return handler.next(options);
//     }, onResponse: (
//         Response e,
//         ResponseInterceptorHandler handler,
//         ) {
//       print("返回结果 ===== ${e.data}");
//
//       if (Global.getXauthtoken() == null ||
//           Global.getXauthtoken().length <= 0) {
//         List? xtokens = (e.headers["X-Auth-Token"] is List)
//             ? e.headers["X-Auth-Token"]
//             : null;
//         String? xtoken = xtokens?.first;
//         if ((xtoken is String) && xtoken.length > 0) {
//           Global.saveXauthtoken(xtoken);
//         }
//       }
//
//       NetCodeEntity resModel = JsonConvert.fromJsonAsT<NetCodeEntity>(e.data);
//
//       if (resModel.code != null) {
//         if (NetCustomCode.errorInterruptMap.containsKey(resModel.code)) {
//           EasyLoading.showError(NetCustomCode.errorInterruptMap[resModel.code]);
//
//           resModel.code == 401
//               ? AppUtil.pushNamedAndRemoveUntil("/login")
//               : null;
//
//           return;
//         }
//       }
//       return handler.next(e);
//     }, onError: (
//         DioError e,
//         ErrorInterceptorHandler handler,
//         ) {
//       print("接口报错失败");
//       return handler.next(e);
//     }));
//   }
//
//   static Future<Response?> request<T>(String path,
//       [String requestMethod = _DioGet,
//         Map<String, dynamic>? para,
//         NetSuccessCallback? netSuccessCallback,
//         NetErrorCallback? netErrorCallback,
//         String? baseUrl,
//         int? connectTimeout,
//         int? receiveTimeout,
//         Map<String, dynamic>? header,
//         CancelToken? cancelToken]) async {
//     para = para ?? Map();
//     header = header ?? Map();
//
//     netSuccessCallback = netSuccessCallback ?? null;
//     netErrorCallback = netErrorCallback ?? null;
//
//     connectTimeout =
//     (connectTimeout != null) ? (connectTimeout * 1000) : _connectTimeOut;
//     receiveTimeout =
//     (receiveTimeout != null) ? (receiveTimeout * 1000) : _ResponseTimeOut;
//
//     cancelToken = cancelToken ?? CancelToken();
//
//     _dio.options.baseUrl = baseUrl ?? NetUrls.baseUrl;
//
//     Options options = Options(method: requestMethod, headers: header);
//
//     _dio.options.connectTimeout = connectTimeout;
//     _dio.options.receiveTimeout = receiveTimeout;
//
//     Response? response;
//     try {
//       response = await _dio.request(path,
//           options: options, data: para, cancelToken: cancelToken);
//       NetManager.formatResponse<T>(
//           response, netSuccessCallback, netErrorCallback);
//     } catch (e) {
//       if (netErrorCallback != null) {
//         netErrorCallback(NetErrorMsg);
//       }
//     } finally {
//       return response;
//     }
//   }
//
//   /// 格式化Response.
//   static formatResponse<T>(
//       Response response,
//       NetSuccessCallback? netSuccessCallback,
//       NetErrorCallback? netErrorCallback,
//       ) {
//     if (response.statusCode == 200) {
//       //网络请求成功
//       if (netSuccessCallback != null) {
//         //转换数据模型
//         T responseModel = JsonConvert.fromJsonAsT<T>(response.data);
//
//         if (responseModel != null) {
//           //转换成功
//           netSuccessCallback(responseModel);
//         } else {
//           //转换失败 获取 基础 msg code 信息
//           NetCodeEntity resModel =
//           JsonConvert.fromJsonAsT<NetCodeEntity>(response.data);
//           if (resModel != null) {
//             netSuccessCallback(resModel);
//           } else {
//             //基础信息转换失败 返回原始map
//             netSuccessCallback(response.data);
//           }
//         }
//       }
//     } else {
//       if (netErrorCallback != null) {
//         netErrorCallback(NetErrorMsg);
//       }
//     }
//   }
//
//   /// 解析异步渲染回调数据.
//   static void snapshotData<T>(AsyncSnapshot snapshot,
//       [NetSuccessCallback? netSuccessCallback,
//         NetErrorCallback? netErrorCallback,
//         NetRequestingCallback? netRequestingCallback]) {
//     if (snapshot != null && snapshot.connectionState == ConnectionState.done) {
//       //网络请求完成
//
//       if (snapshot.hasError) {
//         //网络出错
//         if (netErrorCallback != null) {
//           // netErrorCallback(snapshot.error.toString());
//           netErrorCallback(NetErrorMsg);
//         }
//         return;
//       }
//
//       if (snapshot.hasData) {
//         //未出错且有数据
//         //snapshot.data 服务器返回的数据 Response 包括响应头 响应体 等信息
//         Response response = snapshot.data;
//
//         NetManager.formatResponse<T>(
//             response, netSuccessCallback, netErrorCallback);
//       } else {
//         if (netErrorCallback != null) {
//           netErrorCallback(NetErrorMsg);
//         }
//       }
//     } else {
//       if (netRequestingCallback != null) {
//         netRequestingCallback();
//       }
//     }
//   }
//
//   ///发送一个get请求.
//   static Future<Response?> get<T>(String path,
//       [NetSuccessCallback? netSuccessCallback,
//         NetErrorCallback? netErrorCallback,
//         Map<String, dynamic>? para]) async {
//     Response? response = await NetManager.request<T>(
//       path,
//       _DioGet,
//       para,
//       netSuccessCallback,
//       netErrorCallback,
//     );
//
//     return response;
//   }
//
//   ///发送一个post请求.
//   static Future<Response?> post<T>(String path,
//       [NetSuccessCallback? netSuccessCallback,
//         NetErrorCallback? netErrorCallback,
//         Map<String, dynamic>? para]) async {
//     Response? response = await NetManager.request<T>(
//       path,
//       _DioPost,
//       para,
//       netSuccessCallback,
//       netErrorCallback,
//     );
//
//     return response;
//   }
// }
