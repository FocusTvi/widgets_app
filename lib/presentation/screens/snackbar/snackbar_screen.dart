import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: const Text("Hello World"),
        action: SnackBarAction(
          label: "Click to close it",
          onPressed: () {},
        ),
        duration: const Duration(seconds: 2),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars and Dialogs"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text("Show Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                    context: context,
                    children: [const Text("Click to see the used licenses")]);
              },
              child: const Text("Licenses in use")),
          FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text("Show Dialog")),
        ]),
      ),
    );
  }
}

void openDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("are you sure?"),
        content:
            const Text("If you click here you will accepts the community rules."),
        actions: [
          TextButton(onPressed: ()=>context.pop(), child: const Text("Cancel") ),
          FilledButton(onPressed: ()=>context.pop(), child: const Text("Accept") ),
        ],
        // clipBehavior: Clip.hardEdge,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(10))),
      );
    },
  );
}
