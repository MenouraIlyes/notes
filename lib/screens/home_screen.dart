import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:notes/shared/colors.dart';
import 'package:notes/widgets/custom_note_card.dart';
import 'package:notes/widgets/custom_search_field.dart';
import 'package:notes/widgets/custom_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Background
          Stack(alignment: Alignment.topCenter, children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: appBackground,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Picture & Greetings
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Greetings
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Random User',
                            style: TextStyle(
                              color: appWhite,
                              fontSize: 20,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "What's on your mind?",
                            style: TextStyle(
                              color: appWhite,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      // Profile Picture
                      Container(
                        height: 60,
                        width: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/default_pfp.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Search bar
                  SizedBox(height: 20),
                  CustomSearchField(
                    hintField: "Search notes",
                    backgroundColor: appWhite,
                  ),
                ],
              ),
            ),
          ]),

          // Title
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // title
                CustomTitle(
                  title: 'Today',
                  extend: true,
                ),
                SizedBox(
                  height: 10,
                ),
                // note card
                CustomNoteCard(
                  title: 'Bootcamp',
                  content: 'This is an example of a note app',
                  onFavoritePressed: () {},
                  timestamp: '06/02/2025',
                ),

                SizedBox(
                  height: 10,
                ),
                // note card
                CustomNoteCard(
                  title: 'Example2',
                  content: 'This is an example 2 of a note app',
                  onFavoritePressed: () {},
                  timestamp: '06/02/2025',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: TabBarView(
        controller: _motionTabBarController,
        children: [
          getBody(), // Home
          Center(child: Text("Favorites Page")), // Favorites
          Center(child: Text("Profile Page")), // Profile
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        labels: ["Home", "Favorites", "Profile"],
        initialSelectedTab: "Home",
        tabIconColor: Colors.grey,
        tabSelectedColor: appBackground,
        icons: [Icons.home, Icons.favorite, Icons.person],
        textStyle: TextStyle(color: appBackground, fontWeight: FontWeight.bold),
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    super.dispose();
  }
}
