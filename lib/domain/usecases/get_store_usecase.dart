import '../entities/store.dart';
import '../../data/repositories/store_repository_impl.dart';

class GetStoreUseCase {
  final StoreRepositoryImpl repository;
  GetStoreUseCase(this.repository);

  Future<List<Store>> call() {
    return repository.getStore(limit: 30, offset: 0);
  }
}