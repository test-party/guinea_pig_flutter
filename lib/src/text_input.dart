import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({Key? key}) : super(key: key);

  @override
  State<TextInputScreen> createState() => _TextFieldsScreenState();
}

class _TextFieldsScreenState extends State<TextInputScreen> {
  // Good example text controllers
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController address2 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController website = TextEditingController();
  final TextEditingController birthday = TextEditingController();
  final TextEditingController bday = TextEditingController();
  final TextEditingController bmonth = TextEditingController();
  final TextEditingController byear = TextEditingController();

  // Bad example text controllers
  final TextEditingController fnameBad = TextEditingController();
  final TextEditingController lnameBad = TextEditingController();
  final TextEditingController usernameBad = TextEditingController();
  final TextEditingController passwordBad = TextEditingController();
  final TextEditingController emailBad = TextEditingController();
  final TextEditingController addressBad = TextEditingController();
  final TextEditingController address2Bad = TextEditingController();
  final TextEditingController cityBad = TextEditingController();
  final TextEditingController stateBad = TextEditingController();
  final TextEditingController phoneBad = TextEditingController();
  final TextEditingController websiteBad = TextEditingController();

  // Colors
  final Color darkGreen = const Color.fromRGBO(0, 102, 0, 1);
  final Color darkRed = const Color.fromRGBO(220, 20, 60, 1);

