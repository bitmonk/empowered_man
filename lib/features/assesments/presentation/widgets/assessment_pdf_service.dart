import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:empowered/features/assesments/data/model/score_question_model.dart';
import 'package:empowered/features/assesments/data/model/user_assessment_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class AssessmentPdfService {
  static Future<void> generateAndDownloadPdf({
    required UserAssessmentModel userAssessmentModel,
    required int totalObtainedScore,
    required int totalScore,
    required String? scoreOverview,
    required List<String>? scoreOverviewList,
    required List<Question>? questions, // This has the correct scores
  }) async {
    try {
      // Create PDF document
      final pdf = pw.Document();

      // Get assessment data
      final assessment = userAssessmentModel.data?.userAssessment;
      
      // Use the passed questions parameter instead of assessment questions
      final questionsToUse = questions ?? [];

      // Limit questions to prevent too many pages (max 50 questions)
      final limitedQuestions = questionsToUse.take(50).toList();

      // Add pages to PDF
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(32),
          maxPages: 100,
          build: (pw.Context context) {
            return [
              // Header
              _buildHeader(assessment?.assessment?.name ?? 'Assessment'),
              pw.SizedBox(height: 20),

              // Score Summary
              _buildScoreSummary(
                totalObtainedScore,
                totalScore,
                scoreOverview,
                scoreOverviewList,
              ),
              pw.SizedBox(height: 30),

              // Questions and Answers - Use the correct questions
              _buildQuestionsSection(limitedQuestions),
            ];
          },
        ),
      );

      // Save and share PDF
      await _savePdf(pdf, assessment?.assessment?.name ?? 'Assessment');
    } catch (e) {
      print('Error generating PDF: $e');
      throw Exception('Failed to generate PDF: $e');
    }
  }

  static pw.Widget _buildHeader(String assessmentName) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        color: PdfColors.blue50,
        borderRadius: pw.BorderRadius.circular(10),
        border: pw.Border.all(color: PdfColors.blue300),
      ),
      child: pw.Column(
        children: [
          pw.Text(
            '$assessmentName Results',
            style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.blue900,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            'Assessment Report',
            style: const pw.TextStyle(
              fontSize: 16,
              color: PdfColors.blue700,
            ),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
            'Generated on: ${DateTime.now().toString().split(' ')[0]}',
            style: const pw.TextStyle(
              fontSize: 12,
              color: PdfColors.grey700,
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildScoreSummary(
    int totalObtainedScore,
    int totalScore,
    String? scoreOverview,
    List<String>? scoreOverviewList,
  ) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        color: PdfColors.green50,
        borderRadius: pw.BorderRadius.circular(10),
        border: pw.Border.all(color: PdfColors.green300),
      ),
      child: pw.Column(
        children: [
          pw.Text(
            'Your Score',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.green900,
            ),
          ),
          pw.SizedBox(height: 15),
          pw.Container(
            padding:
                const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: pw.BoxDecoration(
              color: PdfColors.green600,
              borderRadius: pw.BorderRadius.circular(20),
            ),
            child: pw.Text(
              '$totalObtainedScore / $totalScore',
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.white,
              ),
            ),
          ),
          pw.SizedBox(height: 15),
          if (scoreOverview != null)
            pw.Text(
              "You're inside of $scoreOverview!!",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.green800,
              ),
            ),
          pw.SizedBox(height: 10),
          pw.Text(
            'Congratulations!',
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.green800,
            ),
          ),
          if (scoreOverviewList != null && scoreOverviewList.isNotEmpty) ...[
            pw.SizedBox(height: 15),
            pw.Text(
              'Score Overview',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.green800,
              ),
            ),
            pw.SizedBox(height: 10),
            ...scoreOverviewList.map((overview) => pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 5),
                  child: pw.Text(
                    overview,
                    textAlign: pw.TextAlign.center,
                    style: const pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.green700,
                    ),
                  ),
                ),),
          ],
        ],
      ),
    );
  }

  // Updated to use Question type instead of AssessmentQuestion
  static pw.Widget _buildQuestionsSection(List<Question> questions) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Questions and Answers',
          style: pw.TextStyle(
            fontSize: 20,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue900,
          ),
        ),
        pw.SizedBox(height: 20),
        if (questions.isEmpty)
          pw.Container(
            padding: const pw.EdgeInsets.all(20),
            decoration: pw.BoxDecoration(
              color: PdfColors.grey100,
              borderRadius: pw.BorderRadius.circular(10),
            ),
            child: pw.Text(
              'No questions available',
              style: const pw.TextStyle(
                fontSize: 14,
                color: PdfColors.grey700,
              ),
            ),
          )
        else
          ...questions.asMap().entries.map((entry) {
            final index = entry.key;
            final question = entry.value;
            // This should now show the correct score
            final score = question.answer?.score ?? 0;

            return pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 15),
              padding: const pw.EdgeInsets.all(16),
              decoration: pw.BoxDecoration(
                color: PdfColors.grey50,
                borderRadius: pw.BorderRadius.circular(10),
                border: pw.Border.all(color: PdfColors.grey300),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Question ${index + 1}',
                              style: pw.TextStyle(
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.blue700,
                              ),
                            ),
                            pw.SizedBox(height: 5),
                            pw.Text(
                              _truncateText(
                                  question.title ?? 'Unknown question', 100,),
                              style: const pw.TextStyle(
                                fontSize: 14,
                                color: PdfColors.black,
                              ),
                            ),
                            if (question.description != null &&
                                question.description!.isNotEmpty) ...[
                              pw.SizedBox(height: 8),
                              pw.Text(
                                _truncateText(question.description!, 150),
                                style: const pw.TextStyle(
                                  fontSize: 12,
                                  color: PdfColors.grey700,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6,),
                        decoration: pw.BoxDecoration(
                          color: PdfColors.blue600,
                          borderRadius: pw.BorderRadius.circular(15),
                        ),
                        child: pw.Text(
                          'Score: $score',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }

  static String _truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  static Future<void> _savePdf(pw.Document pdf, String assessmentName) async {
    try {
      // Request storage permission
      final hasPermission = await _requestStoragePermission();
      if (!hasPermission) {
        throw Exception(
            'Storage permission denied. Please enable storage access in settings.',);
      }

      // Get the appropriate directory
      Directory? targetDir;

      if (Platform.isAndroid) {
        // For Android, try multiple approaches
        try {
          // First try to get the Downloads directory
          targetDir = Directory('/storage/emulated/0/Download');
          if (!await targetDir.exists()) {
            // If Downloads doesn't exist, try external storage
            targetDir = await getExternalStorageDirectory();
            targetDir ??= await getApplicationDocumentsDirectory();
          }
        } catch (e) {
          print('Error accessing external storage: $e');
          // Fall back to app documents directory
          targetDir = await getApplicationDocumentsDirectory();
        }
      } else if (Platform.isIOS) {
        targetDir = await getApplicationDocumentsDirectory();
      }

      if (targetDir == null) {
        throw Exception('Could not access storage directory');
      }

      // Create filename
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename =
          '${assessmentName.replaceAll(' ', '_').replaceAll(RegExp(r'[^\w\s-]'), '')}_Results_$timestamp.pdf';
      final file = File('${targetDir.path}/$filename');

      // Save PDF
      await file.writeAsBytes(await pdf.save());

      print('PDF saved successfully at: ${file.path}');
    } catch (e) {
      print('Error saving PDF: $e');
      throw Exception('Failed to save PDF: $e');
    }
  }

  static Future<bool> _requestStoragePermission() async {
    if (Platform.isAndroid) {
      try {
        // Get Android SDK version
        final deviceInfo = DeviceInfoPlugin();
        final androidInfo = await deviceInfo.androidInfo;
        final sdkInt = androidInfo.version.sdkInt;

        // Handle different Android versions
        if (sdkInt >= 30) {
          // Android 11+ (API 30+)
          final managePermission =
              await Permission.manageExternalStorage.request();
          if (managePermission.isGranted) {
            return true;
          }

          // If manage external storage is not granted, try photos permission
          final photosPermission = await Permission.photos.request();
          if (photosPermission.isGranted) {
            return true;
          }
        } else if (sdkInt >= 23) {
          // Android 6.0+ (API 23+)
          final storagePermission = await Permission.storage.request();
          if (storagePermission.isGranted) {
            return true;
          }
        } else {
          // Below Android 6.0, permissions are granted at install time
          return true;
        }

        // Check if any permission is granted
        final storageStatus = await Permission.storage.status;
        final manageStatus = await Permission.manageExternalStorage.status;

        return storageStatus.isGranted || manageStatus.isGranted;
      } catch (e) {
        print('Error checking permissions: $e');
        return false;
      }
    }

    // For iOS, no special permissions needed for app documents directory
    return true;
  }
}