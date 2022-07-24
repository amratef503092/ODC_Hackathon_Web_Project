import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:odc_hackathon_web_project/core/resource/assets_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/text_manager.dart';
import 'package:odc_hackathon_web_project/core/resource/value_manager.dart';

import 'package:provider/provider.dart';

import '../../core/constant/validator.dart';
import '../../core/widgets/custom_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool securePass = true;
  String name = "", email = "", pass = "", phone = "", address = "";
  bool showSpinner = false;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final iskeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    double h = MediaQuery.of(context).size.height * .02;
    // var api = Provider.of<UserInformation>(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(3, 1),
                  end: Alignment(1, 1),
                  colors: <Color>[
                    Color(0xff56392D),

                    Color(0xff180701),


                  ], // Gradient from https://learnui.design/tools/gradient-generator.html
                  tileMode: TileMode.mirror,
                ),
              ),
              // child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Flexible(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             Flexible(
              //               child: Image.asset(
              //                 ImageAssets.logoAppBar,
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //             CustomTextButton(
              //                 text: TextManager.aboutUs,
              //                 function: () {
              //                   print("AboutUs");
              //                 }),
              //             CustomTextButton(
              //                 text: TextManager.categories,
              //                 function: () {
              //                   print("categories");
              //                 }),
              //             CustomTextButton(
              //                 text: TextManager.services,
              //                 function: () {
              //                   print("services");
              //                 }),
              //             CustomTextButton(
              //                 text: TextManager.request,
              //                 function: () {
              //                   print("request");
              //                 }),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: MediaQuery.of(context).size.width * .05,
              //       ),
              //       ElevatedButton(
              //         onPressed: () {},
              //         style: ButtonStyle(
              //
              //             shape:
              //             MaterialStateProperty.all<RoundedRectangleBorder>(
              //                 RoundedRectangleBorder(
              //                     borderRadius:
              //                     BorderRadius.circular(AppSize.s28),
              //                     side:
              //                     const BorderSide(color: Colors.white))),
              //             backgroundColor: MaterialStateProperty.all<Color>(
              //                 Colors.transparent)),
              //         child: const AutoSizeText(TextManager.signUp),
              //       ),
              //       SizedBox(
              //         width: MediaQuery.of(context).size.width * .05,
              //       ),
              //       ElevatedButton(
              //         onPressed: () {},
              //         style: ButtonStyle(
              //             shape:
              //             MaterialStateProperty.all<RoundedRectangleBorder>(
              //                 RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(18.0),
              //                     side:
              //                     const BorderSide(color: Colors.white))),
              //             backgroundColor:
              //             MaterialStateProperty.all<Color>(Colors.white)),
              //         child: const AutoSizeText(TextManager.login,
              //             style: TextStyle(
              //                 color: Colors.black, fontWeight: FontWeight.bold)),
              //       ),
              //     ]),
            ),
            backgroundColor: const Color(0xFF56392D),
            elevation: 0,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Image.asset(
                            ImageAssets.logoAppBar,
                            fit: BoxFit.cover,
                          ),
                        ),
                        CustomTextButton(
                            text: TextManager.aboutUs,
                            function: () {
                              print("AboutUs");
                            }),
                        CustomTextButton(
                            text: TextManager.categories,
                            function: () {
                              print("categories");
                            }),
                        CustomTextButton(
                            text: TextManager.services,
                            function: () {
                              print("services");
                            }),
                        CustomTextButton(
                            text: TextManager.request,
                            function: () {
                              print("request");
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(

                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s28),
                                    side:
                                        const BorderSide(color: Colors.white))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent)),
                    child: const AutoSizeText(TextManager.signUp),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        const BorderSide(color: Colors.white))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    child: const AutoSizeText(TextManager.login,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ]),
          ),
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Form(
              key: _key,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .05),
                          Row(
                            children: const [
                              AutoSizeText(TextManager.welcome,
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700)),
                              AutoSizeText("Back!",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFFF6600))),
                            ],
                          ),
                          const AutoSizeText(TextManager.login,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF3A3A3A))),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          TextFormField(
                            onChanged: (val) {
                              email = val;
                            },
                            validator: emailValidator,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: const SizedBox(),
                                labelText: "Email",
                                labelStyle: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFB7B7B7)),
                                hintText: "*****@***.com",
                                hintStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD0D0D0)),
                                fillColor: const Color(0xFFEDEDED),
                                filled: true),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          TextFormField(
                            onChanged: (val) {
                              pass = val;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Feild is Required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: h,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: const SizedBox(),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      securePass = !securePass;
                                    });
                                  },
                                  icon: securePass
                                      ? const Icon(
                                          Icons.remove_red_eye_outlined,
                                          size: 20,
                                          color: Color(0xFFD0D0D0),
                                        )
                                      : const FaIcon(
                                          FontAwesomeIcons.eyeSlash,
                                          size: 15,
                                          color: Color(0xFFD0D0D0),
                                        ),
                                ),
                                labelText: "Password",
                                labelStyle: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFB7B7B7)),
                                hintText: "Enter your Password",
                                hintStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD0D0D0)),
                                fillColor: const Color(0xFFEDEDED),
                                filled: true),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: securePass,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                                child: const Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                      color: Color(0xFFFF6600),
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             ForgesPassScreen()));
                                }),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .03),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  // setState(() {
                                  //   showSpinner = true;
                                  // });
                                  // api.email = email;
                                  // api.pass = pass;
                                  // await api.login();
                                  //
                                  // Fluttertoast.showToast(
                                  //   msg: api.message_reg,
                                  //   fontSize: 15,
                                  //   toastLength: Toast.LENGTH_SHORT,
                                  //   timeInSecForIosWeb: 10,
                                  // );
                                  // showSpinner = false;
                                  //
                                  // if (api.status_reg == true) {
                                  //   Navigator.pushAndRemoveUntil(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (BuildContext context) =>
                                  //               Nav_Home()),
                                  //       ModalRoute.withName('/'));
                                  // }
                                  // showSpinner = false;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 15,
                                  primary: const Color(0xFFFF6600),
                                  // onPrimary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't Have an Account?",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => SignUpScreen()));
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFFFF6600),
                                        fontWeight: FontWeight.w900),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
