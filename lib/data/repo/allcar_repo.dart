import '../../common/http_client.dart';
import '../entity/car_entity.dart';
import '../source/allcar_data_source.dart';

final homeRepository = AllCarRepository(AllCarsDataSource(httpClient));

abstract class IAllCarRepository {
  Future<List<CarEntity>> getAllCar();
}

class AllCarRepository implements IAllCarRepository {
  final AllCarsDataSource carsDataSource;
  AllCarRepository(this.carsDataSource);
  @override
  Future<List<CarEntity>> getAllCar() {
    return carsDataSource.getAllCar();
  }
}
