import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:dropdown_button2/dropdown_button2.dart';
import 'homePage.dart';
import 'loginPage.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// import 'package:intl/intl.dart';

class createAssembly extends StatefulWidget {
  const createAssembly({
    Key? key,
  }) : super(key: key);
  _createAssemblyState createState() => _createAssemblyState();
}

TextEditingController nameController = TextEditingController();
TextEditingController descController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController durationController = TextEditingController();
TextEditingController personController = TextEditingController();
TextEditingController PhoneNumController = TextEditingController();

void clearForm() {
  nameController.text = '';
  descController.text = '';
  priceController.text = '';
  durationController.text = '';
  personController.text = '';
  PhoneNumController.text = '';
}

class _createAssemblyState extends State<createAssembly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          'انشاء جمعية ',
        ),
        leading: //Icon(Icons.more_vert)
            Text(''),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
            onPressed: () {
              clearForm();
              Navigator.of(context).pop();
            },
          ),
        ],
        // elevation: 15,
      ),
      body: assemblyForm(),
    );
  }
}

class assemblyForm extends StatefulWidget {
  assemblyFormState createState() {
    return assemblyFormState();
  }
}

List<String> prices = [
  //200-50k
  //%10
  '200',
  '300',
  '400',
];
String dropdownValue = prices.first;

String bDay = "";
bool _passwordVisible = false;

