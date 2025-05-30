import 'package:empowered/core/extension/extensions.dart';
import 'package:empowered/features/notification/presentation/screen/widget/notification_tile.dart';

class NotificationHistoryScreen extends StatelessWidget {
  const NotificationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(
        title: 'Notifications',
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const NotificationTile(
          title: '',
          body: '',
          createdAt: '',
        ),
      ),
    );
  }
}
