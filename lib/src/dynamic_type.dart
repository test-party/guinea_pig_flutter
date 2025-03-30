import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DynamicTypeScreen extends StatefulWidget {
  const DynamicTypeScreen({super.key});

  @override
  State<DynamicTypeScreen> createState() => _DynamicTypeScreenState();
}

class _DynamicTypeScreenState extends State<DynamicTypeScreen> {
  TextEditingController emailController = TextEditingController(
    text: "givenname.familyname2@companyname.com"
  );
  
  final Color darkGreen = const Color.fromRGBO(0, 102, 0, 1);
  final Color darkRed = const Color.fromRGBO(220, 20, 60, 1);
  final FocusNode emailFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocus.dispose();
    super.dispose();
  }

  // Helper method to determine if the text scaling is large
  bool get isLargeTextScale => MediaQuery.of(context).textScaleFactor > 1.3;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final goodColor = isDarkMode ? Colors.green : darkGreen;
    final badColor = isDarkMode ? Colors.red : darkRed;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Type'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dynamic Type is used to select text styles that automatically scale to larger sizes in response to the user's system text size settings. In Flutter, use Theme.of(context).textTheme styles like headlineLarge, bodyLarge, etc., or don't specify a specific size to allow text to scale dynamically. Avoid using maxLines which will cause text truncation. Use multiline TextFields to enable values to expand vertically rather than truncate.",
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
                  "Good Example Text with headlineLarge style and multiline TextField",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email Address",
                    style: Theme.of(context).textTheme.headlineLarge,
                    semanticsLabel: "Email Address",
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Semantics(
                  label: "Email Address",
                  child: TextField(
                    controller: emailController,
                    focusNode: emailFocus,
                    style: Theme.of(context).textTheme.headlineLarge,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    maxLines: null, // This allows the field to expand vertically
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkRed,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Signup for newsletter",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
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
                    label: "Good Example Text with headlineLarge style and multiline TextField - details",
                    child: const Text(
                      "The first good dynamic type example uses theme.textTheme.headlineLarge which scales to multiple lines when enlarged. The text field uses maxLines: null to allow values larger than one line to expand vertically.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Second Good Example
              Semantics(
                header: true,
                child: Text(
                  "Good Example Responsive Layout that adjusts based on text size",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              // Conditional layout based on text scale factor
              isLargeTextScale
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => _launchUrl("https://www.example.com/terms"),
                        child: Semantics(
                          label: "Terms of Use",
                          link: true,
                          child: Text(
                            "Terms of Use",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () => _launchUrl("https://www.example.com/privacy"),
                        child: Semantics(
                          label: "Privacy Policy",
                          link: true,
                          child: Text(
                            "Privacy Policy",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      InkWell(
                        onTap: () => _launchUrl("https://www.example.com/terms"),
                        child: Semantics(
                          label: "Terms of Use",
                          link: true,
                          child: Text(
                            "Terms of Use",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("|"),
                      ),
                      InkWell(
                        onTap: () => _launchUrl("https://www.example.com/privacy"),
                        child: Semantics(
                          label: "Privacy Policy",
                          link: true,
                          child: Text(
                            "Privacy Policy",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
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
                    label: "Good Example Responsive Layout that adjusts based on text size - details",
                    child: const Text(
                      "The second good dynamic type example uses conditional layout to display two links in a Row at smaller text sizes or a Column at larger text sizes.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Third Good Example
              Semantics(
                header: true,
                child: Text(
                  "Good Example Text with headlineLarge style",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              Text(
                "Lorem Ipsum",
                style: Theme.of(context).textTheme.headlineLarge,
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
                    label: "Good Example Text with headlineLarge style - details",
                    child: const Text(
                      "The third good dynamic type example uses Theme.of(context).textTheme.headlineLarge which resizes when the user adjusts their system text size settings.",
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
                  "Bad Example Text with maxLines: 1 and single-line TextField",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email Address",
                    style: Theme.of(context).textTheme.headlineLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  style: Theme.of(context).textTheme.headlineLarge,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  // Bad: Using maxLines: 1 which prevents text from expanding vertically
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkRed,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Signup for newsletter",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
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
                    label: "Bad Example Text with maxLines: 1 and single-line TextField - details",
                    child: const Text(
                      "The first bad dynamic type example uses maxLines: 1 which truncates text that grows larger than one line. The text field uses the default single line which causes values larger than one line to truncate.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Second Bad Example
              Semantics(
                header: true,
                child: Text(
                  "Bad Example Row fixed layout",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              // Always horizontal layout regardless of text size
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => _launchUrl("https://www.example.com/terms"),
                    child: Text(
                      "Terms of Use",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("|"),
                  ),
                  InkWell(
                    onTap: () => _launchUrl("https://www.example.com/privacy"),
                    child: Text(
                      "Privacy Policy",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
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
                    label: "Bad Example Row fixed layout - details",
                    child: const Text(
                      "The second bad dynamic type example uses a Row layout to display two links horizontally even at larger text sizes which reduces the readability.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Third Bad Example
              Semantics(
                header: true,
                child: Text(
                  "Bad Example Text with fixed font size",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              Text(
                "Lorem Ipsum",
                style: const TextStyle(fontSize: 30),
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
                    label: "Bad Example Text with fixed font size - details",
                    child: const Text(
                      "The third bad dynamic type example uses a fixed sized font TextStyle(fontSize: 30) which does not resize when the user adjusts their system text size settings.",
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

  void _launchUrl(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}