import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  // State variables for all date pickers
  DateTime _date = DateTime.now();
  DateTime _dateStart = DateTime.now();
  DateTime _dateEnd = DateTime.now();
  DateTime _time = DateTime.now();
  
  // Date range for the constrained picker
  final DateTime _dateRangeStart = DateTime(2021, 1, 1);
  final DateTime _dateRangeEnd = DateTime(2021, 12, 31, 23, 59, 59);
  
  // Color definitions
  final Color darkGreen = const Color.fromRGBO(0, 102, 0, 1);
  final Color darkRed = const Color.fromRGBO(220, 20, 60, 1);

  // Format time as HH:MM
  String _formatTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  // Format date as MM/DD/YYYY
  String _formatDate(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }

  // Show date picker and update state
  Future<void> _selectDate(BuildContext context, String pickerType) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: 
        pickerType == 'date' ? _date : 
        pickerType == 'startDate' ? _dateStart : 
        pickerType == 'endDate' ? _dateEnd : DateTime.now(),
      firstDate: pickerType == 'reservation' ? _dateRangeStart : DateTime(2000),
      lastDate: pickerType == 'reservation' ? _dateRangeEnd : DateTime(2101),
    );
    
    if (picked != null) {
      setState(() {
        if (pickerType == 'date') {
          _date = picked;
        } else if (pickerType == 'startDate') {
          _dateStart = picked;
        } else if (pickerType == 'endDate') {
          _dateEnd = picked;
        } else if (pickerType == 'reservation') {
          _date = picked;
        }
      });
    }
  }

  // Show time picker and update state
  Future<void> _selectTime(BuildContext context, String pickerType) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: 
        pickerType == 'time' ? TimeOfDay.fromDateTime(_time) : 
        TimeOfDay.fromDateTime(DateTime.now()),
    );
    
    if (picked != null) {
      setState(() {
        if (pickerType == 'time') {
          _time = DateTime(
            _time.year, 
            _time.month, 
            _time.day, 
            picked.hour, 
            picked.minute
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Date & Time Pickers'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Date Pickers are used to select dates and times. Date Pickers without the `.graphical` or `.wheel` style need an `.accessibilityLabel` set to match their visible label text. Date Pickers with the `.graphical` or `.wheel` style need visible `DatePicker(\"Label\")` text for each picker so it is spoken to VoiceOver as the accessibility label. `AccessibilityFocusState` does not work with `DatePicker` to return focus.',
            ),
            const SizedBox(height: 16),
            
            // GOOD EXAMPLES SECTION
            Text(
              'Good Examples',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.green : darkGreen,
              ),
            ),
            Divider(
              thickness: 2,
              color: isDarkMode ? Colors.green : darkGreen,
            ),
            const SizedBox(height: 8),
            
            // Pick a Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pick a Date'),
                TextButton(
                  onPressed: () => _selectDate(context, 'date'),
                  child: Text(_formatDate(_date)),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            const Text(
              'Good Example Using `.accessibilityLabel`',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            
            // Start Date (Good)
            Semantics(
              label: 'Start Date',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Start Date'),
                  TextButton(
                    onPressed: () => _selectDate(context, 'startDate'),
                    child: Text(_formatDate(_dateStart)),
                  ),
                ],
              ),
            ),
            
            // End Date (Good)
            Semantics(
              label: 'End Date',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('End Date'),
                  TextButton(
                    onPressed: () => _selectDate(context, 'endDate'),
                    child: Text(_formatDate(_dateEnd)),
                  ),
                ],
              ),
            ),
            
            // Scheduled Time (Good)
            Semantics(
              label: 'Scheduled Time',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Scheduled Time'),
                  TextButton(
                    onPressed: () => _selectTime(context, 'time'),
                    child: Text(_formatTime(_time)),
                  ),
                ],
              ),
            ),
            
            // Reservation (Good)
            Semantics(
              label: 'Reservation',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Reservation'),
                  TextButton(
                    onPressed: () => _selectDate(context, 'reservation'),
                    child: Text('${_formatDate(_date)} ${_formatTime(_date)}'),
                  ),
                ],
              ),
            ),
            
            // Details Disclosure
            ExpansionTile(
              title: const Text('Details'),
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('The first good Date Pickers example uses `.accessibilityLabel` on each `DatePicker` that matches the visible label text.'),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            const Text(
              'Good Example Using `DatePicker("Label")`',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Check In'),
            ),
            CalendarDatePicker(
              initialDate: _date,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
              onDateChanged: (date) {
                setState(() {
                  _date = date;
                });
              },
            ),
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Check Out'),
            ),
            SizedBox(
              height: 150,
              child: Semantics(
                label: 'Check Out',
                child: ListWheelScrollView(
                  itemExtent: 50,
                  diameterRatio: 1.5,
                  children: List.generate(24, (index) {
                    return Center(
                      child: Text('${index.toString().padLeft(2, '0')}:00'),
                    );
                  }),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _time = DateTime(
                        _time.year, 
                        _time.month, 
                        _time.day, 
                        index, 
                        0
                      );
                    });
                  },
                ),
              ),
            ),
            
            // Details Disclosure
            ExpansionTile(
              title: const Text('Details'),
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('The second good Date Pickers example uses visible `DatePicker("Label")` text for each date picker that is spoken to VoiceOver as the accessibility label.'),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // BAD EXAMPLES SECTION
            Text(
              'Bad Examples',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.red : darkRed,
              ),
            ),
            Divider(
              thickness: 2,
              color: isDarkMode ? Colors.red : darkRed,
            ),
            const SizedBox(height: 8),
            
            const Text(
              'Bad Example No `.accessibilityLabel`',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            
            // Start Date (Bad)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Start Date'),
                TextButton(
                  onPressed: () => _selectDate(context, 'startDate'),
                  child: Text(_formatDate(_dateStart)),
                ),
              ],
            ),
            
            // End Date (Bad)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('End Date'),
                TextButton(
                  onPressed: () => _selectDate(context, 'endDate'),
                  child: Text(_formatDate(_dateEnd)),
                ),
              ],
            ),
            
            // Scheduled Time (Bad)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Scheduled Time'),
                TextButton(
                  onPressed: () => _selectTime(context, 'time'),
                  child: Text(_formatTime(_time)),
                ),
              ],
            ),
            
            // Reservation (Bad)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Reservation'),
                TextButton(
                  onPressed: () => _selectDate(context, 'reservation'),
                  child: Text('${_formatDate(_date)} ${_formatTime(_date)}'),
                ),
              ],
            ),
            
            // Details Disclosure
            ExpansionTile(
              title: const Text('Details'),
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('The first bad Date Pickers example has no `.accessibilityLabel` for each `DatePicker` that matches the visible label text.'),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            const Text(
              'Bad Example No `DatePicker("Label")`',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Check In'),
            ),
            CalendarDatePicker(
              initialDate: _date,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
              onDateChanged: (date) {
                setState(() {
                  _date = date;
                });
              },
            ),
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Check Out'),
            ),
            SizedBox(
              height: 150,
              child: ListWheelScrollView(
                itemExtent: 50,
                diameterRatio: 1.5,
                children: List.generate(24, (index) {
                  return Center(
                    child: Text('${index.toString().padLeft(2, '0')}:00'),
                  );
                }),
                onSelectedItemChanged: (index) {
                  setState(() {
                    _time = DateTime(
                      _time.year, 
                      _time.month, 
                      _time.day, 
                      index, 
                      0
                    );
                  });
                },
              ),
            ),
            
            // Details Disclosure
            ExpansionTile(
              title: const Text('Details'),
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('The second bad Date Pickers example uses no visible `DatePicker("")` text for each date picker so nothing is spoken to VoiceOver as the accessibility label.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}