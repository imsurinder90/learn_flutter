class ImageCategoryModel {
  static final cats = [
    ImageCategory(name: "new", image: "assets/images/cats/new.png"),
    ImageCategory(name: "fire", image: "assets/images/cats/fire.png"),
    ImageCategory(name: "love", image: "assets/images/cats/love.jpg"),
    ImageCategory(name: "people", image: "assets/images/cats/people.png"),
    ImageCategory(name: "life", image: "assets/images/cats/life.png"),
    ImageCategory(
        name: "compassion", image: "assets/images/cats/compassion.png"),
  ];

  static String getImgCatByImages(String name) {
    var img = "assets/images/cats/compassion.png";
    for (ImageCategory cat in cats) {
      if (cat.name == name) {
        img = cat.image;
        break;
      }
    }
    return img;
  }
}

class ImageCategory {
  String name;
  String image;

  ImageCategory({required this.name, required this.image});
}

class TextCategoryModel {
  static final cats = [
    TextCategory(name: "new", image: "assets/images/cats/new.png"),
    TextCategory(name: "fire", image: "assets/images/cats/fire.png"),
    TextCategory(name: "age", image: "assets/images/cats/love.jpg"),
    TextCategory(name: "person", image: "assets/images/cats/people.png"),
    TextCategory(name: "life", image: "assets/images/cats/life.png"),
    TextCategory(
        name: "compassion", image: "assets/images/cats/compassion.png"),
  ];

  static String getImgCatByText(String name) {
    var img = "assets/images/cats/compassion.png";
    for (TextCategory cat in cats) {
      if (cat.name == name) {
        img = cat.image;
        break;
      }
    }
    return img;
  }
}

class TextCategory {
  String name;
  String image;

  TextCategory({required this.name, required this.image});
}
