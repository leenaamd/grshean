import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:dropdown_button2/dropdown_button2.dart';
import 'homePage.dart';
import 'loginPage.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// import 'package:intl/intl.dart';

class trasferFormNew extends StatefulWidget {
  const trasferFormNew({
    Key? key,
  }) : super(key: key);
  _createAssemblyState createState() => _createAssemblyState();
}

TextEditingController priceController = TextEditingController();
TextEditingController purposeController = TextEditingController();
TextEditingController fullnameController = TextEditingController();
TextEditingController ibanController = TextEditingController();

void clearForm() {
  priceController.text = '';
  purposeController.text = '';
  fullnameController.text = '';
  ibanController.text = 'SA';
}

class _createAssemblyState extends State<trasferFormNew> {
  // ibanController.txt='SA';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          'تحويل لمستفيد جديد',
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

List<String> purpose = [
  //200-50k
  //%10
  'مصاريف دراسة',
  'مصاريف علاج',
  'مصاريف سفر',
  'اخرى'
];
String dropdownValue = purpose.first;

String bDay = "";
bool _passwordVisible = false;

class assemblyFormState extends State<assemblyForm> {
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
          //السعر
          Text(
            "المبلغ",
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
                  hintText: '﷼ 500',
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
                    return 'الرجاء ادخال المبلغ ';
                  }

                  return null;
                },
              )),

          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: fullnameController,
                decoration: InputDecoration(
                  hintText: "  اسم المستفيد كامل",
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
            "  الآيبان",
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
                controller: ibanController,
                decoration: InputDecoration(
                  // hintText: ' ...هذه الجمعية لغرض',
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
            "الغرض من الحوالة",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textDirection: TextDirection.rtl,
          ),

          Container(
            margin: EdgeInsets.fromLTRB(250, 10, 0, 0),
            child: DropdownButton<String>(
              // AlignmentGeometry alignment = AlignmentDirectional.centerStart,

              value: dropdownValue,
              icon: const Icon(
                Icons.payments,
                color: Color.fromRGBO(76, 121, 74, 1),
              ),
              elevation: 16,
              style: TextStyle(
                color: Color.fromRGBO(76, 121, 74, 1),
              ),
              underline: Container(
                height: 2,
                color: Color.fromRGBO(76, 121, 74, 1),
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: purpose.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          //button
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                          content: Text('تم تحويل المبلغ بنجاح'),
                          backgroundColor: Colors.green),
                    );
                  }
                },
                child: Text('التحويل'),
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
