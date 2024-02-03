import 'dart:io' as io;
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:convert';

class StoryDetailPage extends StatelessWidget {
  StoryDetailPage({super.key, required this.imagePath, required this.text});
  final dynamic imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    // print('pdf link is: : :${pdfLink}');
    print(imagePath);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff18110e),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () async {
                if (kIsWeb) {
                  ///
                  /// below text is downloading in pdf
                  ///
                  ///
                  // format text necessary because the whole paragraph was showing in the
                  // one line due to which only that text in boundaries of page was showing and other
                  // text was cutting off.......
                  String formatText(String originalText, int wordsPerLine) {
                    List<String> words = originalText.split(' ');

                    for (int i = wordsPerLine;
                        i < words.length;
                        i += wordsPerLine + 1) {
                      words.insert(i, '\n');
                    }

                    return words.join(' ');
                  }

                  try {
                    final formattedText = formatText(text, 15);

                    final PdfDocument document = PdfDocument();

                    if (formattedText.length > 2515) {
                      String chunk1 = formattedText.substring(0, 2515);
                      document.pages.add().graphics.drawString(
                            chunk1,
                            PdfStandardFont(PdfFontFamily.helvetica, 12),
                            brush: PdfSolidBrush(PdfColor(0, 0, 0)),
                          );
                      String chunk2 = formattedText.substring(2515);
                      print(chunk2.length);
                      document.pages.add().graphics.drawString(
                            chunk2,
                            PdfStandardFont(PdfFontFamily.helvetica, 12),
                            brush: PdfSolidBrush(PdfColor(0, 0, 0)),
                          );

                      if (formattedText.length > 5030) {
                        String chunk3 = formattedText.substring(5030);
                        print(chunk3.length);
                        document.pages.add().graphics.drawString(
                              chunk3,
                              PdfStandardFont(PdfFontFamily.helvetica, 12),
                              brush: PdfSolidBrush(PdfColor(0, 0, 0)),
                            );
                      }
                    } else {
                      document.pages.add().graphics.drawString(
                            formattedText,
                            PdfStandardFont(PdfFontFamily.helvetica, 12),
                            brush: PdfSolidBrush(PdfColor(0, 0, 0)),
                          );
                    }

                    final List<int> bytes = await document.save();
                    //Download the output file
                    if (kIsWeb) {
                      html.AnchorElement(
                          href:
                              "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
                        ..setAttribute("download", "output.pdf")
                        ..click();
                    }
                    document.dispose();
                  } catch (e) {
                    print('error in downloading pdf');
                    print(e);
                  }
                } else {
                  final pdf = pw.Document();
                  final image =
                      pw.MemoryImage(io.File(imagePath).readAsBytesSync());
                  pdf.addPage(pw.Page(
                      build: (context) => pw.Column(
                              mainAxisSize: pw.MainAxisSize.min,
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.SizedBox(
                                    width: 400,
                                    height: 400,
                                    child: pw.Image(image)),
                                pw.Text(text.toString().length >= 1200
                                    ? text.toString().substring(0, 1200)
                                    : text.toString()),
                              ])));
                  pdf.addPage(pw.Page(
                    build: (context) => pw.Text(text.toString().length >= 1200
                        ? text
                            .toString()
                            .substring(50, text.toString().length - 1)
                        : text.toString()),
                  ));
                  final bytes = await pdf.save();

                  // Download the PDF
                  final path = (await getExternalStorageDirectory())!.path;
                  final file = io.File('$path/story.pdf');
                  await file.writeAsBytes(bytes, flush: true);

                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PDF Downloaded')),
                  );
                  OpenFile.open(file.path);
                  print('opening the pdf');
                }
              },
              icon: const Icon(Icons.download),
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white70),
        backgroundColor: const Color(0xff22130f),
        title: const Text(
          'Story Detail Screen',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: SizedBox(
                width: kIsWeb ? size.width * 0.65 : size.width * 0.9,
                height: kIsWeb ? size.width * 0.5 : size.height * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: kIsWeb
                      ? Image.network(imagePath, fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                          print(
                              "🖼🏡in details page Image Path For Web Is: error: $error, stackTrace:$stackTrace, ImagePath:$imagePath");
                          return Image.network(
                            "https://thebulletin.org/wp-content/uploads/2023/10/Spot-the-bot-v1.png",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(error.toString());
                            },
                          );
                        })
                      : Image.file(
                          io.File(imagePath),
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              "https://thebulletin.org/wp-content/uploads/2023/10/Spot-the-bot-v1.png",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Text(error.toString());
                              },
                            );
                          },
                        ),
                ),
              ),
            ),
            // Text("👉" + imagePath.toString()),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Container(
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: const Color(0xff2b1f17),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        text,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize:
                              kIsWeb ? size.width * 0.02 : size.width * 0.03,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.12),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(
            Icons.copy_sharp,
            color: Colors.brown.shade900.withOpacity(0.9),
          ),
          backgroundColor: const Color(0xfff6ad80),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: text));
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Story Text Copied')));
          },
          label: Text(
            'Copy',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.brown.shade900.withOpacity(0.9)),
          )),
    );
  }
}
