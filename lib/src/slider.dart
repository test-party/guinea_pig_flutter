import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SliderScreen> {
  double speedGood = 50.0;
  double speedBad = 50.0;
  double brightnessGood = 100.0;
  double brightnessBad = 100.0;

  final Color darkGreen = const Color.fromRGBO(0, 102, 0, 1);
  final Color darkRed = const Color.fromRGBO(220, 20, 60, 1);

  final TextEditingController _speedController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _speedController.text = speedGood.round().toString();
  }

  @override
  void dispose() {
    _speedController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final goodColor = isDarkMode ? Colors.green : darkGreen;
    final badColor = isDarkMode ? Colors.red : darkRed;

    return Scaffold(
      appBar: AppBar(title: const Text('Sliders')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sliders are used to adjust a value by sliding the thumb between the minimum and maximum. Use Slider to create a native slider control that is adjustable with screen readers. Give each Slider a unique and meaningful accessibility label and visible label text. Include a TextField and steppers to allow users fine control when adjusting the slider value. Provide buttons as single tap alternatives to adjusting the slider with gestures.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),

              // Good Examples Section
              Semantics(
                header: true,
                child: Text(
                  "Good Examples",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: goodColor,
                  ),
                ),
              ),
              Divider(height: 2.0, thickness: 2.0, color: goodColor),
              const SizedBox(height: 16),

              // First Good Example
              Semantics(
                header: true,
                child: Text(
                  "Good Example with label text, semantics label, and single tap gesture alternatives",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Brightness"),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (brightnessGood > 0) {
                        setState(() {
                          brightnessGood -= 10;
                        });
                      }
                    },
                    icon: const Icon(Icons.brightness_low),
                    tooltip: "Decrease Brightness",
                  ),
                  Expanded(
                    child: Semantics(
                      label: "Brightness",
                      value: "${brightnessGood.round()}",
                      child: Slider(
                        value: brightnessGood,
                        min: 0,
                        max: 100,
                        divisions: 10,
                        onChanged: (value) {
                          setState(() {
                            brightnessGood = value;
                          });
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (brightnessGood < 100) {
                        setState(() {
                          brightnessGood += 10;
                        });
                      }
                    },
                    icon: const Icon(Icons.brightness_high),
                    tooltip: "Increase Brightness",
                  ),
                ],
              ),

              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                children: [
                  Semantics(
                    label:
                        "Good Example with label text, semantics label, and single tap gesture alternatives - details",
                    child: const Text(
                      "The first good slider example uses visible 'Brightness' text as the label and Semantics(label: 'Brightness') for screen readers. Buttons are used as single tap alternatives to adjusting the slider with a gesture.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Second Good Example
              Semantics(
                header: true,
                child: Text(
                  "Good Example Slider with TextField and steppers",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  const Text("Speed"),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 60,
                    child: Semantics(
                      label: "Speed",
                      child: TextField(
                        controller: _speedController,
                        focusNode: _inputFocusNode,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            final newValue =
                                double.tryParse(value) ?? speedGood;
                            if (newValue >= 0 && newValue <= 100) {
                              setState(() {
                                speedGood = newValue;
                              });
                            }
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Semantics(
                        label: "Decrease Speed",
                        button: true,
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (speedGood > 0) {
                              setState(() {
                                speedGood--;
                                _speedController.text =
                                    speedGood.round().toString();
                              });
                            }
                          },
                        ),
                      ),
                      Semantics(
                        label: "Increase Speed",
                        button: true,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            if (speedGood < 100) {
                              setState(() {
                                speedGood++;
                                _speedController.text =
                                    speedGood.round().toString();
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  const Text("0"),
                  Expanded(
                    child: Semantics(
                      label: "Speed",
                      value: "${speedGood.round()}",
                      child: Slider(
                        value: speedGood,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        onChanged: (value) {
                          setState(() {
                            speedGood = value;
                            _speedController.text = value.round().toString();
                          });
                        },
                      ),
                    ),
                  ),
                  const Text("100"),
                ],
              ),

              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                children: [
                  Semantics(
                    label:
                        "Good Example Slider with TextField and steppers - details",
                    child: const Text(
                      "The second good slider example uses visible label text as well as minimum and maximum value labels. A TextField and steppers are included to allow users to see the exact value and have fine control when adjusting the value. The Slider uses Semantics(label: 'Speed') for screen readers.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Bad Examples Section
              Semantics(
                header: true,
                child: Text(
                  "Bad Examples",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: badColor,
                  ),
                ),
              ),
              Divider(height: 2.0, thickness: 2.0, color: badColor),
              const SizedBox(height: 16),

              // First Bad Example
              Semantics(
                header: true,
                child: Text(
                  "Bad Example no label text or semantics label and no single tap gesture alternatives",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              Slider(
                value: brightnessBad,
                min: 0,
                max: 100,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    brightnessBad = value;
                  });
                },
              ),

              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                children: [
                  Semantics(
                    label:
                        "Bad Example no label text or semantics label and no single tap gesture alternatives - details",
                    child: const Text(
                      "The first bad slider example uses no visible label text and no screen reader accessibility label. There are no single tap alternatives to adjusting the slider with a gesture.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Second Bad Example
              Semantics(
                header: true,
                child: Text(
                  "Bad Example no label, no semantics label, no TextField, no steppers",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              Text("${speedBad.round()}"),
              Row(
                children: [
                  const Text("0"),
                  Expanded(
                    child: Slider(
                      value: speedBad,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      onChanged: (value) {
                        setState(() {
                          speedBad = value;
                        });
                      },
                    ),
                  ),
                  const Text("100"),
                ],
              ),

              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                children: [
                  Semantics(
                    label:
                        "Bad Example no label, no semantics label, no TextField, no steppers - details",
                    child: const Text(
                      "The second bad slider example uses no label text and no accessibility label for screen readers. Users can see the slider value but there is no TextField or steppers included to allow fine control.",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
