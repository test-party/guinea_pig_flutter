// links_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkScreen extends StatelessWidget {
  const LinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final darkGreen = const Color.fromRGBO(0, 102, 0, 1.0);
    final darkRed = const Color.fromRGBO(220, 20, 60, 1.0);

    final goodColor = isDarkMode ? Colors.green : darkGreen;
    final badColor = isDarkMode ? Colors.red : darkRed;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Link Test'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Links are used to open a URL in the user's web browser. The \"Link\" trait indicates to screen readers that it will exit the app and open in their web browser. Link text must be specific to its purpose. Link text style must be discernable without using color alone when placed inline with static text, e.g. using underline. Link text color must have 4.5:1 contrast ratio in light and dark modes.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),

              // Good Examples Section
              Text(
                "Good Examples",
                style: TextStyle(fontWeight: FontWeight.bold, color: goodColor),
                semanticsLabel: "Good Examples header",
              ),
              Divider(thickness: 2.0, color: goodColor),
              const SizedBox(height: 16),

              // Good Example 1: Standalone Link
              const Text(
                "Good Example Standalone Link",
                style: TextStyle(fontWeight: FontWeight.bold),
                semanticsLabel: "Good Example Standalone Link header",
              ),
              InkWell(
                onTap: () => _launchUrl("https://www.example.com/weekly-ad"),
                child: Text(
                  "View Weekly Ad",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The good standalone link example is correctly coded with appropriate semantics. The color contrast is adequate for light and dark appearance. The link is made visually distinct with an underline.",
                  ),
                ],
              ),

              // Good Example 2: Inline Links
              const Text(
                "Good Example Inline Links",
                style: TextStyle(fontWeight: FontWeight.bold),
                semanticsLabel: "Good Example Inline Links header",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("To get started "),
                  InkWell(
                    onTap: () => _launchUrl("https://www.example.com/login"),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Text(" or "),
                  InkWell(
                    onTap:
                        () => _launchUrl(
                          "https://www.example.com/create-account",
                        ),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The good inline links example uses unique and specific link text. Underline is used to make the inline links visually distinct without using color alone. The links have sufficient color contrast in both light and dark themes.",
                  ),
                ],
              ),

              // Good Example 3: Rich Text Inline Links
              const Text(
                "Good Example Rich Text Inline Links",
                style: TextStyle(fontWeight: FontWeight.bold),
                semanticsLabel: "Good Example Rich Text Inline Links header",
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(text: "To get started "),
                    WidgetSpan(
                      child: InkWell(
                        onTap:
                            () => _launchUrl("https://www.example.com/login"),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const TextSpan(text: " or "),
                    WidgetSpan(
                      child: InkWell(
                        onTap:
                            () => _launchUrl(
                              "https://www.example.com/create-account",
                            ),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const TextSpan(text: ". "),
                    WidgetSpan(
                      child: InkWell(
                        onTap:
                            () => _launchUrl("https://www.example.com/contact"),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const TextSpan(text: " if you need help."),
                  ],
                ),
              ),
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The good rich text inline links example uses RichText to properly style links with underlines. The links have good contrast and use descriptive link text.",
                  ),
                ],
              ),

              // Bad Examples Section
              const SizedBox(height: 16),
              Text(
                "Bad Examples",
                style: TextStyle(fontWeight: FontWeight.bold, color: badColor),
                semanticsLabel: "Bad Examples header",
              ),
              Divider(thickness: 2.0, color: badColor),
              const SizedBox(height: 16),

              // Bad Example 1: Standalone Link
              const Text(
                "Bad Example Standalone Link",
                style: TextStyle(fontWeight: FontWeight.bold),
                semanticsLabel: "Bad Example Standalone Link header",
              ),
              ElevatedButton(
                onPressed:
                    () => _launchUrl("https://www.example.com/weekly-ad"),
                child: const Text("View Weekly Ad"),
              ),
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The bad standalone link example is incorrectly coded as a Button element which would speak a 'Button' trait to screen readers rather than a 'Link' trait. The link appearance doesn't properly indicate it will open a URL.",
                  ),
                ],
              ),

              // Bad Example 2: Inline Links
              const Text(
                "Bad Example Inline Links",
                style: TextStyle(fontWeight: FontWeight.bold),
                semanticsLabel: "Bad Example Inline Links header",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => _launchUrl("https://www.example.com/login"),
                    child: Text(
                      "Click here",
                      style: TextStyle(color: Colors.blue.shade700),
                    ),
                  ),
                  const Text(" to login, or "),
                  InkWell(
                    onTap:
                        () => _launchUrl(
                          "https://www.example.com/create-account",
                        ),
                    child: Text(
                      "here",
                      style: TextStyle(color: Colors.blue.shade700),
                    ),
                  ),
                  const Text(" to create account."),
                ],
              ),
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The bad inline links example uses generic link text 'Click here' and 'here' and the links are not underlined to be visually distinct without using color alone. The links also use a color with insufficient contrast ratio.",
                  ),
                ],
              ),

              // Bad Example 3: Rich Text Links
              const Text(
                "Bad Example Rich Text Links",
                style: TextStyle(fontWeight: FontWeight.bold),
                semanticsLabel: "Bad Example Rich Text Links header",
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(text: "To get started "),
                    WidgetSpan(
                      child: InkWell(
                        onTap:
                            () => _launchUrl("https://www.example.com/login"),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                      ),
                    ),
                    const TextSpan(text: " or "),
                    WidgetSpan(
                      child: InkWell(
                        onTap:
                            () => _launchUrl(
                              "https://www.example.com/create-account",
                            ),
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                      ),
                    ),
                    const TextSpan(text: ". "),
                    WidgetSpan(
                      child: InkWell(
                        onTap:
                            () => _launchUrl("https://www.example.com/contact"),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(color: Colors.blue.shade700),
                        ),
                      ),
                    ),
                    const TextSpan(text: " if you need help."),
                  ],
                ),
              ),
              ExpansionTile(
                title: const Text("Details"),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The bad rich text links example uses links without underlines and with insufficient color contrast. The links are not visually distinct without relying on color alone.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
