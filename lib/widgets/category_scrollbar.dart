import 'package:flutter/material.dart';
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
        height: 70,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              offset: Offset(0.0, 1.5),
              blurRadius: 2,
              spreadRadius: -1.9,
              color: Color(0x33000000)),
        ], color: Theme.of(context).canvasColor),
        padding: EdgeInsets.only(left: 10),
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            if (which == "image") {
                              ImageQuoteRefresh.category.value =
                                  cats[index].name;
                            } else {
                              TextQuoteRefresh.category.value =
                                  cats[index].name;
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              ),
                              Text(cats[index].name.toString().capitalize()),
                            ],
                          ),
                        ),
                      );
                    })),
          ],
        ));
  }
}
