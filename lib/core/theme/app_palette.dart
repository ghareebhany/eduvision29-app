import 'package:flutter/material.dart';

/// ═════════════════════════════════════════════════════════════════════════════
///  AppPalette — مصدر الألوان الموحّد
///
///  أُعيدت قيمة كل ثابت لتطابق التصميمين المعتمدين:
///   ▸ الفاتح: تركواز #077580 + كورال #FE7465 + رمادي #6C798C
///   ▸ الداكن: أزرق #002655 + برتقالي #F47720 + أزرق فاتح #0A5FCD + بيج #F7CFA8
///
///  الأسماء القديمة (sage/peach/coral/plum/mocha) مُحتفط بها للتوافق
///  مع الشاشات القائمة — القيم فقط هي التي تغيرت.
/// ═════════════════════════════════════════════════════════════════════════════
abstract class AppPalette {
  AppPalette._();

  // ── الألوان الخمسة الأساسية (أسماء قديمة — قيم جديدة) ─────────────────
  /// لون فاتح للحدود والعناصر الزخرفية (تركواز فاتح)
  static const Color sage  = Color(0xFFBFE3E7);
  /// بيج دافئ — chips و highlights
  static const Color peach = Color(0xFFF7CFA8);
  /// كورال — اللون الثانوي وأزرار CTA
  static const Color coral = Color(0xFFFE7465);
  /// تركواز داكن — headers و gradients
  static const Color plum  = Color(0xFF055C66);
  /// أعمق تركواز — النصوص البارزة
  static const Color mocha = Color(0xFF032F36);

  // ── ألوان التصميم بأسمائها الصريحة (موصى باستخدامها للجديد) ──────
  /// القالب الفاتح
  static const Color teal      = Color(0xFF077580); // تركواز رئيسي
  static const Color tealDark   = Color(0xFF055C66);
  static const Color tealLight  = Color(0xFF0E9AA6);
  static const Color grey       = Color(0xFF6C798C); // رمادي
  static const Color offWhite   = Color(0xFFFDFDFD); // أبيض

  /// القالب الداكن
  static const Color navy       = Color(0xFF002655); // أزرق داكن رئيسي
  static const Color navyBg     = Color(0xFF071A33);
  static const Color navyCard   = Color(0xFF14315A);
  static const Color blue       = Color(0xFF0A5FCD); // أزرق فاتح
  static const Color orange     = Color(0xFFF47720); // برتقالي ثانوي
  static const Color beige      = Color(0xFFF7CFA8); // بيج

  // ── مشتقات ومساعدات ─────────────────────────────────────────────────
  static const Color sageLight  = Color(0xFFF1F8F8); // خلفية الشاشة الفاتحة
  static const Color coralLight = Color(0x1FFE7465); // coral @ 12%
  static const Color mochaLight = Color(0x14032F36); // تركواز @ 8%

  /// لون النجاح — أصبح أخضر مخلوطًا بالتركواز (بدل الكورال) حتى
  /// يتميّز فعليًا عن لون الخطأ وأزرار CTA
  static const Color successGreen      = Color(0xFF0E9F80);
  static const Color successGreenLight = Color(0x1F0E9F80);

  // ── Gradients ───────────────────────────────────────────────────────────
  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end:   Alignment.bottomRight,
    colors: [tealDark, teal],
  );

  static const LinearGradient btnGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end:   Alignment.centerRight,
    colors: [coral, Color(0xFFE05543)],
  );

  static const LinearGradient progressGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end:   Alignment.centerRight,
    colors: [teal, tealLight],
  );

  // ── متدرّجات صور الكورسات ──────────────────────────────────────────
  static const List<List<Color>> thumbGradients = [
    [tealDark, teal],
    [teal, tealLight],
    [blue, Color(0xFF3D85E0)],
    [Color(0xFFE05543), coral],
    [Color(0xFFD65F10), orange],
    [Color(0xFF5B3A8E), Color(0xFF7E5BB5)],
  ];

  // ── مُحلّلات واعية بالثيم (تدعم الوضع الليلي) ─────────────────────────
  static bool isDark(BuildContext c) =>
      Theme.of(c).brightness == Brightness.dark;

  static Color scaffold(BuildContext c) =>
      Theme.of(c).scaffoldBackgroundColor;

  static Color surface(BuildContext c) => Theme.of(c).colorScheme.surface;

  static Color surfaceAlt(BuildContext c) =>
      Theme.of(c).colorScheme.surfaceContainerHighest;

  static Color textPrimary(BuildContext c) =>
      Theme.of(c).colorScheme.onSurface;

  static Color textSecondary(BuildContext c) =>
      Theme.of(c).colorScheme.onSurface.withValues(alpha: 0.6);

  static Color border(BuildContext c) =>
      Theme.of(c).colorScheme.outlineVariant;

  /// اللون المميز الفعّال: كورال في الفاتح، برتقالي في الداكن
  static Color accent(BuildContext c) => isDark(c) ? orange : coral;

  /// ترويسة الرئيسية المناسبة للوضع الحالي
  static LinearGradient header(BuildContext c) => isDark(c)
      ? const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [navy, navyCard],
        )
      : headerGradient;
}
