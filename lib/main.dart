import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasource/storeapi_datasource.dart';
import 'data/repositories/store_repository_impl.dart';
import 'domain/usecases/get_store_usecase.dart';
import 'presentation/viewmodel/store_viewmodel.dart';
import 'presentation/routes/app_routes.dart';

void main() {
  // Inyección de dependencias manual (Clean Architecture)
  final datasource = StoreApiDataSource(); // Conexión a Fake Store API
  final repository = StoreRepositoryImpl(datasource); // Repositorio intermedio
  final usecase = GetStoreUseCase(repository); // Caso de uso

  runApp(MyApp(usecase: usecase));
}

class MyApp extends StatelessWidget {
  final GetStoreUseCase usecase;

  const MyApp({super.key, required this.usecase});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StoreViewModel(usecase),
        ),
      ],
      child: MaterialApp(
        title: 'Fake Store',
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes(),
        initialRoute: "/",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
        ),
      ),
    );
  }
}