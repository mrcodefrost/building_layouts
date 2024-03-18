import 'package:flutter/material.dart';


class FormHomeScreen extends StatefulWidget {
  const FormHomeScreen({super.key});

  @override
  State<FormHomeScreen> createState() => _FormHomeScreenState();
}

class _FormHomeScreenState extends State<FormHomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isNRI = false;

  /*

1. Function Name and Return Type:
   - The function is named `buildDropdownMenuItems`.
   - It returns a list of `DropdownMenuItem<String>` objects.

2. Function Implementation:
   - The function uses the `.map()` method on the `educationalQualifications` list.
   - For each item (a string representing an educational qualification) in the `educationalQualifications` list, it creates a `DropdownMenuItem<String>` object.
   - The `DropdownMenuItem` has two properties:
     - `value`: The value associated with the menu item (in this case, the educational qualification).
     - `child`: The widget that represents the content of the menu item (here, it's a `Text` widget displaying the educational qualification).

3. Overall Purpose:
   - The purpose of this function is to dynamically generate a list of `DropdownMenuItem` widgets based on the items in the `educationalQualifications` list.
   - These generated menu items can then be used in a `DropdownButton` widget to create a dropdown menu where users can select an educational qualification.

   */

  final List<String> _educationalQualification = [
    'Pass Out',
    'Graduate',
    'Post Graduate',
    'Diploma',
    'No Padhai, only Systumm!'
  ];

  List<DropdownMenuEntry<String>> buildDropdownMenuItems() {
    return _educationalQualification.map((String item) {
      return DropdownMenuEntry<String>(
        value: item,
        label: item,
      );
    }).toList();
  }

  Map<String, String> gender = {'m': 'Male', 'f': 'Female'};
  String? _selectedGender;
  double _currentSliderValue = 0;

  Color _getInactiveColor(double rating) {
    switch (rating) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.pinkAccent; // Light red
      case 3:
        return Colors.amber;
      case 4:
        return Colors.green;
      case 5:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Map<double, String> ratings = {
    1: 'Poor',
    2: 'Below Average',
    3: 'Average',
    4: 'Good',
    5: 'Waah Modi ji Waah',
  };

  bool _light = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          centerTitle: true,
          elevation: 0,
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Bharatiya_Janata_Party_logo.svg/1200px-Bharatiya_Janata_Party_logo.svg.png'),
          ),
          actions: [
            Image.network(
                'https://www.india.gov.in/sites/upload_files/npi/files/mpimages/loksabha/4589.jpg'),
          ],
          title: const Text(
            'AADHAR \nRegistration',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                decoration: BoxDecoration(
                  // color:
                  //     Colors.grey[500], // Light contrast color for background
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFE1F5FE),
                      Colors.blue,
                      Color(0xFFE1F5FE),
                      Colors.white,
                      Color(0xFFE1F5FE),
                    ], // Define gradient colors
                  ), // Optional: add border radius
                ),
                padding: EdgeInsets.all(12.0), // Optional: add padding
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Mera ',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 22,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'Aadhar, ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'Meri Pehchan',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'T&C Apply',
                  style: TextStyle(fontSize: 10, letterSpacing: 1.5),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Mother\'s Name',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Address',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<String>(
                            activeColor: Colors.orange,
                            value: gender['m']!,
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          const Text(
                            'Male',
                          ),
                          Radio<String>(
                            activeColor: Colors.orange,
                            value: gender['f']!,
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          const Text('Female'),
                        ],
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.orange,
                            value: _isNRI,
                            onChanged: (bool? value) {
                              setState(() {
                                _isNRI = value!;
                              });
                            }),
                        title: const Text('Are you an NRI'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('Select your Educational Qualifications'),
                      ),
                      DropdownMenu(
                        inputDecorationTheme: const InputDecorationTheme(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        dropdownMenuEntries: buildDropdownMenuItems(),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Learn more',
                                style: TextStyle(color: Colors.blue),
                              )),
                          IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.info)),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const Text(
                        'Rate your experience 📝',
                        style: TextStyle(fontSize: 14),
                      ),

                      Slider(
                        label: ratings[_currentSliderValue],
                        value: _currentSliderValue,
                        min: 0,
                        max: 5,
                        divisions:
                            5, // Divisions represent the number of discrete values between min and max
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                        inactiveColor: _getInactiveColor(_currentSliderValue),
                        activeColor: _getInactiveColor(_currentSliderValue),
                      ),

                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.orange), // Set orange background color
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white), // Set white text color
                          ),
                          onPressed: () {},
                          child: const Text('Submit Feedback')),
                      const SizedBox(
                        height: 15,
                      ),

                      Row(
                        children: [
                          const Text(
                            'Mail me the AADHAR Card',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Switch(
                            // This bool value toggles the switch.
                            value: _light,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              setState(() {
                                _light = value;
                              });
                            },
                          ),
                        ],
                      ),

                      // Submit Button
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // process data
                                }
                              },
                              child: const Text('Submit')),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.orange,
                  Colors.white,
                  Colors.green
                ], // Define gradient colors
              ),
            ),
            child: const SizedBox(
                height: 100,
                width: 100,
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
