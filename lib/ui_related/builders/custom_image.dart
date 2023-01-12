// import 'package:flutter/material.dart';
// import 'package:psr_base/ui_related/builders/safe_state.dart';
//
// class CustomImage extends StatefulWidget {
//   final String image;
//
//   const CustomImage(
//     this.image, {
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   SafeState<CustomImage> createState() => _CustomImageState();
// }
//
// class _CustomImageState extends SafeState<CustomImage> {
//   Widget mainWidget = const CircularProgressIndicator(); // Placeholder widget
//
//   @override
//   void initState() {
//     super.initState();
//
//     Image image = Image.network(widget.image, width: 50, height: 50);
//
//     final ImageStream stream = image.image.resolve(ImageConfiguration.empty);
//
//     stream.addListener(ImageStreamListener((info, call) {
//       if (!completer) {
//         completer = true;
//         setState(() {
//           mainWidget = image;
//         });
//       }
//     }, onError: (dynamic exception, StackTrace? stackTrace) {
//       print('Error is $exception , stack is $stackTrace');
//       setState(() {
//         mainWidget = const Icon(Icons.error); // Error Widget
//       });
//     }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return mainWidget;
//   }
// }
