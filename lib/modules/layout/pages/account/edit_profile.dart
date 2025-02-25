import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/theme/color_palette.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_feild.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final List<String> avatarList = [
    "assets/images/character/gamer (1).png",
    "assets/images/character/gamer (1) (1).png",
    "assets/images/character/gamer (1) (2).png",
    "assets/images/character/gamer (1) (3).png",
    "assets/images/character/gamer (1) (4).png",
    "assets/images/character/gamer (1) (5).png",
    "assets/images/character/gamer (1) (6).png",
    "assets/images/character/gamer (1) (7).png",
    "assets/images/character/gamer (1) (8).png",
  ];

  String selectedAvatar = "assets/images/character/gamer (1) (8).png";

  void _showAvatarSelection() {
    showModalBottomSheet(
      backgroundColor: ColorPalette.generalGreyColor,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 300,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: avatarList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatar = avatarList[index];
                  });
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(avatarList[index]),
                  radius: 40,
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorPalette.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: ColorPalette.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            GestureDetector(
              onTap: _showAvatarSelection,
              child: CircleAvatar(
                backgroundImage: AssetImage(selectedAvatar),
                radius: 75,
              ),
            ),
            SizedBox(height: 20),
            CustomTextField(
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    hint: "Name",
                    prefixIcon: Icon(Icons.person, color: ColorPalette.white))
                .setHorizontalPadding(context, 0.03)
                .setVerticalPadding(context, 0.01),
            CustomTextField(
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your Phone Number";
                }
                return null;
              },
              hint: "Phone Number",
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.phoneIcon),
                color: ColorPalette.white,
              ),
            )
                .setHorizontalPadding(context, 0.03)
                .setVerticalPadding(context, 0.01),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    color: ColorPalette.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 140),
            CustomElevatedButton(
              text: "Delete Account",
              onTap: () {},
              isNext: false,
            )
                .setVerticalPadding(context, 0.02)
                .setHorizontalPadding(context, 0.03),
            CustomElevatedButton(
              text: "Update Data",
              onTap: () {},
            ).setHorizontalPadding(context, 0.03),
          ],
        ),
      ),
    );
  }
}
