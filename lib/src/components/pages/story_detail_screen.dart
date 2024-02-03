// import 'package:deborduurshop/src/utils/snackbar_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class StoryDetailScreen extends StatefulWidget {
//   const StoryDetailScreen({
//     Key? key,
//     required this.pdf,
//     required this.story,
//     required this.imageUrl,
//   }) : super(key: key);
//
//   final String pdf;
//   final String story;
//   final String imageUrl;
//
//   @override
//   State<StoryDetailScreen> createState() => StoryDetailScreenState();
// }
//
// class StoryDetailScreenState extends State<StoryDetailScreen> {
//   var _isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     pdfInit();
//   }
//
//   Future<void> pdfInit() async {
//     _isLoading = false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     print(widget.imageUrl);
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () async {
//           await Clipboard.setData(ClipboardData(text: widget.story));
//           if (!mounted) return;
//           $showSnackBar(context, 'Story Copied');
//         },
//         label: const Text(
//           'Copy this Story',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       appBar: AppBar(title: const Text('Story Detail')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
//               child: Container(
//                 width: double.infinity,
//                 height: 300,
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.network(
//                     widget.imageUrl,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               height: 400,
//               width: double.infinity,
//               child: SfPdfViewer.network(
//                 widget.pdf,
//                 pageLayoutMode: PdfPageLayoutMode.continuous,
//                 enableDoubleTapZooming: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
