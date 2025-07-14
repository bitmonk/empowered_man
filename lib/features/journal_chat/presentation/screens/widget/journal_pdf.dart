import 'package:empowered/features/journal_chat/data/model/user_journals_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class JournalPdf {
  pw.Document buildPdf(List<SeeUserJournal> userJournals) {
    final pdf = pw.Document()

    ..addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Text('Journal Export',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),),
            pw.SizedBox(height: 10),
            pw.Text(
                'Date: ${DateTime.now().toLocal().toString().split(' ')[0]}',),
            pw.SizedBox(height: 20),
            pw.Text('Number of Journals: ${userJournals.length}',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),),
          ],
        ),
      ),
    );

    for (final journal in userJournals) {
      final emotionName = journal.journal?.emotionName ?? 'Untitled Journal';

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            final widgets = <pw.Widget>[
              pw.Text(emotionName,
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold,),),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.SizedBox(height: 10),
            ];

            if (journal.createdAt != null) {
              widgets
                ..add(pw.Text('Created: ${journal.createdAt}',
                    style: pw.TextStyle(fontStyle: pw.FontStyle.italic),),)
                ..add(pw.SizedBox(height: 10));
            }

            final answers = journal.journalAnswers;
            if (answers != null && answers.isNotEmpty) {
              for (final answer in answers) {
                if (answer.mainQuestion != null) {
                  widgets
                    ..add(pw.Text('Q: ${answer.mainQuestion!.question}',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),),)
                    ..add(pw.Text('A: ${answer.text ?? "No answer provided"}'))
                    ..add(pw.SizedBox(height: 8));
                }

                if (answer.followUpQuestion != null) {
                  widgets
                    ..add(pw.Text('Q: ${answer.followUpQuestion!.question}',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),),)
                    ..add(pw.Text(
                        'A: ${answer.followUpQuestion?.answer ?? "No answer provided"}',),)
                    ..add(pw.SizedBox(height: 8));
                }
              }
            } else {
              widgets.add(
                pw.Text('No answers available for this journal.',
                    style: pw.TextStyle(fontStyle: pw.FontStyle.italic),),
              );
            }

            return widgets;
          },
        ),
      );
    }

    return pdf;
  }
}
