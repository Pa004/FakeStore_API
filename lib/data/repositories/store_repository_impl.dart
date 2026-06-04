import '../../domain/entities/store.dart';
import '../datasource/storeapi_datasource.dart';

class StoreRepositoryImpl {
  final StoreApiDataSource dataSource;
  StoreRepositoryImpl(this.dataSource);

  Future<List<Store>> getStore({int limit = 30, int offset = 0}) async {
    return dataSource.fetchStore(limit, offset);
  }
}