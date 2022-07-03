import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/models/fav_img_model.dart';
import 'package:learn_flutter/pages/favorite_image_page.dart';
import 'package:learn_flutter/pages/favorite_text_page.dart';
import 'package:learn_flutter/theme/themes.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  static String tab1Title = "Pictures";
  static String tab2Title = "Quotes";
  static String assetPic = "assets/images/gallery.png";
  static String assetQuote = "assets/images/quote.png";

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
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.appBarBgColor,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: TabBar(
              indicatorColor:
                  Theme.of(context).colorScheme.tabBarIndicatorColor,
              controller: tabController,
              tabs: [
                Tab(
                  child: Row(children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.only(right: 5),
                      child: Image.asset(
                        assetPic,
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      tab1Title,
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
                        assetQuote,
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      tab2Title,
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
          Expanded(
              child: Container(
            color: Theme.of(context).bottomAppBarColor,
            child: TabBarView(
              controller: tabController,
              children: [FavImagePage(), FavTextPage()],
            ),
          )),
        ],
      ),
    );
  }
}
