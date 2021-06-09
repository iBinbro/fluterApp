import 'package:flutter_app_study_widgets/model/test_model_entity.dart';

testModelEntityFromJson(TestModelEntity data, Map<String, dynamic> json) {
	if (json['reason'] != null) {
		data.reason = json['reason'].toString();
	}
	if (json['result'] != null) {
		data.result = TestModelResult().fromJson(json['result']);
	}
	if (json['error_code'] != null) {
		data.errorCode = json['error_code'] is String
				? int.tryParse(json['error_code'])
				: json['error_code'].toInt();
	}
	return data;
}

Map<String, dynamic> testModelEntityToJson(TestModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['reason'] = entity.reason;
	data['result'] = entity.result?.toJson();
	data['error_code'] = entity.errorCode;
	return data;
}

testModelResultFromJson(TestModelResult data, Map<String, dynamic> json) {
	if (json['stat'] != null) {
		data.stat = json['stat'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => TestModelResultData().fromJson(v)).toList();
	}
	if (json['page'] != null) {
		data.page = json['page'].toString();
	}
	if (json['pageSize'] != null) {
		data.pageSize = json['pageSize'].toString();
	}
	return data;
}

Map<String, dynamic> testModelResultToJson(TestModelResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['stat'] = entity.stat;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	data['page'] = entity.page;
	data['pageSize'] = entity.pageSize;
	return data;
}

testModelResultDataFromJson(TestModelResultData data, Map<String, dynamic> json) {
	if (json['uniquekey'] != null) {
		data.uniquekey = json['uniquekey'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['date'] != null) {
		data.date = json['date'].toString();
	}
	if (json['category'] != null) {
		data.category = json['category'].toString();
	}
	if (json['author_name'] != null) {
		data.authorName = json['author_name'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['thumbnail_pic_s'] != null) {
		data.thumbnailPicS = json['thumbnail_pic_s'].toString();
	}
	if (json['thumbnail_pic_s02'] != null) {
		data.thumbnailPicS02 = json['thumbnail_pic_s02'].toString();
	}
	if (json['thumbnail_pic_s03'] != null) {
		data.thumbnailPicS03 = json['thumbnail_pic_s03'].toString();
	}
	if (json['is_content'] != null) {
		data.isContent = json['is_content'].toString();
	}
	return data;
}

Map<String, dynamic> testModelResultDataToJson(TestModelResultData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['uniquekey'] = entity.uniquekey;
	data['title'] = entity.title;
	data['date'] = entity.date;
	data['category'] = entity.category;
	data['author_name'] = entity.authorName;
	data['url'] = entity.url;
	data['thumbnail_pic_s'] = entity.thumbnailPicS;
	data['thumbnail_pic_s02'] = entity.thumbnailPicS02;
	data['thumbnail_pic_s03'] = entity.thumbnailPicS03;
	data['is_content'] = entity.isContent;
	return data;
}