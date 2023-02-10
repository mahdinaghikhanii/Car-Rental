import '../common/app_constans.dart';
import '../common/http_respone_validator.dart';
import '../entity/car_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class IAllCarsDataSource {
  Future<List<CarEntity>> getAllCar();
}

class AllCarsDataSource
    with HttpResponseValidator
    implements IAllCarsDataSource {
  final Dio httpClient;
  AllCarsDataSource(this.httpClient);
  @override
  Future<List<CarEntity>> getAllCar() async {
    Response response = await httpClient.get(AppConstans().allCars);
    validateResponse(response);
    List<CarEntity> carData = [];
    for (var json in (response.data as List)) {
      carData.add(CarEntity.fromJson(json));
    }
    debugPrint(carData[0].toString());
    return carData;
  }
}
