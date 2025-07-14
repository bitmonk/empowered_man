extension ShowDataInOwnFormat on DateTime {
  String toYYMMDD() {
    final monthStr = month < 10 ? '0$month' : '$month';
    final dayStr = day < 10 ? '0$day' : '$day';
    return '$year-$monthStr-$dayStr';
  }
}

extension AgoTime on DateTime {
  String timeAgo() {
    final diff = DateTime.now().difference(this);

    if (diff.inSeconds < 60) {
      return 'just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min${diff.inMinutes > 1 ? 's' : ''} ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago';
    } else {
      return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    }
  }
}
