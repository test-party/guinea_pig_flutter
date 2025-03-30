import 'package:flutter/material.dart';

class SheetScreen extends StatefulWidget {
  const SheetScreen({super.key});

  @override
  State<SheetScreen> createState() => _SheetsViewState();
}

class _SheetsViewState extends State<SheetScreen> {
  bool isShowingSheet = false;
  bool isShowingBadSheet = false;
  final FocusNode triggerFocusNode = FocusNode();

  final Color darkGreen = const Color.fromRGBO(0, 102, 0, 1);
  final Color darkRed = const Color.fromRGBO(220, 20, 60, 1);

  @override
  void dispose() {
    triggerFocusNode.dispose();
    super.dispose();
  }

  void didDismiss() {
    // Handle the dismissing action and return focus to trigger button
    Future.delayed(const Duration(milliseconds: 100), () {
      triggerFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final goodColor = isDarkMode ? Colors.green : darkGreen;
    final badColor = isDarkMode ? Colors.red : darkRed;

    return Scaffold(
      appBar: AppBar(title: const Text('Sheets')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'VoiceOver focus must move to the sheet when displayed and back to the trigger button when the sheet is closed. Sheet title text must be coded as a Heading for VoiceOver users. Use showModalBottomSheet() to code a native Flutter sheet that receives VoiceOver focus when opened. Use FocusNode to send focus back to the trigger button that opened the sheet when the sheet is closed.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),

              // Good Example Section
              Semantics(
                header: true,
                child: Text(
                  'Good Example',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: goodColor,
                  ),
                ),
              ),
              Divider(height: 2.0, thickness: 2.0, color: goodColor),
              const SizedBox(height: 16),

              Focus(
                focusNode: triggerFocusNode,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.6,
                          minChildSize: 0.3,
                          maxChildSize: 0.9,
                          builder: (context, scrollController) {
                            return SingleChildScrollView(
                              controller: scrollController,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Semantics(
                                      header: true,
                                      child: Text(
                                        'License Agreement',
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.headlineMedium,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        didDismiss();
                                      },
                                      child: const Text('Dismiss'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: const Text('Show License Agreement'),
                ),
              ),

              ExpansionTile(
                title: const Text('Details'),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                children: [
                  Semantics(
                    label: 'Good Example Details',
                    child: Text(
                      'The good sheet example uses showModalBottomSheet() to create a native Flutter sheet that receives screen reader focus when displayed. Additionally, FocusNode is used to send focus back to the trigger button that opened the sheet when the sheet is closed. The sheet title is correctly semantically marked as a heading.',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Bad Example Section
              Semantics(
                header: true,
                child: Text(
                  'Bad Example',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: badColor,
                  ),
                ),
              ),
              Divider(height: 2.0, thickness: 2.0, color: badColor),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isShowingBadSheet = true;
                  });
                },
                child: const Text('Show License Agreement'),
              ),

              if (isShowingBadSheet)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'License Agreement',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isShowingBadSheet = false;
                          });
                        },
                        child: const Text('Dismiss'),
                      ),
                    ],
                  ),
                ),

              ExpansionTile(
                title: const Text('Details'),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                children: [
                  Semantics(
                    label: 'Bad Example Details',
                    child: Text(
                      'The bad sheet example uses a custom view which does not receive VoiceOver focus when displayed and does not return focus when closed. The sheet title is not coded as a heading.',
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
