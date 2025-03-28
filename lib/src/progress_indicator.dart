import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class ProgressIndicatorScreen extends StatefulWidget {
  const ProgressIndicatorScreen({super.key});

  @override
  State<ProgressIndicatorScreen> createState() => _ProgressIndicatorScreenState();
}

class _ProgressIndicatorScreenState extends State<ProgressIndicatorScreen> {
  bool progressIndicatorGoodVisible = false;
  bool progressIndicatorBadVisible = false;
  double progress = 0.8;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final darkGreen = const Color.fromRGBO(0, 102, 0, 1);
    final darkRed = const Color.fromRGBO(220, 20, 60, 1);
    
    final goodColor = isDarkMode ? Colors.green : darkGreen;
    final badColor = isDarkMode ? Colors.red : darkRed;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Progress Indicators'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Progress indicators are used to show page loading status or the progress of a task. "
                "Create progress indicators with visible label text. Post an accessibility announcement "
                "speaking the loading indicator text to screen readers when displaying page loading indicators.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              
              // Good Examples section
              Text(
                "Good Examples",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: goodColor,
                ),
                semanticsLabel: "Good Examples header",
              ),
              Divider(
                height: 2,
                thickness: 2,
                color: goodColor,
              ),
              const SizedBox(height: 16),
              
              Text(
                "Good Example ProgressIndicator with label and accessibility announcement",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                semanticsLabel: "Good Example ProgressIndicator with label and accessibility announcement header",
              ),
              
              // First Good Example
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (progressIndicatorGoodVisible)
                    Semantics(
                      label: "Updating your information",
                      child: Column(
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 8),
                          Text(
                            "Updating your information",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        progressIndicatorGoodVisible = true;
                      });
                      
                      // Announce to screen readers
                      Future.delayed(const Duration(milliseconds: 100), () {
                        SemanticsService.announce(
                          "Updating your information",
                          TextDirection.ltr,
                        );
                      });
                      
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          progressIndicatorGoodVisible = false;
                        });
                      });
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
              
              // Details Expandable Section
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.all(16),
                children: [
                  Text(
                    "The first good progress indicator example announces the indicator text \"Updating your information\" "
                    "to screen readers when the progress view displays. The announcement is posted with a 0.1 second "
                    "delay to make it speak correctly. The ProgressIndicator uses appropriate styling for sufficient contrast.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Second Good Example
              Text(
                "Good Example ProgressIndicator with label",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                semanticsLabel: "Good Example ProgressIndicator with label header",
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Downloading Purchase Receipt"),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(value: 0.2),
                    const SizedBox(height: 4),
                    Text("20%", style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.all(16),
                children: [
                  Text(
                    "The second good progress indicator example uses visible label text.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Bad Examples Section
              Text(
                "Bad Examples",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: badColor,
                ),
                semanticsLabel: "Bad Examples header",
              ),
              
              Divider(
                height: 2,
                thickness: 2,
                color: badColor,
              ),
              
              const SizedBox(height: 16),
              
              // First Bad Example
              Text(
                "Bad Example ProgressIndicator no label, no accessibility announcement",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                semanticsLabel: "Bad Example ProgressIndicator no label, no accessibility announcement header",
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (progressIndicatorBadVisible)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        progressIndicatorBadVisible = true;
                      });
                      
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          progressIndicatorBadVisible = false;
                        });
                      });
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
              
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.all(16),
                children: [
                  Text(
                    "The first bad progress indicator example does not announce to screen readers when the progress "
                    "view displays. There is no label text for the progress view and no accessibility label for screen readers.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Second Bad Example
              Text(
                "Bad Example ProgressIndicator no label text or accessibility label",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                semanticsLabel: "Bad Example ProgressIndicator no label text or accessibility label header",
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: LinearProgressIndicator(value: 0.2),
              ),
              
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.all(16),
                children: [
                  Text(
                    "The second bad progress indicator example has no visible label text and no accessibility label for screen readers.",
                    style: Theme.of(context).textTheme.bodyMedium,
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