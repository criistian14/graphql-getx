class Seasons {
  static final String winter = "WINTER"; // Dec to Feb
  static final String spring = "SPRING"; // Mar to May
  static final String summer = "SUMMER"; // Jun to Aug
  static final String fall = "FALL"; // Sep to Nov
}

class Season {
  String season;
  int year;

  Season.current() {
    DateTime currentTime = DateTime.now();
    year = currentTime.year;

    if (currentTime.month >= DateTime.december &&
        currentTime.month <= DateTime.february) {
      season = Seasons.winter;
    } else if (currentTime.month >= DateTime.march &&
        currentTime.month <= DateTime.may) {
      season = Seasons.spring;
    } else if (currentTime.month >= DateTime.june &&
        currentTime.month <= DateTime.august) {
      season = Seasons.summer;
    } else if (currentTime.month >= DateTime.september &&
        currentTime.month <= DateTime.november) {
      season = Seasons.fall;
    }
  }

  Season.next({
    Season current,
  }) {
    if (current.season == Seasons.winter) {
      this.season = Seasons.spring;
      this.year = current.year;
    } else if (current.season == Seasons.spring) {
      this.season = Seasons.spring;
      this.year = current.year;
    } else if (current.season == Seasons.summer) {
      this.season = Seasons.fall;
      this.year = current.year;
    } else if (current.season == Seasons.fall) {
      this.season = Seasons.winter;
      this.year = current.year + 1;
    }
  }
}
