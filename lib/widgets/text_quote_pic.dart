import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/models/text_quote_model.dart';
import 'package:learn_flutter/utils/gradient_colors.dart';
import 'package:learn_flutter/utils/text/text_utils.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:learn_flutter/utils/utilities.dart';

class TextQuotePic extends StatefulWidget {
  final itemKey;
  final TextQuote item;
  const TextQuotePic({Key? key, required this.itemKey, required this.item})
      : super(key: key);

  @override
  State<TextQuotePic> createState() => _TextQuotePicState();
}

class _TextQuotePicState extends State<TextQuotePic> {
  @override
  Widget build(BuildContext context) {
    final splitted = widget.item.colors.split(",");
    List<Color> mColors = [
      Utilities.hexToColor(splitted[0].toString()),
      Utilities.hexToColor(splitted[1].toString())
    ];

    return RepaintBoundary(
      key: widget.itemKey,
      child: Card(
        elevation: 2,
        semanticContainer: true,
        shadowColor: Colors.black,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
              height: 400,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: mColors,
                ),
              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        widget.item.text,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.white),
                          fontSize: (widget.item.text.length > 127) ? 25 : 30,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: Offset(2, 1),
                              blurRadius: 0.9,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "- ${widget.item.author}",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.white),
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: Offset(2, 1),
                              blurRadius: 0.9,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                right: 10.0,
                top: 15.0,
                child: Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.only(left: 10),
                  // ignore: sort_child_properties_last
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    horizontalTitleGap: 5,
                    minLeadingWidth: 0,
                    leading: Icon(Icons.favorite_border_sharp,
                        color: Colors.deepPurpleAccent),
                    title:
                        Text(Utilities.formatNumber(widget.item.likes.toInt())),
                  ),
                  height: 43,
                  width: 85,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(5)),
                )),
          ],
        ),
      ),
    );
  }
}
