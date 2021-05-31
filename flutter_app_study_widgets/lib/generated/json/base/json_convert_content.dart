// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_app_study_widgets/app_dio_net_request_entity.dart';
import 'package:flutter_app_study_widgets/generated/json/app_dio_net_request_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case AppDioNetRequestEntity:
				return appDioNetRequestEntityFromJson(data as AppDioNetRequestEntity, json) as T;
			case AppDioNetRequestResult:
				return appDioNetRequestResultFromJson(data as AppDioNetRequestResult, json) as T;
			case AppDioNetRequestResultData:
				return appDioNetRequestResultDataFromJson(data as AppDioNetRequestResultData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case AppDioNetRequestEntity:
				return appDioNetRequestEntityToJson(data as AppDioNetRequestEntity);
			case AppDioNetRequestResult:
				return appDioNetRequestResultToJson(data as AppDioNetRequestResult);
			case AppDioNetRequestResultData:
				return appDioNetRequestResultDataToJson(data as AppDioNetRequestResultData);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (AppDioNetRequestEntity).toString()){
			return AppDioNetRequestEntity().fromJson(json);
		}	else if(type == (AppDioNetRequestResult).toString()){
			return AppDioNetRequestResult().fromJson(json);
		}	else if(type == (AppDioNetRequestResultData).toString()){
			return AppDioNetRequestResultData().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<AppDioNetRequestEntity>[] is M){
			return data.map<AppDioNetRequestEntity>((e) => AppDioNetRequestEntity().fromJson(e)).toList() as M;
		}	else if(<AppDioNetRequestResult>[] is M){
			return data.map<AppDioNetRequestResult>((e) => AppDioNetRequestResult().fromJson(e)).toList() as M;
		}	else if(<AppDioNetRequestResultData>[] is M){
			return data.map<AppDioNetRequestResultData>((e) => AppDioNetRequestResultData().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}