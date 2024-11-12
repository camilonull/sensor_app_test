import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensor_app/presentation/providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationAsync = ref.watch(userLocationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicacion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ubicacion Actual',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            userLocationAsync.when(
                data: (data) => Text(
                      'Latitud ${data.$1}, Longitud: ${data.$2}',
                      style: const TextStyle(fontSize: 16),
                    ),
                error: (error, stackTrace) => Text(
                      'Error al obtener la ubicacion: $error',
                      style: const TextStyle(color: Colors.red),
                    ),
                loading: () => const CircularProgressIndicator(),
                
                ),
                const SizedBox(height: 30),
                const Text(
                  'Seguimiento de Ubicacion',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
          ],
        ),
      ),
    );
  }
}
