import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'register.dart';

class loginPage extends StatefulWidget {
  const loginPage({
    Key? key,
  }) : super(key: key);
  _loginPageState createState() => _loginPageState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
void clearForm() {
  usernameController.text = '';
  passwordController.text = '';
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFFFFFFF),
      //   foregroundColor: Colors.black87,
      //   centerTitle: true,
      //   title: Text(
      //     'تسجيل الدخول',
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
      body: loginForm(),
    );
  }
}

class loginForm extends StatefulWidget {
  loginFormState createState() {
    return loginFormState();
  }
}

bool _passwordVisible = false;

class loginFormState extends State<loginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = TextStyle(color: Colors.blue);
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
        child: ListView(children: <Widget>[
          Image.asset(
            'assets/images/transparent.png',
            height: 200,
            width: 200,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: TextFormField(
                // maxLength: 20,
                textAlign: TextAlign.right,
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: ' رقم الهوية الوطنية',
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

          //button
          Container(
              child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                clearForm();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homePage(),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('تم تسجيل دخولك بنجاح'),
                    backgroundColor: Colors.green));
              }
            },
            child: Text('تسجيل الدخول'),
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
                TextSpan(text: ' ليس لديك حساب؟ '),
                TextSpan(
                    text: 'تسجيل جديد',
                    style: TextStyle(color: Color.fromRGBO(76, 121, 74, 1)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        clearForm();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => register(),
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
