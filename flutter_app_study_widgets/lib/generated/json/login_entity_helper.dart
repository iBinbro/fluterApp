import 'package:flutter_app_study_widgets/model/login_entity.dart';

loginEntityFromJson(LoginEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = LoginData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> loginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

loginDataFromJson(LoginData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['uuid'] != null) {
		data.uuid = json['uuid'].toString();
	}
	if (json['phone'] != null) {
		data.phone = json['phone'].toString();
	}
	if (json['remark'] != null) {
		data.remark = json['remark'];
	}
	if (json['role'] != null) {
		data.role = json['role'] is String
				? int.tryParse(json['role'])
				: json['role'].toInt();
	}
	if (json['level'] != null) {
		data.level = json['level'] is String
				? int.tryParse(json['level'])
				: json['level'].toInt();
	}
	if (json['invitationCode'] != null) {
		data.invitationCode = json['invitationCode'];
	}
	if (json['parentId'] != null) {
		data.parentId = json['parentId'].toString();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	if (json['invalidAt'] != null) {
		data.invalidAt = json['invalidAt'].toString();
	}
	return data;
}

Map<String, dynamic> loginDataToJson(LoginData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['uuid'] = entity.uuid;
	data['phone'] = entity.phone;
	data['remark'] = entity.remark;
	data['role'] = entity.role;
	data['level'] = entity.level;
	data['invitationCode'] = entity.invitationCode;
	data['parentId'] = entity.parentId;
	data['token'] = entity.token;
	data['invalidAt'] = entity.invalidAt;
	return data;
}