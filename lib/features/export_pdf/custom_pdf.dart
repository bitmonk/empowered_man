import 'dart:io';

import 'package:empowered/core/extension/extensions.dart';
import 'package:file_saver/file_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart'; // For sharing

Future<void> exportPdf(
  BuildContext context, {
  required String data,
  required String fromToDate,
  bool shouldShare = false,
}) async {
  // Split data by emotion entries (journals)
  final journalEntries =
      data.split('\n\n\n').where((entry) => entry.trim().isNotEmpty).toList();

  final pdfFiles = <File>[];
  final emotionNames = <String>[];

  // Process each journal entry separately to create individual PDFs
  for (var i = 0; i < journalEntries.length; i++) {
    final journalContent = journalEntries[i];

    // Extract emotion/title and content
    final parts =
        journalContent.split('-------------------------------------------');
    if (parts.length < 2) continue;

    final emotionName = parts[0].trim();
    emotionNames.add(emotionName);
    final journalText = parts[1].trim();

    // Create a new PDF document for this emotion
    final pdf = pw.Document()

    // Add cover page
    ..addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Text(
              'Journal Export: $emotionName',
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              fromToDate,
              style: const pw.TextStyle(
                fontSize: 16,
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'Your Journal Entry',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );

    // Create a multi-paragraph content section
    final paragraphs = <pw.Widget>[pw.Text(
        emotionName,
        style: pw.TextStyle(
          fontSize: 18,
          fontWeight: pw.FontWeight.bold,
        ),
      ), pw.SizedBox(height: 10), pw.Divider(
        thickness: 1,
        color: PdfColors.grey300,
      ), pw.SizedBox(height: 10),]

    // Add emotion title
    

    
    
    ;

    // Process Q&A pairs
    final qaBlocks = journalText
        .split('\n\n')
        .where((block) => block.trim().isNotEmpty)
        .toList();

    for (final qaBlock in qaBlocks) {
      final lines = qaBlock.split('\n');

      for (var j = 0; j < lines.length; j += 2) {
        if (j < lines.length) {
          final question =
              lines[j].startsWith('Q: ') ? lines[j].substring(3) : lines[j];

          paragraphs.add(
            pw.Text(
              question,
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blueGrey800,
              ),
            ),
          );

          if (j + 1 < lines.length) {
            final answer = lines[j + 1].startsWith('A: ')
                ? lines[j + 1].substring(3)
                : lines[j + 1];

            paragraphs..add(pw.SizedBox(height: 4))
            ..add(
              pw.Text(
                answer,
                style: const pw.TextStyle(
                  fontSize: 12,
                ),
              ),
            );
          }

          paragraphs.add(pw.SizedBox(height: 8));
        }
      }
    }

    // Add content pages
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return paragraphs;
        },
      ),
    );

    // Save the PDF for this emotion
    var status = await Permission.storage.isGranted;
    if (!status) await Permission.storage.request();

    var filePath = '';
    if (Platform.isAndroid) {
      var fp = await getExternalStorageDirectory();
      filePath = fp!.path;
    } else if (Platform.isIOS) {
      var fp = await getApplicationSupportDirectory();
      filePath = fp.path;
    }

    // Create sanitized filename from emotion name
    var safeEmotionName = emotionName
        .replaceAll(RegExp(r'[^\w\s]+'), '') // Remove special characters
        .replaceAll(' ', '_') // Replace spaces with underscores
        .toLowerCase();

    final file = File('$filePath/${safeEmotionName}_journal.pdf');
    await file.writeAsBytes(await pdf.save());
    pdfFiles.add(file);
  }

  if (pdfFiles.isEmpty) {
    AppUtils.showErrorSnackbar(message: 'No valid journal data to export');
    return;
  }

  if (shouldShare) {
    if (pdfFiles.length == 1) {
      // Share single PDF
      await Share.shareXFiles([XFile(pdfFiles.first.path)],
          text: 'Here is your ${emotionNames.first} journal export.',);
    } else {
      // Share multiple PDFs
      await Share.shareXFiles(pdfFiles.map((file) => XFile(file.path)).toList(),
          text:
              'Here are your journal exports for ${emotionNames.join(", ")}.',);
    }
  } else {
    try {
      // For downloads, save each file individually
      for (var i = 0; i < pdfFiles.length; i++) {
        final result = await FileSaver.instance.saveAs(
          name: '${emotionNames[i].toLowerCase().replaceAll(' ', '_')}_journal',
          ext: 'pdf',
          file: pdfFiles[i],
          mimeType: Utils().getMimeType('pdf'),
        );
      }

      final message = pdfFiles.length == 1
          ? 'Journal successfully exported'
          : '${pdfFiles.length} journals successfully exported';

      AppUtils.showSnackbar(message: message);
    } catch (e) {
      AppUtils.showSnackbar(message: 'Failed to save journal: $e');
    }
  }
}

// New helper method to build journal entry content
// pw.Widget _buildJournalEntryContent(
//   pw.Context context,
//   String title,
//   String content,
// ) {
//   return pw.Column(
//     crossAxisAlignment: pw.CrossAxisAlignment.start,
//     children: [
//       // Title section
//       pw.Text(
//         title,
//         style: pw.TextStyle(
//           fontSize: 16,
//           fontWeight: pw.FontWeight.bold,
//         ),
//       ),
//       pw.SizedBox(height: 10),

//       // Content section with proper spacing
//       pw.Text(
//         content,
//         style: const pw.TextStyle(
//           fontSize: 12,
//         ),
//         textAlign: pw.TextAlign.justify,
//       ),

//       // Spacer to ensure consistent spacing
//       pw.SizedBox(height: 40),
//     ],
//   );
// }

class Utils {
  MimeType getMimeType(String ext) {
    switch (ext) {
      case 'png':
        return MimeType.png;
      case 'jpg':
        return MimeType.other;
      case 'jpeg':
        return MimeType.jpeg;
      case 'pdf':
        return MimeType.pdf;
      case 'mp4':
        return MimeType.other;
      default:
        return MimeType.other;
    }
  }

  // Optional: handle file saving for other file types (images, videos, etc.)
  fileDownloadBoth(
    BuildContext context, {
    required String fileName,
    required String ext,
    bool doPop = false,
  }) async {
    AppUtils.showSnackbar(message: 'Downloading...');
    if (Platform.isIOS || Platform.isAndroid) {
      var status = await Permission.storage.isGranted;

      if (!status) await Permission.storage.request();
    }
    var filePath = '';
    if (Platform.isAndroid) {
      var fp = await getExternalStorageDirectory();
      filePath = fp!.path;
    }
    if (Platform.isIOS) {
      var fp = await getApplicationSupportDirectory();
      filePath = fp.path;
    }

    await FileSaver.instance
        .saveAs(
      name: fileName,
      ext: ext,
      file: File('$filePath/AdditiveFree'),
      mimeType: getMimeType(ext),
    )
        .then((value) {
      // UiHelper.showToast('File successfully saved');
      if (doPop == true) {
        Navigator.of(context).pop();
      }
    });
  }
}
