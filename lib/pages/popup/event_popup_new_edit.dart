import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Example enums
enum Category {
  EMPTY,
  PRAYER,
  EDUCATION,
  COMMUNITY,
  CHARITY,
  YOUTH,
  WOMEN
}

// Main App
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Form Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

// Home page that shows the button to open dialog
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Manager'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => EventFormDialog(),
            );
          },
          child: Text('Add New Event'),
        ),
      ),
    );
  }
}

// Event Form Dialog
class EventFormDialog extends StatefulWidget {
  @override
  EventFormDialogState createState() => EventFormDialogState();
}

class EventFormDialogState extends State<EventFormDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  Category _selectedCategory = Category.EMPTY;
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text("Add New Event"),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Event Name
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Event Description
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),

              // Category Dropdown
              DropdownButtonFormField<Category>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: Category.values.map((Category category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (Category? newValue) {
                  setState(() {
                    _selectedCategory = newValue ?? Category.EMPTY;
                  });
                },
              ),
              SizedBox(height: 16),

              // Location
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Start Date and Time
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectStartDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Start Date',
                          border: OutlineInputBorder(),
                        ),
                        child: Text(
                          _startDate != null
                              ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                              : 'Select Date',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectStartTime(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Start Time',
                          border: OutlineInputBorder(),
                        ),
                        child: Text(
                          _startTime != null
                              ? _startTime!.format(context)
                              : 'Select Time',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // End Date and Time
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectEndDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'End Date',
                          border: OutlineInputBorder(),
                        ),
                        child: Text(
                          _endDate != null
                              ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                              : 'Select Date',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectEndTime(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'End Time',
                          border: OutlineInputBorder(),
                        ),
                        child: Text(
                          _endTime != null
                              ? _endTime!.format(context)
                              : 'Select Time',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveEvent,
          child: Text('Save Event'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? _startDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime ?? _startTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _endTime) {
      setState(() {
        _endTime = picked;
      });
    }
  }

  void _saveEvent() async {
    // Validate required fields
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _startDate == null ||
        _endDate == null ||
        _startTime == null ||
        _endTime == null ||
        _selectedCategory == Category.EMPTY) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Combine date and time into DateTime objects
    DateTime startDateTime = DateTime(
      _startDate!.year,
      _startDate!.month,
      _startDate!.day,
      _startTime!.hour,
      _startTime!.minute,
    );

    DateTime endDateTime = DateTime(
      _endDate!.year,
      _endDate!.month,
      _endDate!.day,
      _endTime!.hour,
      _endTime!.minute,
    );

    // Create the request body data
    Map<String, dynamic> requestData = {
      "name": _nameController.text,
      "description": _descriptionController.text,
      "location": _locationController.text,
      "starttime": startDateTime.toIso8601String(),
      "endtime": endDateTime.toIso8601String(),
      "category": _selectedCategory.toString().split('.').last,
    };

    // Encode to JSON and print it
    String jsonBody = jsonEncode(requestData);
    print('=== JSON PAYLOAD ===');
    print('===================');

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8080/api/v1/auth/createevent'),
        headers: {"Content-Type": "application/json"},
        body: jsonBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(jsonBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Event created successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create event. Please try again.')),
        );
      }
    } catch (error) {
      print('Error creating event: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error. Please check your connection.')),
      );
    }
  }
}