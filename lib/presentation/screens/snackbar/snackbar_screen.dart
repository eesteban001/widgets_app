import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snakback = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snakback);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Estas segruo?'),
        content: const Text(
          'Labore in commodo laboris aliqua cupidatat esse commodo consequat reprehenderit deserunt deserunt laborum nostrud aliqua. Excepteur culpa culpa reprehenderit deserunt excepteur voluptate laboris ad ex anim. Ullamco nisi esse nulla pariatur aliquip consectetur. Exercitation eu incididunt elit adipisicing.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y Diálogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Adipisicing non amet sit id. Do sit quis do irure nulla aliquip ut nulla reprehenderit ullamco amet do fugiat velit. Fugiat pariatur veniam enim ut veniam officia magna.',
                    ),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton(
              onPressed: () => openDialog(context),
              child: Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
