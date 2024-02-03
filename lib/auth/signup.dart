import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../src/components/pages/home_page.dart';
import '../utils/round_button.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  ValueNotifier<bool> _obsecureConfirmPassword = ValueNotifier<bool>(true);
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  bool value = false;

  // string for displaying the error Message
  String? errorMessage;

  final _formKey = GlobalKey<FormState>();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  // late Box _box;

  @override
  // void initState() {
  //   _box = Hive.box("userData");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 0),
              child: Container(
                child:
                    Image(height: 100, image: AssetImage('assets/applogo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 40),
              child: Text(
                "BoPeDo",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text("Create Account",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Color(0xFFF5F5F5),
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                      new RegExp(r"\s\b|\b\s"),
                                    ),
                                  ],
                                  controller: emailEditingController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Please Enter Your Email");
                                    }
                                    // reg expression for email validation
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("Please Enter a valid email");
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    emailEditingController.text = value!;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ValueListenableBuilder(
                                  valueListenable: _obsecurePassword,
                                  builder: (context, value, child) {
                                    return Container(
                                      color: Color(0xFFF5F5F5),
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.deny(
                                            new RegExp(r"\s\b|\b\s"),
                                          ),
                                        ],
                                        controller: passwordEditingController,
                                        obscureText: _obsecurePassword.value,
                                        obscuringCharacter: "*",
                                        validator: (value) {
                                          RegExp regex = new RegExp(r'^.{6,}$');
                                          if (value!.isEmpty) {
                                            return ("Password is required for login");
                                          }
                                          if (!regex.hasMatch(value)) {
                                            return ("Enter Valid Password(Min. 6 Character)");
                                          }
                                        },
                                        onSaved: (value) {
                                          passwordEditingController.text =
                                              value!;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          labelText: 'Password',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          suffixIcon: InkWell(
                                              onTap: () {
                                                _obsecurePassword.value =
                                                    !_obsecurePassword.value;
                                              },
                                              child: Icon(_obsecurePassword.value
                                                  ? Icons
                                                      .visibility_off_outlined
                                                  : Icons.visibility)),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ValueListenableBuilder(
                                  valueListenable: _obsecureConfirmPassword,
                                  builder: (context, value, child) {
                                    return Container(
                                      color: Color(0xFFF5F5F5),
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.deny(
                                              new RegExp(r"\s\b|\b\s"))
                                        ],
                                        controller:
                                            confirmPasswordEditingController,
                                        obscureText:
                                            _obsecureConfirmPassword.value,
                                        obscuringCharacter: "*",
                                        validator: (value) {
                                          if (confirmPasswordEditingController
                                                  .text !=
                                              passwordEditingController.text) {
                                            return "Password don't match";
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          confirmPasswordEditingController
                                              .text = value!;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Re-enter password',
                                          labelText: 'Re-enter password',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          suffixIcon: InkWell(
                                              onTap: () {
                                                _obsecureConfirmPassword.value =
                                                    !_obsecureConfirmPassword
                                                        .value;
                                              },
                                              child: Icon(
                                                  _obsecureConfirmPassword.value
                                                      ? Icons
                                                          .visibility_off_outlined
                                                      : Icons.visibility)),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        )),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 30, bottom: 0),
                    child: RoundButton(
                      title: 'SIGN-UP',
                      loading: loading,
                      onTap: ()
                          // async
                          {
                        signUp(emailEditingController.text,
                            passwordEditingController.text);
                        // await _box.put(
                        //   "profileData",
                        //   {
                        //     "email": emailEditingController.text,
                        //     "password": passwordEditingController.text,
                        //   },
                        // );
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       /** Checkbox Widget **/
                  //       Checkbox(
                  //         value: this.value,
                  //         onChanged: (bool? value) {
                  //           setState(() {
                  //             this.value = value!;
                  //           });
                  //         },
                  //       ),
                  //       SizedBox(
                  //         width: 5,
                  //       ), //SizedBox
                  //       Text(
                  //         'I accept the terms and conditions',
                  //         style: TextStyle(fontSize: 12.0),
                  //       ), //Text //Checkbox
                  //     ], //<Widget>[]
                  //   ),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        child: Center(
                          child: Text(
                            "SIGN-IN",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "Network is not available";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