  @override
  void dispose() {
    // Dispose all controllers
    fname.dispose();
    lname.dispose();
    username.dispose();
    password.dispose();
    email.dispose();
    address.dispose();
    address2.dispose();
    city.dispose();
    state.dispose();
    phone.dispose();
    website.dispose();
    birthday.dispose();
    bday.dispose();
    bmonth.dispose();
    byear.dispose();
    
    fnameBad.dispose();
    lnameBad.dispose();
    usernameBad.dispose();
    passwordBad.dispose();
    emailBad.dispose();
    addressBad.dispose();
    address2Bad.dispose();
    cityBad.dispose();
    stateBad.dispose();
    phoneBad.dispose();
    websiteBad.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final goodColor = isDarkMode ? Colors.green : darkGreen;
    final badColor = isDarkMode ? Colors.red : darkRed;
    final borderColor = Theme.of(context).colorScheme.outline;

    return GestureDetector(
      // Dismiss keyboard when tapping outside of text fields
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text Fields'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Text fields require visible label text next to the field set as the semantic label of the TextField. Using InputDecoration with a visible label is recommended. Don't rely solely on hint text (placeholder) which has insufficient contrast and disappears. Use proper OutlineInputBorder to make the TextField visually identifiable. Set keyboard types with keyboardType. Enable autofill where appropriate using TextInputType.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                
                // Good Examples Header
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
                
                // Good Example 1
                Semantics(
                  header: true,
                  child: Text(
                    "Good Example Using Explicit Label and Semantics",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                
                // First Name
                const Text("First Name"),
                Semantics(
                  label: "First Name",
                  child: TextField(
                    controller: fname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    enableSuggestions: false,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Last Name
                const Text("Last Name"),
                Semantics(
                  label: "Last Name",
                  child: TextField(
                    controller: lname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    enableSuggestions: false,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Username
                const Text("Username"),
                Semantics(
                  label: "Username",
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.username],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Password
                const Text("Password"),
                Semantics(
                  label: "Password",
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.password],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Email
                const Text("Email"),
                Semantics(
                  label: "Email",
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.email],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Street Address
                const Text("Street Address"),
                Semantics(
                  label: "Street Address",
                  child: TextField(
                    controller: address,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.streetAddressLine1],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Street Address Line 2
                const Text("Street Address Line 2"),
                Semantics(
                  label: "Street Address Line 2",
                  child: TextField(
                    controller: address2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.streetAddressLine2],
                  ),
                ),
                const SizedBox(height: 12),
                
                // City
                const Text("City"),
                Semantics(
                  label: "City",
                  child: TextField(
                    controller: city,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.addressCity],
                  ),
                ),
                const SizedBox(height: 12),
                
                // State
                const Text("State"),
                Semantics(
                  label: "State",
                  child: TextField(
                    controller: state,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.addressState],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Phone Number
                const Text("Phone Number"),
                Semantics(
                  label: "Phone Number",
                  child: TextField(
                    controller: phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.telephoneNumber],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Website
                const Text("Website"),
                Semantics(
                  label: "Website",
                  child: TextField(
                    controller: website,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.url],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Birth Date
                const Text("Birth Date"),
                Semantics(
                  label: "Birth Date",
                  child: TextField(
                    controller: birthday,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Birth Date Day
                const Text("Birth Date Day"),
                Semantics(
                  label: "Birth Date Day",
                  child: TextField(
                    controller: bday,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Birth Date Month
                const Text("Birth Date Month"),
                Semantics(
                  label: "Birth Date Month",
                  child: TextField(
                    controller: bmonth,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(height: 12),
                
                // Birth Date Year
                const Text("Birth Date Year"),
                Semantics(
                  label: "Birth Date Year",
                  child: TextField(
                    controller: byear,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                
                ExpansionTile(
                  title: const Text("Details"),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: const EdgeInsets.all(16),
                  children: [
                    Semantics(
                      label: "Good Example Using Explicit Label and Semantics - Details",
                      child: const Text(
                        "The first good Text Fields example uses visible label text that is set as the Semantics label for each TextField. OutlineInputBorder is used to give the border sufficient contrast. keyboardType is used to provide the most usable keyboard for each type of input. autofillHints is used to enable AutoFill for each TextField and automatic password management.",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Good Example 2
                Semantics(
                  header: true,
                  child: Text(
                    "Good Example Using InputDecoration with Label",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                
                // First Name with InputDecoration
                TextField(
                  controller: fname,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                  ),
                  enableSuggestions: false,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.givenName],
                ),
                const SizedBox(height: 12),
                
                // Last Name with InputDecoration
                TextField(
                  controller: lname,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                  ),
                  enableSuggestions: false,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.familyName],
                ),
                
                ExpansionTile(
                  title: const Text("Details"),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: const EdgeInsets.all(16),
                  children: [
                    Semantics(
                      label: "Good Example Using InputDecoration with Label - Details",
                      child: const Text(
                        "The second good Text Fields example uses InputDecoration's labelText to provide visible label text that also becomes the accessible name of each TextField. When using labelText, an explicit Semantics label is not required.",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Bad Examples Header
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
                
                // Bad Example 1
                Semantics(
                  header: true,
                  child: Text(
                    "Bad Example Using placeholders with no label text or semantics",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                
                // Bad TextFields using only hintText
                TextField(
                  controller: fnameBad,
                  decoration: const InputDecoration(
                    hintText: "First Name",
                  ),
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: lnameBad,
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                  ),
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: usernameBad,
                  decoration: const InputDecoration(
                    hintText: "Username",
                  ),
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: passwordBad,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: emailBad,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: addressBad,
                  decoration: const InputDecoration(
                    hintText: "Street Address",
                  ),
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: address2Bad,
                  decoration: const InputDecoration(
                    hintText: "",
                  ),
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: cityBad,
                  decoration: const InputDecoration(
                    hintText: "City",
                  ),
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: stateBad,
                  decoration: const InputDecoration(
                    hintText: "State",
                  ),
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: phoneBad,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                  ),
                ),
                const SizedBox(height: 12),
                
                TextField(
                  controller: websiteBad,
                  decoration: const InputDecoration(
                    hintText: "Website",
                  ),
                ),
                
                ExpansionTile(
                  title: const Text("Details"),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: const EdgeInsets.all(16),
                  children: [
                    Semantics(
                      label: "Bad Example Using placeholders with no label text or semantics - Details",
                      child: const Text(
                        "The bad Text Fields example uses placeholder text (hintText) which disappears and has insufficient contrast rather than visible label text. There is no semantic label for each TextField. The default border style has an insufficient contrast ratio. Keyboard types are not specified. AutoFill and password management are not enabled.",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Bad Example 2
                Semantics(
                  header: true,
                  child: Text(
                    "Bad Example with Improper Vertical Alignment",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                
                // First Name - Bad vertical implementation
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("First Name"),
                    const SizedBox(height: 4),
                    TextField(
                      controller: fname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                      ),
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                
                // Last Name - Bad vertical implementation
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Last Name"),
                    const SizedBox(height: 4),
                    TextField(
                      controller: lname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor),
                        ),
                      ),
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                  ],
                ),
                
                ExpansionTile(
                  title: const Text("Details"),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: const EdgeInsets.all(16),
                  children: [
                    Semantics(
                      label: "Bad Example with Improper Vertical Alignment - Details",
                      child: const Text(
                        "This bad example uses a vertical Column to stack labels above the text fields in a way that can cause accessibility issues. Without proper semantic grouping, screen readers might not correctly associate the label with the text field, especially when navigating with gestures.",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}