import 'package:flutter/material.dart';
import 'package:learn_flutter/models/categories.dart';
import 'package:learn_flutter/models/image_quotes.dart';
import 'package:learn_flutter/utils/utilities.dart';

class ImageQuoteTitle extends StatelessWidget {
  final List<ImgQuote> data;
  dynamic index;
  ImageQuoteTitle({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cat = data[index].category;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 0.0, 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        AssetImage(ImageCategoryModel.getImgCatByImages(cat)),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                cat.capitalize(),
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
