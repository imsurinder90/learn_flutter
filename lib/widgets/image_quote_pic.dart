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
    return Flexible(
      child: CachedNetworkImage(
        fadeInDuration: const Duration(milliseconds: 0),
        fit: BoxFit.cover,
        imageUrl: image,
        placeholder: (context, url) => Image.asset(
          'assets/images/plholder.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
