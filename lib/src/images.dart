import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Image Test'),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Center(
                  child: Text(
                    'Testing "image-alt" rule',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text('Default Passing Case'),
              ),
              Center(
                child: Image.asset(
                  'assets/images/favicon.png',
                  width: 100,
                  height: 100,
                  semanticLabel: 'Image-Alt-Text-Description Passing',
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text('Fail Case: missing accessibilityLabel'),
              ),
              Center(
                child: Image.asset(
                  'assets/images/react-logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text('Fail Case: has the word "image" in the accessibilityLabel'),
              ),
              Center(
                child: Image.asset(
                  'assets/images/favicon.png',
                  width: 100,
                  height: 100,
                  semanticLabel: 'Image of ... Alt-Text-Description',
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text('Fail Case: has the word "icon" in the accessibilityLabel'),
              ),
              Center(
                child: Image.asset(
                  'assets/images/favicon.png',
                  width: 100,
                  height: 100,
                  semanticLabel: 'Icon of ... Alt-Text-Description',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}