import 'package:flutter/material.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxesScreenState();
}

class _CheckboxesScreenState extends State<CheckboxScreen> {
  bool isChecked = false;
  bool isEmailChecked = false;
  bool isPhoneChecked = false;
  bool isTextChecked = false;
  bool isCheckedBad = false;
  bool isEmailCheckedBad = false;
  bool isPhoneCheckedBad = false;
  bool isTextCheckedBad = false;

  final Color darkGreen = const Color.fromRGBO(0, 102, 0, 1);
  final Color darkRed = const Color.fromRGBO(220, 20, 60, 1);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final goodColor = isDarkMode ? Colors.green : darkGreen;
    final badColor = isDarkMode ? Colors.red : darkRed;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkboxes')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Flutter has a native checkbox control, but it requires special attention for accessibility. Use Checkbox with MergeSemantics to associate checkbox state with its label. For checkbox groups, use Semantics to provide a group label that matches the visible group label. Ensure that checkboxes announce their checked/unchecked state to screen readers.",
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

              // First Good Example - Single Checkbox
              Semantics(
                header: true,
                child: Text(
                  "Good Example Single Checkbox",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              MergeSemantics(
                child: Row(
                  children: [
                    Semantics(
                      checked: isChecked,
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: const Text("Accept Terms"),
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
                    label: "Good Example Single Checkbox Details",
                    child: const Text(
                      "The good single checkbox example uses MergeSemantics to combine the checkbox and its label into a single accessibility node. The Semantics widget with checked property ensures screen readers announce the checked state correctly.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Second Good Example - Checkbox Group
              Semantics(
                header: true,
                child: Text(
                  "Good Example Checkbox Group",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Preferred contact method(s):"),
              ),

              Semantics(
                label: "Preferred contact method(s):",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MergeSemantics(
                      child: Row(
                        children: [
                          Semantics(
                            checked: isEmailChecked,
                            child: Checkbox(
                              value: isEmailChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isEmailChecked = value ?? false;
                                });
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isEmailChecked = !isEmailChecked;
                              });
                            },
                            child: const Text("Email"),
                          ),
                        ],
                      ),
                    ),
                    MergeSemantics(
                      child: Row(
                        children: [
                          Semantics(
                            checked: isPhoneChecked,
                            child: Checkbox(
                              value: isPhoneChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isPhoneChecked = value ?? false;
                                });
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isPhoneChecked = !isPhoneChecked;
                              });
                            },
                            child: const Text("Phone"),
                          ),
                        ],
                      ),
                    ),
                    MergeSemantics(
                      child: Row(
                        children: [
                          Semantics(
                            checked: isTextChecked,
                            child: Checkbox(
                              value: isTextChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isTextChecked = value ?? false;
                                });
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isTextChecked = !isTextChecked;
                              });
                            },
                            child: const Text("Text"),
                          ),
                        ],
                      ),
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
                    label: "Good Example Checkbox Group Details",
                    child: const Text(
                      "The good checkbox group example uses a parent Semantics widget with a label that matches the visible group heading. This ensures screen reader users hear the group label when navigating to any checkbox within the group.",
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

              // First Bad Example - Single Checkbox
              Semantics(
                header: true,
                child: Text(
                  "Bad Example Single Checkbox",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCheckedBad = !isCheckedBad;
                      });
                    },
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: const Text("Accept Terms"),
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
                    label: "Bad Example Single Checkbox Details",
                    child: const Text(
                      "The bad single checkbox example uses a TextButton with an icon that changes when tapped. This doesn't properly communicate the checkbox state to screen readers, as it's announced only as a button without indicating its checked/unchecked state.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Second Bad Example - Checkbox Group
              Semantics(
                header: true,
                child: Text(
                  "Bad Example Checkbox Group",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Preferred contact method(s):"),
              ),

              // No semantics group wrapper
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isEmailCheckedBad,
                        onChanged: (bool? value) {
                          setState(() {
                            isEmailCheckedBad = value ?? false;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isEmailCheckedBad = !isEmailCheckedBad;
                          });
                        },
                        child: const Text("Email"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isPhoneCheckedBad,
                        onChanged: (bool? value) {
                          setState(() {
                            isPhoneCheckedBad = value ?? false;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isPhoneCheckedBad = !isPhoneCheckedBad;
                          });
                        },
                        child: const Text("Phone"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isTextCheckedBad,
                        onChanged: (bool? value) {
                          setState(() {
                            isTextCheckedBad = value ?? false;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isTextCheckedBad = !isTextCheckedBad;
                          });
                        },
                        child: const Text("Text"),
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
                    label: "Bad Example Checkbox Group Details",
                    child: const Text(
                      "The bad checkbox group example lacks a parent Semantics widget with a group label. Screen reader users won't hear the group heading when navigating to checkboxes in this group. Also, each checkbox lacks the MergeSemantics wrapper to properly associate the label with the checkbox.",
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
