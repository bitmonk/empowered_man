import 'package:empowered/features/common/app_scaffold.dart';
import 'package:empowered/features/common/custom_app_bar.dart';
import 'package:empowered/features/notification/presentation/screen/widget/notification_tile.dart';
import 'package:flutter/material.dart';

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
        itemBuilder: (context, index) => const NotificationTile(),
      ),
    );
  }
}
