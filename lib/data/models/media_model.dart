// Libraries
import 'package:html/parser.dart';

class MediaModel {
  int id, episodes, averageScore, seasonYear;
  String title, type, bannerImage, description;
  CoverImage coverImage;
  List<String> genres;
  List<Character> characters;
  List<Studio> studios;

  MediaModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    episodes = json["episodes"];
    title = json["title"]["userPreferred"];
    type = json["type"];
    bannerImage = json["bannerImage"];
    seasonYear = json["seasonYear"];
    description = _parseHtmlString(json["description"]);
    genres = json["genres"] != null
        ? (json["genres"] as List).map((e) => e.toString()).toList()
        : null;
    coverImage = CoverImage.fromJson(json["coverImage"]);
    characters = json["characters"] != null
        ? (json["characters"]["nodes"] as List)
            .map((e) => Character.fromJson(e))
            .toList()
        : null;
    studios = json["studios"] != null
        ? (json["studios"]["nodes"] as List)
            .map((e) => Studio.fromJson(e))
            .toList()
        : null;
    averageScore = json["averageScore"] != null
        ? (((json["averageScore"] * 5) / 100) as double).round()
        : null;
  }

  // =====================================================================
  // Parse Html
  // =====================================================================
  String _parseHtmlString(String htmlString) {
    if (htmlString == null) return "";

    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  // =====================================================================
  // Get Format List Studios
  // =====================================================================
  String studiosFormat() {
    if (studios == null) return "";

    String format = "";

    for (var i = 0; i < studios.length; i++) {
      format += studios[i].name;

      if (i != (studios.length - 1)) {
        format += ", ";
      }
    }

    return format;
  }

  // =====================================================================
  // Get Format List Genres
  // =====================================================================
  String genresFormat() {
    if (genres == null) return "";

    String format = "";

    for (var i = 0; i < genres.length; i++) {
      format += genres[i];

      if (i != (genres.length - 1)) {
        format += ", ";
      }
    }

    return format;
  }
}

// =====================================================================
// Cover Image Model
// =====================================================================
class CoverImage {
  String extraLarge, large, medium, color;

  CoverImage.fromJson(Map<String, dynamic> json) {
    extraLarge = json["extraLarge"];
    large = json["large"];
    medium = json["medium"];
    color = json["color"];
  }
}

// =====================================================================
// Character Model
// =====================================================================
class Character {
  String name, image;

  Character.fromJson(Map<String, dynamic> json) {
    name = json["name"]["full"];
    image = json["image"]["medium"];
  }
}

// =====================================================================
// Studio Model
// =====================================================================
class Studio {
  String name;

  Studio.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}
