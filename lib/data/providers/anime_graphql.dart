class QueryMutationAnime {
  // ====================================================================
  // Get Trending Animes
  // ====================================================================
  String getTrending() {
    return """
      query getTrending(\$page: Int!, \$perPage: Int!) {
        Page(
          page: \$page,
          perPage: \$perPage,
        ) {
          media(
            averageScore_greater: 80,
            type: ANIME,
            sort: SCORE_DESC,
            seasonYear: 2020,
          ) {
            id,
            title  {
              userPreferred
            },
            averageScore,
            episodes,
            type,
            coverImage {
              large
            },
            bannerImage,
          }
        }
      }
    """;
  }

  // ====================================================================
  // Get Trending Animes
  // ====================================================================
  String getPopular() {
    return """
      query getPopular(
        \$page: Int!, 
        \$perPage: Int!, 
        \$season: MediaSeason!,
        \$seasonYear: Int!,
      ) {
        Page(
          page: \$page,
          perPage: \$perPage,
        ) {
          media(
            averageScore_greater: 70,
            sort: SCORE_DESC,
            type: ANIME,
            season: \$season,
            seasonYear: \$seasonYear,
          ) {
            id,
            title  {
              userPreferred
            },
            averageScore,
            episodes,
            type,
            coverImage {
              large
            },
          }
        }
      }
    """;
  }

  // ====================================================================
  // Get Upcoming Next Season Animes
  // ====================================================================
  String getUpcoming() {
    return """
      query getUpcoming(
        \$page: Int!, 
        \$perPage: Int!, 
        \$season: MediaSeason!,
        \$seasonYear: Int!,
      ) {
        Page(
          page: \$page,
          perPage: \$perPage,
        ) {
          media(
            sort: POPULARITY_DESC,
            type: ANIME,
            season: \$season,
            seasonYear: \$seasonYear,
          ) {
            id,
            title  {
              userPreferred
            },
            episodes,
            type,
            coverImage {
              large
            },
          }
        }
      }
    """;
  }

  // ====================================================================
  // Get Anime Info
  // ====================================================================
  String getAnimeInfo() {
    return """
      query getAnimeInfo(
        \$id: Int!, 
      ) {
        Media(
          id: \$id
        ) {
          id,
          title  {
            userPreferred
          },
          episodes,
          type,
          coverImage {
            large,
            color,
          },
          averageScore,
          bannerImage,
          description,
          characters {
            nodes {
              name {
                full
              }
              image {
                medium
              }
            }
          }
          studios {
            nodes {
              name
            }
          },
          genres,
          seasonYear,
        },
      }
    """;
  }
}
