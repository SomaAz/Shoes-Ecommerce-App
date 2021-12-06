import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:shoes_ecommerce_app/view/auth/sign_up_view.dart';
import 'package:shoes_ecommerce_app/view/widgets/custom_button.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Container(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Login",
                              style: Get.theme.textTheme.headline1,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Get into your account",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
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
                                      hintText: "Email",
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.grey),
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
                                      return null;
                                    }),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.grey),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomButton(
                            text: "Login",
                            onPressed: () {
                              _formKey.currentState!.save();
                              if (_formKey.currentState!.validate()) {
                                controller.login();
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't Have an Account?"),
                              TextButton(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Get.theme.primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onPressed: () => Get.off(() => SignUpView()),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
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
