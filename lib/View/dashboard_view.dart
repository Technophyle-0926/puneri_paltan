import 'package:flutter/material.dart';
import 'package:puneri_paltan/View/photos_seasons_view.dart';
import 'package:puneri_paltan/View/players_view.dart';
import 'package:puneri_paltan/View/video_seasons_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              PhotosSeasonsView(),
              PlayersView(),
              VideoSeasonsView(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.amberAccent,
                  // Colors.amber,
                  // Colors.orangeAccent,
                  Colors.orange,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.blueGrey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.photo_album_outlined),
                  text: 'Photos',
                ),
                Tab(
                  icon: Icon(Icons.groups_outlined),
                  text: 'Squad',
                ),
                Tab(
                  icon: Icon(Icons.video_collection_outlined),
                  text: 'Videos',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
