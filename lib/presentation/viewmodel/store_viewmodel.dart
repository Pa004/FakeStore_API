import 'package:flutter/material.dart';
import '../../domain/entities/store.dart';
import '../../domain/usecases/get_store_usecase.dart';

class StoreViewModel extends ChangeNotifier {
  final GetStoreUseCase getStoreUseCase;
  List<Store> products = [];
  bool loading = false;
  String? errorMessage;

  StoreViewModel(this.getStoreUseCase);

  Future<void> loadProducts() async {
    loading = true;
    notifyListeners();

    try {
      products = await getStoreUseCase();
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Error al cargar los productos: $e';
    }

    loading = false;
    notifyListeners();
  }
}

//manejo de estado