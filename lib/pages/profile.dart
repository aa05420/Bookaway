import 'package:book_shop/data/json.dart';
import 'package:flutter/material.dart';
import 'package:book_shop/pages/user.dart';
import 'package:book_shop/theme/user_preferences.dart';
import 'package:book_shop/widgets/appBar.dart';
import 'package:book_shop/widgets/buttons.dart';
import 'package:book_shop/widgets/numbers.dart';
import 'package:book_shop/widgets/profile.dart';

import 'package:book_shop/widgets/libCover.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Color(0xffafdbde), //<-- SEE HERE
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 5),
          buildName(user),
          const SizedBox(height: 5),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 20),
          NumbersWidget(),
          const SizedBox(height: 20),
          buildAbout(user),
          const SizedBox(height: 20),
          booklib(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Edit Profile',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

Widget booklib(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Books Bought',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 0),
            child: getBooks(),
          ),
        ],
      ),
    );

getBooks() {
  return SingleChildScrollView(
    padding: EdgeInsets.only(bottom: 5, left: 5),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
          booksBought.length, (index) => LibCover(book: booksBought[index])),
    ),
  );
}
