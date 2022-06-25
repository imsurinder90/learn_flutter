import 'package:flutter/material.dart';
import 'package:learn_flutter/models/categories.dart';
import 'package:learn_flutter/utils/utilities.dart';
import 'package:learn_flutter/widgets/image_quote_refresh.dart';
import 'package:learn_flutter/widgets/text_quote_refresh.dart';

class CategoryScrollBar extends StatelessWidget {
  final cats;
  final String which;
  const CategoryScrollBar({Key? key, required this.cats, required this.which})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.fromLTRB(7, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: size.height * 0.10,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cats.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // print("on tap called");
                          if (which == "category") {
                            ImageQuoteRefresh.category.value = cats[index].name;
                          } else {
                            TextQuoteRefresh.category.value = cats[index].name;
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 35.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(cats[index].image)),
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                            ),
                            Text(cats[index].name.toString().capitalize())
                          ],
                        ),
                      );
                    })),
          ],
        ));
  }
}
