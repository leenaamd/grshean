import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

// import 'package:intl/intl.dart';

class register extends StatefulWidget {
  const register({
    Key? key,
  }) : super(key: key);
  _registerState createState() => _registerState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController fullNameController = TextEditingController();
TextEditingController DOBController = TextEditingController();
TextEditingController PhoneNumController = TextEditingController();

void clearForm() {
  usernameController.text = '';
  passwordController.text = '';
  fullNameController.text = '';
  DOBController.text = '';
  PhoneNumController.text = '';
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      // AppBar(
      //   backgroundColor: Color(0xFFFFFFFF),
      //   foregroundColor: Colors.black87,
      //   centerTitle: true,
      //   title: Text(
      //     'تسجيل جديد',
      //   ),
      //   leading: //Icon(Icons.more_vert)
      //       Text(''),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.arrow_forward_ios,
      //       ),
      //       onPressed: () {
      //         clearForm();
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //   ],
      //   // elevation: 15,
      // ),
      body: registerForm(),
    );
  }
}

class registerForm extends StatefulWidget {
  registerFormState createState() {
    return registerFormState();
  }
}

String bDay = "";
bool _passwordVisible = false;

class registerFormState extends State<registerForm> {
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
          Image.asset(
            'assets/images/transparent.png',
            height: 100,
            width: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'رقم الهوية الوطنية',
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
                    return 'الرجاء ادخال اسم المستخدم';
                  }
                  return null;
                },
              )),
          Container(
              padding: EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                textAlign: TextAlign.right,
                maxLength: 8,
                controller: passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  hintText: ' كلمة السر',
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
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color.fromRGBO(76, 121, 74, 1),
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      (value.trim()).isEmpty) {
                    return 'الرجاء ادخال كلمة السر';
                  }
                  return null;
                },
              )),
          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: fullNameController,
                decoration: InputDecoration(
                  hintText: 'الاسم الكامل',
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
                    return 'الرجاء ادخال الاسم الكامل';
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
                    return 'الرجاء ادخال كلمة السر';
                  }
                  return null;
                },
              )),
          //button
          Container(
              child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                //       Navigator.push(
                // context,
                // MaterialPageRoute(
                //   builder: (context) => homePage(),
                // ));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('تم تسجيلك بنجاح'),
                      backgroundColor: Colors.green),
                );
              }
            },
            child: Text('تسجيل'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )),
          Center(
              child: RichText(
            text: TextSpan(
              style: defaultStyle,
              children: <TextSpan>[
                TextSpan(text: ' لديك حساب بالفعل؟ '),
                TextSpan(
                    text: 'تسجيل الدخول',
                    style: TextStyle(color: Color.fromRGBO(76, 121, 74, 1)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginPage(),
                            ));
                      }),
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
