// import 'package:almas/models/private/posts/posts_response.dart';
// import 'package:almas/models/public/enums.dart';
// import 'package:almas/models/public/pagination_related/pagination_parameters.dart';
// import 'package:almas/providers/config/parent_provider.dart';
// import 'package:almas/requests/posts/posts_chosen.dart';
// import 'package:flutter/widgets.dart';
//
// class PostParentPresenter extends ParentProvider {
//   late PostsFilteredHandler timeline;
//   // final chosen = PostsFilteredHandler();
//   // final popular = PostsFilteredHandler();
//   // final trends = PostsFilteredHandler();
//   // final explore = PostsFilteredHandler();
//
//   // void handlePostFilling(
//   //   PostsType type,
//   //   dynamic response, [
//   //   PaginationParameters? pagination,
//   // ]) {
//   //   switch (type) {
//   //     case PostsType.timeline:
//   //       setTimeline(response, pagination);
//   //       break;
//   //     case PostsType.chosen:
//   //       setChosen(response, pagination);
//   //       break;
//   //     case PostsType.popular:
//   //       setPopular(response, pagination);
//   //       break;
//   //     case PostsType.trends:
//   //       setTrends(response, pagination);
//   //       break;
//   //     case PostsType.explore:
//   //       setExplore(response, pagination);
//   //       break;
//   //     default:
//   //   }
//   // }
//   //
//   // void setTimeline(
//   //   dynamic response,
//   //   PaginationParameters? pagination,
//   // ) {
//   //   final result = PostsResponse.fromJson(
//   //     json: response,
//   //     data: timeline.data,
//   //     pagination: pagination,
//   //   );
//   //
//   //   timeline = result;
//   //   notifyListeners();
//   // }
//   //
//   // void setChosen(
//   //   dynamic response,
//   //   PaginationParameters? pagination,
//   // ) {
//   //   final result = PostsResponse.fromJson(
//   //     json: response,
//   //     data: chosen.data,
//   //     pagination: pagination,
//   //   );
//   //
//   //   chosen = result;
//   //   notifyListeners();
//   // }
//   //
//   // void setPopular(
//   //   dynamic response,
//   //   PaginationParameters? pagination,
//   // ) {
//   //   final result = PostsResponse.fromJson(
//   //     json: response,
//   //     data: popular.data,
//   //     pagination: pagination,
//   //   );
//   //
//   //   popular = result;
//   //   notifyListeners();
//   // }
//   //
//   // void setTrends(
//   //   dynamic response,
//   //   PaginationParameters? pagination,
//   // ) {
//   //   final result = PostsResponse.fromJson(
//   //     json: response,
//   //     data: trends.data,
//   //     pagination: pagination,
//   //   );
//   //
//   //   trends = result;
//   //   notifyListeners();
//   // }
//   //
//   // void setExplore(
//   //   dynamic response,
//   //   PaginationParameters? pagination,
//   // ) {
//   //   final result = PostsResponse.fromJson(
//   //     json: response,
//   //     data: explore.data,
//   //     pagination: pagination,
//   //   );
//   //
//   //   explore = result;
//   //   notifyListeners();
//   // }
// }
//
// class PostsFilteredHandler {
//   final VoidCallback callback;
//   PostsType type = PostsType.explore;
//   PostsResponse posts = PostsResponse();
//
//   PostsFilteredHandler({required this.callback});
//
//   Future<void> get([PaginationParameters? pagination]) async {
//     final response = await PostsService.findPosts(type, pagination);
//
//     final result = PostsResponse.fromJson(
//       json: response,
//       data: posts.data,
//       pagination: pagination,
//     );
//
//     posts = result;
//     // notifyListeners();
//   }
//
//   void create() {}
//
//   void update() {}
//
//   void delete() {}
//
//   void like() {}
//
//   void unlike() {}
// }
