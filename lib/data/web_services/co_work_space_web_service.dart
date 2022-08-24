

  import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CoWorkSpaceWebService{

  late Dio dio;
  CoWorkSpaceWebService(){
    BaseOptions baseOptions =BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true ,
      connectTimeout: 20*1000,
      receiveTimeout:20*1000,
    );
    dio =Dio(baseOptions);
  }



  Future<List<dynamic>> getAllCoWorkSpace() async{
    try {
      Response response= await dio.get(baseUrl);
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }

  }


}
