import 'package:flutter/cupertino.dart';

// Libraries
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    uri: "https://graphql.anilist.co",
  );

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: InMemoryCache(),
    ),
  );
}
