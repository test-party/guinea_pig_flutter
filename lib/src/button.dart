import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Button Test'),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Center(
                child: Text(
                  'Testing "button" rule',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text('Default Passing Case'),
            ),
            Center(
              child: FilledButton(
                onPressed: () {},
                child: const Text('I Pass'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                'Case 1: The accessibility label must be unique. This text has the same accessibility label as the "Same" button so it fails the check',
                semanticsLabel: 'I fail due to duplicate label',
              ),
            ),
            Center(
              child: FilledButton(
                onPressed: () {},
                child: const Text(
                  'I fail due to duplicate label',
                  semanticsLabel: 'I fail due to duplicate label',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                'Case 2: Button\'s accessibility label cannot contain the word "button" so this button fails the check',
              ),
            ),
            Center(
              child: FilledButton(
                onPressed: () {},
                child: const Text(
                  'I fail due to "button"',
                  semanticsLabel: 'I fail due to "button"',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}