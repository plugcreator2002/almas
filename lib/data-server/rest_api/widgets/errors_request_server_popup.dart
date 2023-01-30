// import 'package:almas/config/languages/extension/tr.dart';
// import 'package:almas/controllers/public/system_controller.dart';
// import 'package:almas/data-server/rest_api/error_handler.dart';
// import 'package:almas/ui_related/buttons/main_button_mobile.dart';
// import 'package:flutter/material.dart';
// import 'package:psr_base/ui_related/space_between.dart';
//
// class ErrorsRequestServerPopup extends StatelessWidget {
//   final double? width;
//   final List errors;
//   final int? statusCode;
//   final void Function(int? statusCode)? callback;
//
//   const ErrorsRequestServerPopup({
//     Key? key,
//     required this.errors,
//     this.statusCode,
//     this.width,
//     this.callback,
//   }) : super(key: key);
//
//   List<Widget> get _widgets {
//     final widgets = <Widget>[];
//
//     try {
//       for (int i = 0; i < errors.length; i++) {
//         if (errors[i] is String) {
//           widgets.add(Padding(
//             padding: const EdgeInsets.only(right: 8, top: 15),
//             child: Text(
//               errors[i].toString(),
//               style: TextStyle(
//                 fontSize: 14,
//                 color: SystemHandler.theme.upsideSystem,
//                 fontFamily: SystemHandler.family,
//               ),
//             ),
//           ));
//         } else if (errors[i] is Map) {
//           final map = errors[i] as Map;
//
//           for (final entry in map.entries) {
//             widgets.add(Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (entry.value is List) ...[
//                   ...(entry.value as List).map((error) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8, top: 15),
//                       child: Text(
//                         "$error",
//                         style: TextStyle(
//                           fontFamily: SystemHandler.family,
//                           fontSize: 13,
//                           color: SystemHandler.theme.upsideSystem,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ] else if (entry.value is String) ...[
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 8),
//                       child: Text(
//                         entry.value,
//                         style: TextStyle(
//                           fontFamily: SystemHandler.family,
//                           fontSize: 13,
//                           color: SystemHandler.theme.upsideSystem,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ],
//             ));
//           }
//         }
//       }
//     } catch (e) {
//       return widgets;
//     }
//     return widgets;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (statusCode != null) ...[
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 ErrorHandler.getStatusCodeTitle(statusCode),
//                 style: TextStyle(
//                   fontFamily: SystemHandler.family,
//                   color: SystemHandler.theme.upsideSystem,
//                   fontSize: 17,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//           ],
//           ListBody(children: _widgets),
//           intermediate(18),
//           MainButtonMobile(
//             label: "close".tr,
//             onTap: () {
//               if (callback != null) {
//                 (callback ?? (_) {})(statusCode);
//               } else {
//                 if (statusCode == 401) {
//                   // Navigator.of(context).popAndPushNamed(RouteName.login);
//                 } else {
//                   Navigator.of(context).pop();
//                 }
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
