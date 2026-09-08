import '../../domain/entities/notification.dart';

class NotificationModel extends AppNotification {
  const NotificationModel({
    required super.id,
    required super.type,
    required super.title,
    required super.message,
    required super.courseId,
    required super.courseTitle,
    required super.relatedId,
    required super.date,
    required super.isRead,
  });

  // ── محوّلات متسامحة ──────────────────────────────────────────────
  static int _toInt(dynamic v) => v == null
      ? 0
      : (v is num ? v.toInt() : int.tryParse(v.toString()) ?? 0);

  /// إصلاح جوهري:
  ///
  /// كان الكود القديم يقرأ `json['is_read'] == true` فقط.
  /// لكن ووردبريس/MySQL يُرجع قيم المنطق دائمًا كـ 1/0 أو "1"/"0"
  /// وليس كـ true/false. النتيجة: كان isRead = false دائمًا، فتبقى
  /// جميع الإشعارات "غير مقروءة" ولا تختفي النقطة الحمراء أبدًا.
  static bool _toBool(dynamic v) {
    if (v == null) return false;
    if (v is bool) return v;
    if (v is num) return v != 0;
    final s = v.toString().trim().toLowerCase();
    return s == '1' || s == 'true' || s == 'yes' || s == 'read';
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      // ندعم id / ID / notification_id
      id: (json['id'] ?? json['ID'] ?? json['notification_id'])?.toString() ??
          '',
      type: (json['type'] ?? json['notification_type'])?.toString() ?? '',
      title: (json['title'] ?? json['subject'])?.toString() ?? '',
      // بعض المنافذ تسميه content أو body بدل message
      message: (json['message'] ?? json['content'] ?? json['body'])
              ?.toString() ??
          '',
      courseId: _toInt(json['course_id'] ?? json['courseId']),
      courseTitle:
          (json['course_title'] ?? json['courseTitle'])?.toString() ?? '',
      relatedId: _toInt(json['related_id'] ?? json['relatedId']),
      date: (json['date'] ?? json['created_at'] ?? json['post_date'])
              ?.toString() ??
          '',
      isRead: _toBool(json['is_read'] ?? json['isRead'] ?? json['read']),
    );
  }
}
