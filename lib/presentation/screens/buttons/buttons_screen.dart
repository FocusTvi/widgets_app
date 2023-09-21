import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevated")),
            const ElevatedButton(
                onPressed: null, child: const Text("Elevated disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.outbond_outlined),
              label: const Text("Elevated Icon"),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text("Filled Icon"),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.outbond_outlined),
              label: const Text("Filled Icon"),
            ),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined button")),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.outbond_outlined),
              label: const Text("Outlined Icon"),
            ),
            TextButton(onPressed: () {}, child: const Text("Text button")),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.outbond_outlined),
              label: const Text("TextButton Icon"),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.abc),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  iconColor: MaterialStatePropertyAll(Colors.white)),
            ),
            const _CustomButton()
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Custom Button"),
          ),
        ),
      ),
    );
  }
}
