import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _SteppersScreenState();
}

class _SteppersScreenState extends State<StepperScreen> {
  int copies = 1;
  int tickets = 1;
  
  final TextEditingController _copiesController = TextEditingController(text: '1');
  final FocusNode _inputFocusNode = FocusNode();
  
  final Color darkGreen = const Color.fromRGBO(0, 102, 0, 1);
  final Color darkRed = const Color.fromRGBO(220, 20, 60, 1);

  @override
  void dispose() {
    _copiesController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final goodColor = isDarkMode ? Colors.green : darkGreen;
    final badColor = isDarkMode ? Colors.red : darkRed;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Steppers'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Steppers are used to increase or decrease incremental values. Use labeled Steppers to create a visible label that becomes the accessibility label for screen reader users.",
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
              Divider(
                height: 2.0,
                thickness: 2.0,
                color: goodColor,
              ),
              const SizedBox(height: 16),
              
              // First Good Example
              Semantics(
                header: true,
                child: Text(
                  "Good Example Stepper with Text label",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              Semantics(
                label: "Tickets: $tickets",
                value: tickets.toString(),
                increasedValue: "${tickets + 1}",
                decreasedValue: "${tickets - 1}",
                onIncrease: () {
                  setState(() {
                    tickets++;
                  });
                },
                onDecrease: () {
                  setState(() {
                    if (tickets > 1) tickets--;
                  });
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Tickets: $tickets"),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: tickets > 1 
                          ? () {
                              setState(() {
                                tickets--;
                              });
                            }
                          : null,
                      tooltip: "Decrease tickets",
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          tickets++;
                        });
                      },
                      tooltip: "Increase tickets",
                    ),
                  ],
                ),
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
                    label: "Good Example Stepper with Text label - details",
                    child: const Text(
                      "The first good Stepper example uses a visible label 'Tickets: X' which also serves as the screen reader accessibility label.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Second Good Example
              Semantics(
                header: true,
                child: Text(
                  "Good Example with TextField and accessibility label",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              Row(
                children: [
                  const Text("Copies"),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 60,
                    child: Semantics(
                      label: "Copies",
                      value: copies.toString(),
                      textField: true,
                      child: TextField(
                        controller: _copiesController,
                        focusNode: _inputFocusNode,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            final newValue = int.tryParse(value) ?? copies;
                            if (newValue >= 1) {
                              setState(() {
                                copies = newValue;
                              });
                            }
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Semantics(
                    label: "Copies",
                    value: copies.toString(),
                    increasedValue: "${copies + 1}",
                    decreasedValue: "${copies - 1}",
                    onIncrease: () {
                      setState(() {
                        copies++;
                        _copiesController.text = copies.toString();
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        if (copies > 1) {
                          copies--;
                          _copiesController.text = copies.toString();
                        }
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: copies > 1 
                              ? () {
                                  setState(() {
                                    copies--;
                                    _copiesController.text = copies.toString();
                                  });
                                }
                              : null,
                          tooltip: "Decrease copies",
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              copies++;
                              _copiesController.text = copies.toString();
                            });
                          },
                          tooltip: "Increase copies",
                        ),
                      ],
                    ),
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
                    label: "Good Example with TextField and accessibility label - details",
                    child: const Text(
                      "The second good Stepper example includes a text field so that users can quickly enter a large value, e.g., 50 copies. The Stepper uses Semantics(label: 'Copies') to create an accessibility label for screen readers.",
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
              Divider(
                height: 2.0,
                thickness: 2.0,
                color: badColor,
              ),
              const SizedBox(height: 16),
              
              // First Bad Example
              Semantics(
                header: true,
                child: Text(
                  "Bad Example Stepper with no Text label",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              Row(
                children: [
                  Expanded(
                    child: Text("Tickets: $tickets"),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: tickets > 1 
                            ? () {
                                setState(() {
                                  tickets--;
                                });
                              }
                            : null,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            tickets++;
                          });
                        },
                      ),
                    ],
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
                    label: "Bad Example Stepper with no Text label - details",
                    child: const Text(
                      "The first bad Stepper example has no accessibility labels for the stepper controls, so there are no labels read to screen reader users.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Second Bad Example
              Semantics(
                header: true,
                child: Text(
                  "Bad Example no label text, no accessibility label, and no TextField",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              Row(
                children: [
                  Expanded(
                    child: Text("Copies: $copies"),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: copies > 1 
                            ? () {
                                setState(() {
                                  copies--;
                                });
                              }
                            : null,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            copies++;
                          });
                        },
                      ),
                    ],
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
                    label: "Bad Example no label text, no accessibility label, and no TextField - details",
                    child: const Text(
                      "The second bad Stepper example has no text field for users to quickly enter a large value, e.g., 50 copies. The Stepper has no accessibility labels for screen reader users.",
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