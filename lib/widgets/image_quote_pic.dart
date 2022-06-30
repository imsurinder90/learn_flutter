import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/models/categories.dart';
import 'package:learn_flutter/models/image_quotes.dart';
import 'package:learn_flutter/utils/utilities.dart';

class ImageQuotePic extends StatelessWidget {
  final image;
  const ImageQuotePic({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(255, 192, 192, 192),
      margin: EdgeInsets.only(bottom: 46),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        errorWidget: (context, url, error) => Container(
          color: Color.fromARGB(255, 192, 192, 192),
          height: 320,
          width: MediaQuery.of(context).size.width - 25,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
        ),

        // placeholder: (context, url) => Image.asset(
        //   'assets/images/plholder.png',
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
