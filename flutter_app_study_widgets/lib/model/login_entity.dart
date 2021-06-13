import '../generated/json/base/json_convert_content.dart';

class LoginEntity with JsonConvert<LoginEntity> {
	int? code;
	String? msg;
	LoginData? data;
}

class LoginData with JsonConvert<LoginData> {
	int? id;
	String? uuid;
	String? phone;
	dynamic? remark;
	int? role;
	int? level;
	dynamic? invitationCode;
	String? parentId;
	String? token;
	String? invalidAt;
}
