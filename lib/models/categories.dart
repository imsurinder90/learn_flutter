class ImageCategoryModel {
  static final cats = [
    ImageCategory(name: "new", image: "assets/images/cats/new.png"),
    ImageCategory(name: "love", image: "assets/images/cats/love.jpg"),
    ImageCategory(name: "people", image: "assets/images/cats/people.png"),
    ImageCategory(name: "life", image: "assets/images/cats/life.png"),
    ImageCategory(name: 'Health', image: 'assets/images/cats/health.png'),
    // ImageCategory(
    //     name: 'Motivational', image: 'assets/images/cats/motivational.png'),
    ImageCategory(name: 'Sad', image: 'assets/images/cats/sad.png'),
    ImageCategory(name: 'Fitness', image: 'assets/images/cats/fitness.png'),
    ImageCategory(
        name: 'Mothers Day', image: 'assets/images/cats/mothers-day.png'),
    ImageCategory(name: 'Workout', image: 'assets/images/cats/workout.png'),
    ImageCategory(name: 'Sunday', image: 'assets/images/cats/sunday.png'),
    ImageCategory(name: 'Respect', image: 'assets/images/cats/respect.png'),
    ImageCategory(
        name: 'Good Morning', image: 'assets/images/cats/good-morning.png'),
    ImageCategory(
        name: 'Steve Jobs', image: 'assets/images/cats/steve-jobs.png'),
    ImageCategory(
        name: 'Bob Marley', image: 'assets/images/cats/bob-marley.png'),
    ImageCategory(
        name: 'Leadership', image: 'assets/images/cats/leadership.png'),
    ImageCategory(name: 'Buddha', image: 'assets/images/cats/buddha.png'),
    ImageCategory(name: 'Happiness', image: 'assets/images/cats/happiness.png'),
    ImageCategory(name: 'Trust', image: 'assets/images/cats/trust.png'),
    ImageCategory(name: 'Travel', image: 'assets/images/cats/travel.png'),
    ImageCategory(name: 'Life', image: 'assets/images/cats/life.png'),
    ImageCategory(
        name: 'John Lewis', image: 'assets/images/cats/john-lewis.jpg'),
    ImageCategory(name: 'Patience', image: 'assets/images/cats/patience.png'),
    ImageCategory(name: 'Teamwork', image: 'assets/images/cats/teamwork.png'),
    ImageCategory(
        name: 'Get Well Soon', image: 'assets/images/cats/get-well-soon.png'),
    ImageCategory(
        name: 'Inspirational', image: 'assets/images/cats/inspirational.png'),
    ImageCategory(
        name: 'Friendship', image: 'assets/images/cats/friendship.png'),
    ImageCategory(name: 'Thank You', image: 'assets/images/cats/thank-you.png'),
    ImageCategory(name: 'Alone', image: 'assets/images/cats/alone.png'),
    ImageCategory(name: 'Dream', image: 'assets/images/cats/dream.png'),
    ImageCategory(name: 'Halloween', image: 'assets/images/cats/halloween.png'),
    ImageCategory(name: 'Women', image: 'assets/images/cats/women.png'),
    // ImageCategory(name: 'Money', image: 'assets/images/cats/money.png'),
    ImageCategory(name: 'Inspiring', image: 'assets/images/cats/inspiring.png'),
    ImageCategory(name: 'Peace', image: 'assets/images/cats/peace.png'),
    ImageCategory(
        name: 'Will Smith', image: 'assets/images/cats/will-smith.png'),
    ImageCategory(name: 'Food', image: 'assets/images/cats/food.png'),
    ImageCategory(name: 'Fear', image: 'assets/images/cats/fear.png'),
    ImageCategory(name: 'Fashion', image: 'assets/images/cats/fashion.png'),
    ImageCategory(name: 'Smile', image: 'assets/images/cats/smile.png'),
    ImageCategory(name: 'Dance', image: 'assets/images/cats/dance.png'),
    ImageCategory(name: 'Christmas', image: 'assets/images/cats/christmas.png'),
    ImageCategory(name: 'Believe', image: 'assets/images/cats/believe.png'),
    ImageCategory(
        name: 'Loneliness', image: 'assets/images/cats/loneliness.png'),
    ImageCategory(name: 'Gym', image: 'assets/images/cats/gym.png'),
    ImageCategory(name: 'Happy', image: 'assets/images/cats/happy.png'),
    ImageCategory(
        name: 'Life Is Short', image: 'assets/images/cats/life-is-short.png'),
    ImageCategory(
        name: 'Discipline', image: 'assets/images/cats/discipline.png'),
    ImageCategory(name: 'Love', image: 'assets/images/cats/love.jpg'),
    ImageCategory(
        name: 'Photography', image: 'assets/images/cats/photography.png'),
    ImageCategory(
        name: 'Be Yourself', image: 'assets/images/cats/be-yourself.png'),
    ImageCategory(
        name: 'Good Night', image: 'assets/images/cats/good-night.png'),
    // ImageCategory(name: 'Success', image: 'assets/images/cats/success.png'),
    ImageCategory(name: 'Elon Musk', image: 'assets/images/cats/elon-musk.png'),
    ImageCategory(name: 'Failure', image: 'assets/images/cats/failure.png'),
    ImageCategory(
        name: 'You Can Do It', image: 'assets/images/cats/you-can.png'),
    ImageCategory(name: 'Education', image: 'assets/images/cats/education.png'),
    ImageCategory(
        name: 'Yogi Berra', image: 'assets/images/cats/yogi-berra.png'),
    ImageCategory(name: 'Wisdom', image: 'assets/images/cats/wisdom.png'),
    ImageCategory(
        name: 'Never Give Up', image: 'assets/images/cats/never-give-up.png'),
    ImageCategory(name: 'Feminism', image: 'assets/images/cats/feminism.png'),
    ImageCategory(name: 'Marriage', image: 'assets/images/cats/marriage.png'),
    ImageCategory(name: 'Nature', image: 'assets/images/cats/nature.png'),
    ImageCategory(name: 'Humanity', image: 'assets/images/cats/humanity.png'),
    ImageCategory(name: 'Positive', image: 'assets/images/cats/positivity.png'),
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
    TextCategory(name: 'Fitness', image: 'assets/images/cats/fitness.png'),
    TextCategory(name: "love", image: "assets/images/cats/love.jpg"),
    TextCategory(name: "life", image: "assets/images/cats/life.png"),
    TextCategory(name: 'Faith', image: 'assets/images/cats/believe.png'),
    TextCategory(name: 'Dreams', image: 'assets/images/cats/dream.png'),
    TextCategory(
        name: 'Inspirational', image: 'assets/images/cats/inspirational.png'),
    TextCategory(name: 'Happiness', image: 'assets/images/cats/happiness.png'),
    TextCategory(name: 'Success', image: 'assets/images/cats/success.png'),
    TextCategory(
        name: 'Friendship', image: 'assets/images/cats/friendship.png'),
    TextCategory(name: 'Failure', image: 'assets/images/cats/failure.png'),
    TextCategory(name: 'Marriage', image: 'assets/images/cats/marriage.png'),
    TextCategory(name: 'Alone', image: 'assets/images/cats/alone.png'),
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
