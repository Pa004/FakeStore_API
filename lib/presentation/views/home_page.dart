import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/store_viewmodel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  void initState() {
    super.initState();

    Future.microtask(() => Provider.of<StoreViewModel>(context, listen: false).loadPokemons());
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<StoreViewModel>(context);
    if(vm.loading) {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator()
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Fake Store')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemCount: vm.products.length,
          itemBuilder: (context, index) {
            final p = vm.products[index];
            return InkWell(
              onTap: () => Navigator.pushNamed(context, "detalle", arguments: p),
              child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(p.image, fit: BoxFit.contain),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Text(p.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Text('\$${p.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.green)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}