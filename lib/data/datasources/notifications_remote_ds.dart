import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../../domain/entities/notification.dart';
import '../models/notification_model.dart';
import 'dio_helpers.dart';

// ═════════════════════════════════════════════════════════════════════════════
//  مصدر بيانات الإشعارات
//
//  ✅ إصلاحات موثوقية مهمة (كانت تجعل الإشعارات تبدو "لا تعمل"):
//
//  1. كان الكود يتوقع شكلًا واحدًا فقط: { items: [...], unread_count: n }
//     ولو أرجع السيرفر مصفوفة مباشرةً [ {...}, {...} ] كان يُرجع قائمة
//     فارغة **بصمت تام** بدون أي خطأ → "لا توجد إشعارات" دائمًا.
//     الآن ندعم جميع الأشكال المحتملة.
//
//  2. عداد غير المقروء كان يُقرأ من مفتاح واحد فقط (unread_count).
//     الآن ندعم unread / unread_total، وإن لم يوجد أي منها
//     نحسبه محليًا من عدد العناصر غير المقروءة (لا يعتمد على السيرفر).
//
//  3. markRead كان يُرجع 0 عند أي شكل غير متوقع → يُفسّر كـ"نجاح".
//     الآن يتحقق من حالة الاستجابة فعليًا.
// ═════════════════════════════════════════════════════════════════════════════

class NotificationsRemoteDataSource {
  NotificationsRemoteDataSource._();
  static final NotificationsRemoteDataSource instance =
      NotificationsRemoteDataSource._();

  Dio get _dio => DioClient.instance.dio;

  /// يفك الأغلفة الشائعة في منافذ ووردبريس
  Object? _unwrap(Object? body) {
    var current = body;
    // نفك حتى مستويين من التغليف (data.data)
    for (var i = 0; i < 2; i++) {
      if (current is Map<String, dynamic>) {
        final isWrapper = current['success'] == true ||
            current['success'] == 1 ||
            current['status'] == 'success' ||
            current['status'] == true;
        if (isWrapper && current.containsKey('data')) {
          current = current['data'];
          continue;
        }
      }
      break;
    }
    return current;
  }

  List<NotificationModel> _parseList(List<dynamic> raw) => raw
      .whereType<Map>()
      .map((e) => NotificationModel.fromJson(
          Map<String, dynamic>.from(e as Map)))
      .toList();

  int? _readUnread(Map<String, dynamic> map) {
    for (final key in const [
      'unread_count',
      'unread',
      'unread_total',
      'unreadCount',
    ]) {
      final v = map[key];
      if (v is num) return v.toInt();
      if (v is String) {
        final p = int.tryParse(v);
        if (p != null) return p;
      }
    }
    return null;
  }

  Future<NotificationsBundle> getNotifications() async {
    try {
      final res = await _dio.get(ApiConstants.notificationsEndpoint);
      final raw = _unwrap(res.data);

      // ── الشكل (أ): مصفوفة مباشرة ─────────────────────────────────
      if (raw is List) {
        final list = _parseList(raw);
        return NotificationsBundle(
          items: list,
          unreadCount: list.where((e) => !e.isRead).length,
        );
      }

      // ── الشكل (ب): كائن يحوي القائمة تحت أحد المفاتيح ───────────────
      if (raw is Map<String, dynamic>) {
        List<dynamic>? rawList;
        for (final key in const [
          'items',
          'notifications',
          'data',
          'results',
          'list',
        ]) {
          final v = raw[key];
          if (v is List) {
            rawList = v;
            break;
          }
        }

        final list = _parseList(rawList ?? const []);
        final unread =
            _readUnread(raw) ?? list.where((e) => !e.isRead).length;

        return NotificationsBundle(items: list, unreadCount: unread);
      }

      return const NotificationsBundle(items: [], unreadCount: 0);
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }

  /// يُعلّم كل الإشعارات كمقروءة ويُرجع عداد غير المقروء الجديد.
  Future<int> markRead() async {
    try {
      final res = await _dio.post(ApiConstants.markNotificationsReadEndpoint);
      final raw = _unwrap(res.data);

      if (raw is Map<String, dynamic>) {
        return _readUnread(raw) ?? 0;
      }
      // استجابة ناجحة بدون جسم مفهوم → اعتبرها صفر غير مقروء
      return 0;
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }
}
