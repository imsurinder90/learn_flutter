import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/pages/favorite_image_page.dart';
import 'package:learn_flutter/pages/favorite_text_page.dart';
import 'package:learn_flutter/utils/utilities.dart';
import 'package:learn_flutter/widgets/bottom_menubar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 0,
          // backgroundColor: Colors.blueAccent,
          // elevation: 0,
          // title: Text(
          //   "Favorites",
          //   style: GoogleFonts.lato(
          //     textStyle: TextStyle(color: Colors.white),
          //     fontSize: 16,
          //     shadows: [
          //       Shadow(
          //         color: Colors.black54.withOpacity(0.1),
          //         offset: Offset(1, 1),
          //         blurRadius: 0.2,
          //       ),
          //     ],
          //   ),
          // ),
        ),
        // backgroundColor: Utilities.hexToColor("#A55C1B"),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(0),
                  // padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.blueAccent,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: TabBar(
                          // indicatorPadding: EdgeInsets.all(10),
                          // unselectedLabelColor: Colors.black,
                          // labelColor: Colors.white,
                          // indicatorColor: Colors.red,
                          // indicatorWeight: 10,
                          // indicator: BoxDecoration(
                          //   color: Colors.blueAccent,
                          //   // borderRadius: BorderRadius.circular(60),
                          // ),
                          controller: tabController,
                          tabs: [
                            Tab(
                              child: Row(children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 5),
                                  child: Image.asset(
                                    "assets/images/gallery.png",
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Pictures",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.white),
                                    fontSize: 16,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54.withOpacity(0.1),
                                        offset: Offset(1, 1),
                                        blurRadius: 0.2,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            Tab(
                              child: Row(children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 5),
                                  child: Image.asset(
                                    "assets/images/quote.png",
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Quotes",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.white),
                                    fontSize: 16,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54.withOpacity(0.1),
                                        offset: Offset(1, 1),
                                        blurRadius: 0.2,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [FavImagePage(), FavTextPage()],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottonNavigationWidget());
  }
}
