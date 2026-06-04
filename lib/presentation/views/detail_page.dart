import 'package:flutter/material.dart';
import '../../domain/entities/store.dart';

class DetallePage extends StatelessWidget {
  const DetallePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibimos el producto desde los argumentos de la ruta
    final Store product = ModalRoute.of(context)!.settings.arguments as Store;

    return Scaffold(
      backgroundColor: Colors.grey[50], // Fondo sutilmente gris para contraste
      appBar: AppBar(
        title: const Text(
          'Detalle del Producto',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Área con scroll para el contenido del producto
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Contenedor de la Imagen principal con diseño Full Width / Rounded
                  Container(
                    width: double.infinity,
                    height: 320,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                    child: Hero(
                      tag: 'product_image_${product.id}', // Por si decides añadir animación Hero después
                      child: Image.network(
                        product.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // 2. Información del Producto
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Identificador estilizado como Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'PRODUCTO ID: ${product.id}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue[800],
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Título del Producto
                        Text(
                          product.title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Precio Destacado
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Separador sutil
                        const Divider(height: 1, thickness: 1, color: Colors.black12),
                        const SizedBox(height: 20),

                        // Etiqueta de Sección "Descripción"
                        const Text(
                          'Acerca de este artículo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Cuerpo de la Descripción
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. Barra de Acción Inferior Fija (Añade mucho valor visual y UX)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  // Acción simulada de agregar al carrito o comprar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.title} añadido al carrito')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Añadir al Carrito',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}