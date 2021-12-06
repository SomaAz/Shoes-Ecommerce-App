import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:shoes_ecommerce_app/view/auth/login_view.dart';
import 'package:shoes_ecommerce_app/view/widgets/custom_button.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Container(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign Up",
                          style: Get.theme.textTheme.headline1,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Create a new account",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ),
                      SizedBox(height: 30),
                      buildSocialLogos(),
                      SizedBox(height: 20),
                      Text("Or"),
                      SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey),
                                  ),
                                  // hintStyle: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                onSaved: (val) {
                                  controller.name = val;
                                },
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please fill this field";
                                  }
                                  return null;
                                }),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                ),
                                // hintStyle: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              onSaved: (val) {
                                controller.email = val;
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please fill this field";
                                }
                                if (!val.contains("@")) {
                                  return "Please write the email correctly";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.grey),
                                ),
                                // hintStyle: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              onSaved: (val) {
                                controller.password = val;
                              },
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please fill this field";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey),
                                  ),
                                  // hintStyle: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please confirm the password";
                                  }
                                  if (val != controller.password) {
                                    return "Please confirm the password correctly";
                                  }
                                  return null;
                                }),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                        text: "Sign Up",
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            controller.signup();
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Have an Account?"),
                          TextButton(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Get.theme.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: () => Get.offAll(() => LoginView()),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      })),
    );
  }

  Widget buildSocialLogos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            child: Image.asset(
              "assets/images/google.png",
              scale: 1.4,
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              )),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            child: Image.asset(
              "assets/images/facebook.png",
              scale: 1.4,
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              )),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
