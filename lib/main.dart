import 'package:flutter/material.dart';
import 'src/button.dart';
import 'src/checkbox.dart';
import 'src/date_picker.dart';
import 'src/images.dart';
import 'src/link.dart';
import 'src/progress_indicator.dart';
import 'src/sheet.dart';
import 'src/slider.dart';
import 'src/stepper.dart';
import 'src/dynamic_type.dart';
import 'src/text_input.dart';
import 'src/video.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guinea Pig Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Placeholder functions for button clicks
  void _onOpenButtonScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ButtonScreen()),
    );
  }

  void _onOpenCheckboxScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CheckboxScreen()),
    );
  }

  void _onOpenDatePickerScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DatePickerScreen()),
    );
  }

  void _onOpenDynamicTypeScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DynamicTypeScreen()),
    );
  }

  void _onOpenImageScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImageScreen()),
    );
  }

  void _onOpenLinkScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LinkScreen()),
    );
  }

  void _onOpenProgressIndicatorScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProgressIndicatorScreen()),
    );
  }

  void _onOpenSheetScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SheetScreen()),
    );
  }

  void _onOpenSliderScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SliderScreen()),
    );
  }

  void _onOpenStepperScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StepperScreen()),
    );
  }

  void _onOpenTextInputScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TextInputScreen()),
    );
  }

  void _onOpenVideoScreenClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => const VideoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Guinea Pig Flutter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenButtonScreenClicked,
                child: const Text('Button Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenCheckboxScreenClicked,
                child: const Text('Checkbox Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenDatePickerScreenClicked,
                child: const Text('Date Picker Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenDynamicTypeScreenClicked,
                child: const Text('Dynamic Type Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenImageScreenClicked,
                child: const Text('Image Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenLinkScreenClicked,
                child: const Text('Link Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenProgressIndicatorScreenClicked,
                child: const Text('Progress Indicator Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenSheetScreenClicked,
                child: const Text('Sheet Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenSliderScreenClicked,
                child: const Text('Slider Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenStepperScreenClicked,
                child: const Text('Stepper Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenTextInputScreenClicked,
                child: const Text('Text Input Test'),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _onOpenVideoScreenClicked,
                child: const Text('Video Test'),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
