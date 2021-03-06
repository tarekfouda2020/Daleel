part of 'DioImports.dart';

class DioHelper {
  late Dio _dio;
  late DioCacheManager _manager;
  BuildContext context;
  final bool forceRefresh;
  final baseUrl = "https://api.dileel.com/";

  DioHelper({this.forceRefresh = true,required this.context}){
    _dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          contentType: "application/x-www-form-urlencoded; charset=utf-8"),
    )
      ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(responseBody: true,requestBody: true));
  }

  DioCacheManager _getCacheManager() {
    _manager = DioCacheManager(
        CacheConfig(baseUrl: baseUrl, defaultRequestMethod: "POST"));
    return _manager;
  }

  Options _buildCacheOptions(String url) {
    return buildCacheOptions(
      Duration(days: 3),
      maxStale: Duration(days: 7),
      forceRefresh: forceRefresh,
      primaryKey: url,
      options: Options(extra: {}),
    );
  }

  Future<dynamic> get({required String url,bool allLang = false}) async {
    var lang = allLang?"all":context.read<LangCubit>().state.locale.languageCode;
    _dio.options.headers = await _getHeader(langType: lang);
    try {
      var response = await _dio.get("$baseUrl$url", options: _buildCacheOptions(url+lang));
      print("response ${response.statusCode}");
      var data = response.data;
      return data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 301|| e.response?.statusCode == 302) {
        logout();
      } else {
        LoadingDialog.showToastNotification(tr(context, "chickNet"));
      }
    }
    return null;
  }

  Future<dynamic> post({required String url,required Map<String, dynamic> body,bool showLoader = true,bool update = false}) async {
    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();
    try {
      late Response response ;
      if (update) {
        response = await _dio.put("$baseUrl$url", data: body);
      }else{
        response = await _dio.post("$baseUrl$url", data: body);
      }
      print("response ${response.statusCode}");
      if (showLoader) EasyLoading.dismiss();
       return response.data;
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      if (e.response?.statusCode == 301|| e.response?.statusCode == 302) {
        logout();
      } else {
        LoadingDialog.showToastNotification(e.response?.data?["message"]??tr(context, "chickNet"));
      }
    }

    return null;
  }

  Future<dynamic> uploadFile({required String url, required Map<String, dynamic> body,bool showLoader = true,bool update = false}) async {
    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          "$key",
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              "$key",
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });
    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method
    try {
      late Response response ;
      if (update) {
        response = await _dio.put("$baseUrl$url", data: formData);
      } else{
        response = await _dio.post("$baseUrl$url", data: formData);
      }
      print("response ${response.statusCode}");
      if (showLoader) EasyLoading.dismiss();
      return response.data;
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      LoadingDialog.showToastNotification(
          "${e.response?.data["message"] ?? tr(context,"chickNet")}");
    }

    return null;
  }

  Future<dynamic> uploadChatFile(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          "$key",
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              "$key",
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post("$baseUrl$url", data: formData);
      print("response ${response.statusCode}");
      if (showLoader) EasyLoading.dismiss();
      if (response.data["key"] == 1) return response.data;
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      if (e.response?.statusCode == 401 || e.response?.statusCode == 301|| e.response?.statusCode == 302) {
        tokenExpired();
      } else {
        LoadingDialog.showToastNotification("???????? ???? ?????????????? ??????????????????");
      }
    }

    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    print(
        "-------------------------------------------------------------------");
    print(body);
    print(
        "-------------------------------------------------------------------");
  }

  _getHeader({String? langType}) async {
    String? token = GlobalState.instance.get("token");
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var guest = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1ZTA3NWY4ZTcwYmRhYjFjMWQ5ODY0NGYiLCJtb2JpbGUiOiIrMSIsInJvbGVzIjpbImd1ZXN0Il0sImlhdCI6MTU3NzU0MTUxOH0.zVuWocacWCwQchx2ULTsEomaAdJFvVBFMwdj83XKY54";
    return {
      'Accept': 'application/json',
      'Authorization': '${token??guest}',
      'content-language': langType??'$lang',
    };
  }

  Future<void> logout() async {
    Utils.clearSavedData();
    AutoRouter.of(context).popAndPush(LoginRoute());
  }

  void tokenExpired() {
    Utils.clearSavedData();
    AutoRouter.of(context).popAndPush(LoginRoute());
  }
}
