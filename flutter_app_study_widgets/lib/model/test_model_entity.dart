import '../generated/json/base/json_convert_content.dart';
import '../generated/json/base/json_field.dart';

class TestModelEntity with JsonConvert<TestModelEntity> {
	String? reason;
	TestModelResult? result;
	@JSONField(name: "error_code")
	int? errorCode;
}

class TestModelResult with JsonConvert<TestModelResult> {
	String? stat;
	List<TestModelResultData>? data;
	String? page;
	String? pageSize;
}

class TestModelResultData with JsonConvert<TestModelResultData> {
	String? uniquekey;
	String? title;
	String? date;
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
