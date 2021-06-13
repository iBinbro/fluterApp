class NetCustomCode {
  static const int No_Data = -999;

  //拦截器
  static const Map errorInterruptMap = {401: "登录凭证已失效,请重新登录"};
}

class NetUrls {
  static const String baseUrl = "http://192.168.72.68:8080";

  //***接口地址***//
  static const String testApi =
      "/toutiao/index?type=shishang&key=483294d5e9b2202317817d0696b47a58";

  static const String LoginApi = "/login/";
  static const String registerApi = "/login/register";

  static const String bannerApi = "/banner/list";

}
