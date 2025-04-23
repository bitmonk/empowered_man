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
  final pdf = pw.Document();
  // final bytes = await rootBundle.load('assets/images/logo.png');
  // final logoData = bytes.buffer.asUint8List();
  // final logo = pw.MemoryImage(logoData);

  // Function to add content to a page
  void addTablePage(String data, int startIndex, int endIndex) {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Container(
                width: double.infinity,
                color: PdfColor.fromHex('#C44E66'),
                padding: const pw.EdgeInsets.all(10),
                child: pw.Row(
                  children: [
                    // pw.Image(logo, width: 100, height: 100),
                    pw.SizedBox(width: 20),
                    pw.Text(
                      'Additive Free',
                      style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColor.fromHex('#FFFFFF'),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                children: [
                  pw.Text(
                    'Shopping List - ',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex('#1A2637'),
                      fontSize: 16,
                    ),
                  ),
                  pw.Text(
                    fromToDate,
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex('#515C6D'),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Container(
                margin:
                    const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: pw.TableHelper.fromTextArray(
                  headerDecoration: pw.BoxDecoration(
                    color: PdfColor.fromHex('#F3F4F6'),
                    borderRadius:
                        const pw.BorderRadius.all(pw.Radius.circular(10)),
                  ),
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  border: pw.TableBorder.all(
                    color: PdfColor.fromHex('#bdbdbd'),
                  ),
                  headers: ['Item', 'Rate', 'Unit'],
                  data: List.generate(
                    endIndex - startIndex,
                    (i) => [
                      'data[startIndex + i]',
                      'data[startIndex + i]',
                      'data[startIndex + i]',
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Split data into chunks to handle pagination
  const itemsPerPage = 20; // Number of items per page
  var totalPages = (data.length / itemsPerPage).ceil();

  for (var page = 0; page < totalPages; page++) {
    var startIndex = page * itemsPerPage;
    var endIndex = (startIndex + itemsPerPage > data.length)
        ? data.length
        : startIndex + itemsPerPage;
    addTablePage(data, startIndex, endIndex);
  }

  // Save and share the PDF
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

  final file = File('$filePath/exported_table.pdf');
  await file.writeAsBytes(await pdf.save());
  print('PDF exported to: ${file.path}');

  // Only share if the shouldShare parameter is true
  if (shouldShare) {
    await Share.shareXFiles([XFile(file.path)], text: 'Here is your PDF file.');
  } else {
    try {
      final result = await FileSaver.instance.saveAs(
        name: 'exported_table',
        ext: 'pdf',
        file: file,
        mimeType: Utils().getMimeType('pdf'),
      );

      // Check if the save operation was successful
      if (result != null && result.isNotEmpty) {
        AppUtils.showSnackbar(message: 'File successfully saved');
      }
      // If result is null or empty, it means the save was canceled or failed
      // In this case, we don't show any success message
    } catch (e) {
      // Handle errors during save
      AppUtils.showSnackbar(message: 'Failed to save file: ${e.toString()}');
    }
    // Only save if not sharing
    // await FileSaver.instance
    //     .saveAs(
    //   name: 'exported_table',
    //   ext: 'pdf',
    //   file: file,
    //   mimeType: Utils().getMimeType('pdf'),
    // )
    //     .then((value) {
    //   AppUtils.showSnackbar(message: 'File successfully saved');
    //   // Navigator.of(context).pop();
    // });
  }
}

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