class assemblyFormState extends State<assemblyForm> {
  bool pickerIsExpanded = false;
  int _pickerYear = DateTime.now().year;
  DateTime _selectedMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  );

  dynamic _pickerOpen = false;

  void switchPicker() {
    setState(() {
      _pickerOpen ^= true;
    });
  }

  List<Widget> generateRowOfMonths(from, to) {
    List<Widget> months = [];
    for (int i = from; i <= to; i++) {
      DateTime dateTime = DateTime(_pickerYear, i, 1);
      final backgroundColor = dateTime.isAtSameMomentAs(_selectedMonth)
          ? Theme.of(context).accentColor
          : Colors.transparent;
      months.add(
        AnimatedSwitcher(
          duration: kThemeChangeDuration,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: TextButton(
            key: ValueKey(backgroundColor),
            onPressed: () {
              setState(() {
                _selectedMonth = dateTime;
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: CircleBorder(),
            ),
            child: Text(
              DateFormat('MMM').format(dateTime),
            ),
          ),
        ),
      );
    }
    return months;
  }

  List<Widget> generateMonths() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: generateRowOfMonths(1, 6),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: generateRowOfMonths(7, 12),
      ),
    ];
  }

  //
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  DateTime selectedDate = DateTime.now();
  bool showDate = false;
  ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = TextStyle(color: Colors.blue);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
        child: ListView(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          // Image.asset(
          //   'assets/images/logo.jpg',
          //   height: 100,
          //   width: 100,
          // ),
          SizedBox(
            height: 20,
          ),
          //
          Text(
            "الاسم ",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),

          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'جمعية ادخار',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      (value.trim()).isEmpty) {
                    return 'الرجاء ادخال اسم الجمعية';
                  }
                  return null;
                },
              )),
          Text(
            "  الوصف",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),

          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: descController,
                decoration: InputDecoration(
                  hintText: ' ...هذه الجمعية لغرض',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      (value.trim()).isEmpty) {
                    return 'الرجاء ادخال اسم الجمعية';
                  }
                  return null;
                },
              )),
          //السعر
          Text(
            "السعر",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: priceController,
                decoration: InputDecoration(
                  hintText: ' ريال 500',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.payments,
                      color: Color.fromRGBO(76, 121, 74, 1),
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                    },
                  ),
                ),
                validator: (value) {
                  //     int reminder = (int.parse(value)) % 10;
                  if (value == null ||
                      value.isEmpty ||
                      (value.trim()).isEmpty) {
                    return 'الرجاء ادخال السعر ';
                  }
                  if (int.parse(value) < 200)
                    return ' الرحاء إدخال قيمة أكثر من 200 وأقل من 50,000';
                  if (int.parse(value) % 100 != 0)
                    return 'الرجاء إدخال مضاعفات ال100';
                  return null;
                },
              )),
          // Center(
          //   child: DropdownButton<String>(
          //     value: dropdownValue,
          //     icon: const Icon(Icons.payments),
          //     elevation: 16,
          //     style: const TextStyle(color: Color.fromRGBO(76, 121, 74, 1)),
          //     underline: Container(
          //       height: 2,
          //       color: Color.fromRGBO(76, 121, 74, 1),
          //     ),
          //     onChanged: (String? value) {
          //       // This is called when the user selects an item.
          //       setState(() {
          //         dropdownValue = value!;
          //       });
          //     },
          //     items: prices.map<DropdownMenuItem<String>>((String value) {
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(value),
          //       );
          //     }).toList(),
          //   ),
          // ),
          //المدة
          //الاشخاص

          Text(
            "تاريخ البدء",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
          Material(
            color: Theme.of(context).cardColor,
            child: AnimatedSize(
              curve: Curves.easeInOut,
              // vsync: this,
              duration: Duration(milliseconds: 300),
              child: Container(
                height: _pickerOpen ? null : 0.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _pickerYear = _pickerYear - 1;
                            });
                          },
                          icon: Icon(Icons.navigate_before_rounded),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              _pickerYear.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _pickerYear = _pickerYear + 1;
                            });
                          },
                          icon: Icon(Icons.navigate_next_rounded),
                        ),
                      ],
                    ),
                    ...generateMonths(),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),

          ElevatedButton(
              onPressed: switchPicker, child: Icon(Icons.arrow_upward)
              // Text(
              //   'Select date',
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              ),
          Center(
            child: Text(
              DateFormat.yMMMM().format(_selectedMonth),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          // ElevatedButton(
          //   child: Text('Show picker'),
          //   onPressed: () {
          //     showDialog<Widget>(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return SfDateRangePicker(
          //             showActionButtons: true,
          //             onSubmit: (value) {
          //               // Navigator.pop(context);
          //             },
          //             onCancel: () {
          //               Navigator.pop(context);
          //             },
          //           );
          //         });
          //   },
          // ),

          //button
          // TextButton(
          //   child: Text('Show picker'),
          //   onPressed: () {
          //     showDialog<Widget>(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return SfDateRangePicker(
          //             showActionButtons: true,
          //             onCancel: () {
          //               Navigator.pop(context);
          //             },
          //           );
          //         });
          //   },
          // ),
          Text(
            " (بالشهور) المدة",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: durationController,
                decoration: InputDecoration(
                  hintText: '12',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  // prefixIcon: IconButton(
                  //   icon: Icon(
                  //     Icons.payments,
                  //     color: Color.fromRGBO(76, 121, 74, 1),
                  //   ),
                  //   onPressed: () {
                  //     // Update the state i.e. toogle the state of passwordVisible variable
                  //   },
                  // ),
                ),
                validator: (value) {
                  //     int reminder = (int.parse(value)) % 10;
                  if (value == null ||
                      value.isEmpty ||
                      (value.trim()).isEmpty) {
                    return 'الرجاء ادخال السعر ';
                  }
                  if (int.parse(value) < 6)
                    return 'الرجاء ادخال أكثر من 4 شهور';
                  return null;
                },
              )),
          Text(
            "الافراد",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),

          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: personController,
                decoration: InputDecoration(
                  hintText: 'الاسم',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      (value.trim()).isEmpty) {
                    return 'الرجاء ادخال اسم الفرد';
                  }
                  return null;
                },
              )),

          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: PhoneNumController,
                decoration: InputDecoration(
                  hintText: 'رقم الجوال',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: const BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0)),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.phone_android,
                      color: Color.fromRGBO(76, 121, 74, 1),
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      (value.trim()).isEmpty) {
                    return 'الرجاء ادخال رقم الجوال';
                  }
                  return null;
                },
              )),
          //button
          Container(
              child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homePage(),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('تم انشاء الجمعية بنجاح'),
                      backgroundColor: Colors.green),
                );
              }
            },
            child: Text('انشاء الجمعية'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )),
        ]),
      ),
    );
  }
}

class CustomDropdownButton2 {}
