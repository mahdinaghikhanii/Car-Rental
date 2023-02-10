import '../data/common/app_constans.dart';
import 'package:dio/dio.dart';

final httpClient = Dio(BaseOptions(baseUrl: AppConstans().baseUrl));
