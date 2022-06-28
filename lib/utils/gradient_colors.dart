import 'dart:math';

class GColors {
  static List<List<String>> items = [
    [
      "#414141",
      "#000000",
    ],
    [
      "#380036",
      "#0CBABA",
    ],
    [
      "#0D324D",
      "#7F5A83",
    ],
    [
      "#233329",
      "#63D471",
    ],
    [
      "#A71D31",
      "#3F0D12",
    ],
    [
      "#28313B",
      "#485461",
    ],
    [
      "#28313B",
      "#AF8C9D",
    ],
    [
      "#D2CCC4",
      "#2F4353",
    ],
    [
      "#5D4954",
      "#FFA69E",
    ],
    [
      "#000000",
      "#923CB5",
    ],
    [
      "#000000",
      "#A55C1B",
    ],
    [
      "#B82E1F",
      "#000000",
    ],
    [
      "#000000",
      "#FFEAA7",
    ],
    [
      "#000000",
      "#E84393",
    ],
    [
      "#000000",
      "#130F40",
    ],
    [
      "#000000",
      "#7ED6DF",
    ],
    [
      "#5E5368",
      "#000000",
    ],
    [
      "#576574",
      "#C2B6B6",
    ],
    [
      "#D58936",
      "#69140E",
    ],
    [
      "#7D6D61",
      "#5E574D",
    ],
    [
      "#422419",
      "#000000",
    ],
    [
      "#12100E",
      "#2B4162",
    ],
    [
      "#5A585A",
      "#090947",
    ],
    [
      "#313131",
      "#6DADDB",
    ],
    [
      "#000000",
      "#4D4855",
    ],
    [
      "#FFAFBD",
      "#FFC3A0",
    ],
    [
      "#FF7E5F",
      "#FEB47B",
    ],
    [
      "#380036",
      "#0CBABA",
    ],
    [
      "#0D324D",
      "#7F5A83",
    ],
    [
      "#A71D31",
      "#3F0D12",
    ],
    [
      "#2C3E50",
      "#000000",
    ],
    [
      "#2A5470",
      "#4C4177",
    ],
  ];

  // Utilities.hexToColor("#0D324D"),
  static getRandomColor() {
    var randomItem = items[Random().nextInt(items.length)];
    return randomItem;
  }

  static getRandomColorAsString() {
    var randomItem = items[Random().nextInt(items.length)].join(",");
    return randomItem;
  }

  // static List<Alignment>
}
