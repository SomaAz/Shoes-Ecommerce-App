import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Profile",
                  style: Get.textTheme.headline1,
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: Get.mediaQuery.size.width * .25,
                    height: Get.mediaQuery.size.width * .25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/facebook.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sami Balikil",
                        style: Get.textTheme.headline2,
                      ),
                      SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Edit Profile"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildSubtitleText("Contact Details"),
              SizedBox(height: 10),
              buildSettingCard(
                "Email Address",
                suffixText: "samibalikil@gmail.com",
              ),
              buildSettingCard(
                "Password Change",
                suffixText: "*******",
              ),
              SizedBox(height: 20),
              buildSubtitleText("Settings"),
              SizedBox(height: 10),
              buildSettingCard(
                "Dark Mode",
                suffix: Switch(
                  value: false,
                  onChanged: (val) {},
                ),
              ),
              buildSettingCard(
                "Address",
                suffixText: "1901 Thornirdge...",
              ),
              buildSettingCard(
                "Notifications",
                suffix: Switch(
                  value: true,
                  onChanged: (val) {},
                ),
              ),
              buildSettingCard(
                "Language",
                suffixText: "English",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingCard(String text, {Widget? suffix, String? suffixText}) {
    return SizedBox(
      height: Get.mediaQuery.size.height * .1,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Get.textTheme.headline4,
              ),
              suffixText != null
                  ? Text(
                      suffixText,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : suffix ?? SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubtitleText(text) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        style: Get.textTheme.headline2,
        textAlign: TextAlign.left,
      ),
    );
  }
}
