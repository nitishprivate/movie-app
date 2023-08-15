import 'package:dio/dio.dart';
import 'package:get/get.dart' show GetxController;

class ApiConnectorController extends GetxController {
  late Dio dio;
  String accessToken =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ODgwZGU3OTU1M2M2ZDUwODc0Yjk1M2M5OTdjZmFlMiIsInN1YiI6IjY0ZGI1MjY2NzcxOWQ3MDEyMjYwYzEzNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vNwBGUZmrxnsq4WhcHOjuseuJlGZFFCOhqxTvs2q48w";

  @override
  void onInit() {
    dio = Dio();
    super.onInit();
  }

  Future<ApiResponse?> getMethodApiCall(String url) async {
    ApiResponse? apiResponse;
    try {
      Response<dynamic> dataResp = await dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": accessToken,
            "accept": "application/json",
          },
          responseType: ResponseType.json,
        ),
      );
      if (dataResp.statusCode == 200) {
        apiResponse = ApiResponse(true, data: dataResp.data);
      } else if (dataResp.statusCode == 401) {
        apiResponse = ApiResponse(false, msg: "You are unauthorize");
      } else {
        apiResponse = ApiResponse(false, msg: dataResp.data.toString());
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && (e.message?.contains("401") ?? false)) {
        apiResponse = ApiResponse(false, msg: 'You are Unauthorize to acces this API.');
      }
      if (e.type == DioExceptionType.badResponse && (e.message?.contains("404") ?? false)) {
        apiResponse = ApiResponse(false, msg: 'API not found.');
      } else {
        apiResponse = ApiResponse(false, msg: e.message);
      }
    } catch (e) {
      apiResponse = ApiResponse(false, msg: e.toString());
    }
    return apiResponse;
  }
}

class ApiResponse {
  final bool status;
  final dynamic data;
  final String? msg;

  ApiResponse(this.status, {this.data, this.msg});
}
