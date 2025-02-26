import 'package:flutter/material.dart';
import 'package:movies_app/core/extensions/padding.dart';
import 'package:movies_app/core/routes/pages_route_name.dart';
import 'package:movies_app/core/theme/color_palette.dart';
import 'package:movies_app/main.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(

          children: [
            SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              color: ColorPalette.generalGreyColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/character/gamer (1).png"),
                          radius: 59,
                        ),
                        Text(
                          "Abdalla Nashat",
                          style: TextStyle(
                            color: ColorPalette.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ).setVerticalPadding(context, 0.01),
                      ]),
                      Column(
                        children: [
                          Text(
                            "12",
                            style: TextStyle(
                              color: ColorPalette.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                          ),
                          Text("Wish List",
                            style: TextStyle(
                              color: ColorPalette.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),)
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "10",
                            style: TextStyle(
                              color: ColorPalette.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                          ),
                          Text("History",
                            style: TextStyle(
                              color: ColorPalette.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPalette.primaryColor,
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius
                                .circular(15)),
                            side: BorderSide(
                              color: ColorPalette.primaryColor,
                            )),
                        onPressed: () {
                          navigatorKey.currentState!
                              .pushNamed(PagesRouteName.editProfile);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("    Edit Profile    ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ).setVerticalPadding(context, 0.015),
                          ],
                        ),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPalette.red,
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius
                                .circular(15)),
                            side: BorderSide(
                              color: ColorPalette.red,
                            )),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Exit",
                              style: TextStyle(
                                  color: ColorPalette.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ).setVerticalPadding(context, 0.015),
                          ],
                        ),),

                    ],
                  ),

                  TabBar(
                    indicatorColor: ColorPalette.primaryColor,
                    labelColor: ColorPalette.primaryColor,
                    unselectedLabelColor: ColorPalette.primaryColor,
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.list),
                        text: "Watch List",
                      ),
                      Tab(
                        icon: Icon(Icons.folder),
                        text: "History",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    // child: Image(image: AssetImage("assets/images/Empty.png"))
                  ),
                  Center(
                    child: Text(
                      "History Content",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
