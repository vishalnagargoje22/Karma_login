import "package:flutter/material.dart";
import "package:flutter_login/user_model.dart";
import 'package:http/http.dart' as http;
import 'package:flutter_login/karma_drive.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

String token = '';
bool apiProcess = false;
Future<LoginResponse> getResponse(String email, String password) async {
  print(password);
  final String apiUrl = "https://reqres.in/api/login";
  final response = await http
      .post(Uri.parse(apiUrl), body: {"email": email, "password": password});
  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(response.body);

    return loginResponseFromJson(responseString);
  } else {
    throw Exception('Failed to Load Data');
  }
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  void _togglePasswordView() {
    print("The icon was pressed");
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController passWordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Stack(children: [
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              bottomLeft:
                                  Radius.elliptical(screenWidth * 2, 400),
                              bottomRight:
                                  Radius.elliptical(screenWidth * 2, 400)),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 60),
                            Container(
                              height: 120,
                              width: 120,
                              child: Image(
                                image: AssetImage('lib/assets/Logo.png'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text("LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ))
                          ],
                        ),
                      )
                    ]),
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: <Widget>[
                      Container(
                        width: screenWidth * 0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: TextField(
                          controller: nameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "xyz@email.com",
                              contentPadding: EdgeInsets.all(20)),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: screenWidth * 0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: TextField(
                            controller: passWordController,
                            obscureText: _isHidden,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              contentPadding: EdgeInsets.all(20),
                              suffix: InkWell(
                                  onTap: _togglePasswordView,
                                  child: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 20)),
                            )),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40, top: 20),
                          child: InkWell(
                              onTap: () {},
                              child: Text("Forgot Password",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                          height: 30,
                          width: 30,
                          // width: MediaQuery.of(context).size.width,
                          child: apiProcess == true
                              ? Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                  child: CircularProgressIndicator(
                                    //strokeWidth: 2,
                                    color: Colors.orange,
                                  ))
                              : Container()),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius:
                                BorderRadius.all(Radius.circular(14))),
                        child: InkWell(
                            onTap: () async {
                              final String name = nameController.text;
                              final String password = passWordController.text;

                              final LoginResponse res =
                                  await getResponse(name, password);
                              setState(() {
                                apiProcess = true;
                              });
                              if (res != null) {
                                setState(() {
                                  apiProcess = false;
                                });
                                if (res.token.length > 0) {
                                  token = res.token;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => karmaDrive()));
                                } else if (res.error.length > 0) {
                                  final snackBar =
                                      SnackBar(content: Text('${res.error}'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))),
                      ),
                      SizedBox(height: 30),
                      Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Not a member yet?  "),
                              Text("Click Here",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold))
                            ],
                          ))
                    ],
                  ),
                ],
              )),
        ));
  }
}
