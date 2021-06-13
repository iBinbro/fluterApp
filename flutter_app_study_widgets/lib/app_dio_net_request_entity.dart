import 'package:flutter_app_study_widgets/generated/json/base/json_convert_content.dart';
import 'package:flutter_app_study_widgets/generated/json/base/json_field.dart';

class AppDioNetRequestEntity with JsonConvert<AppDioNetRequestEntity> {
	String? reason;
	AppDioNetRequestResult? result;
	@JSONField(name: "error_code")
	int? errorCode;
}

class AppDioNetRequestResult with JsonConvert<AppDioNetRequestResult> {
	String? stat;
	List<AppDioNetRequestResultData>? data;
	String? page;
	String? pageSize;
}

class AppDioNetRequestResultData with JsonConvert<AppDioNetRequestResultData> {
	String? uniquekey;
	String? title;
	DateTime? date;
	String? category;
	@JSONField(name: "author_name")
	String? authorName;
	String? url;
	@JSONField(name: "thumbnail_pic_s")
	String? thumbnailPicS;
	@JSONField(name: "thumbnail_pic_s02")
	String? thumbnailPicS02;
	@JSONField(name: "thumbnail_pic_s03")
	String? thumbnailPicS03;
	@JSONField(name: "is_content")
	String? isContent;
}
