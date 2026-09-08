import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // ══════════════════════════════════════════════════════════════════════════
  //  EduVision Brand Palette — مستخرجة من التصميمين المعتمدين
  //
  //  ▸ الوضع الفاتح  = "تركواز و كورال"  (التصميم الرابع)
  //      تركواز رئيسي  #077580
  //      كورال ثانوي   #FE7465
  //      رمادي         #6C798C
  //      أبيض          #FFFFFF
  //
  //  ▸ الوضع الداكن  = "أزرق و برتقالي"  (التصميم الأول)
  //      أزرق داكن رئيسي #002655
  //      برتقالي ثانوي   #F47720
  //      أزرق فاتح       #0A5FCD
  //      بيج             #F7CFA8
  //
  //  ⚠️ ملاحظة هندسية مهمة:
  //  أسماء الثوابت القديمة (mocha* / coral* / sage* / navy* / sky* / slate*)
  //  مُحتفظ بها كما هي بالكامل، وتم تغيير قيمها اللونية فقط.
  //  السبب: أكثر من 30 شاشة تستدعي هذه الأسماء مباشرةً — تغيير الأسماء
  //  كان سيُنتج مئات أخطاء الترجمة. بهذه الطريقة يُعاد تلوين التطبيق
  //  بالكامل دون لمس أي شاشة.
  // ══════════════════════════════════════════════════════════════════════════

  // ── عائلة "mocha" ← أصبحت التركواز (اللون الرئيسي للوضع الفاتح) ──────────
  static const Color mocha900     = Color(0xFF032F36); // أعمق تركواز
  static const Color mocha800     = Color(0xFF04434C);
  static const Color mocha700     = Color(0xFF055C66); // AppBar الفاتح
  static const Color mocha600     = Color(0xFF066C77);
  static const Color mocha500     = Color(0xFF077580); // تركواز رئيسي ✦
  static const Color mocha400     = Color(0xFF0E9AA6);
  static const Color mocha200     = Color(0xFF9FD6DB); // borders
  static const Color mocha100     = Color(0xFFDCF0F2); // حاويات فاتحة
  static const Color mocha50      = Color(0xFFF1F9FA);
  static const Color softPeach    = Color(0xFFF7CFA8);

  // ── عائلة "coral" ← الكورال (اللون الثانوي / أزرار CTA) ─────────────────
  static const Color coral600     = Color(0xFFE05543);
  static const Color coral500     = Color(0xFFFE7465); // كورال ✦
  static const Color coral400     = Color(0xFFFF9385);
  static const Color coral200     = Color(0xFFFFC7C0);
  static const Color coral100     = Color(0xFFFFE9E6);
  static const Color coral50      = Color(0xFFFFF5F3);

  // ── عائلة "peach" ← البيج الدافئ (من التصميم الداكن) ────────────────────
  static const Color peach500     = Color(0xFFF7CFA8); // بيج ✦
  static const Color peach400     = Color(0xFFFBDEC2);
  static const Color peach200     = Color(0xFFFDEEDF);
  static const Color peach100     = Color(0xFFFEF7F0);

  // ── عائلة "sage" ← الرمادي المحيّد + خلفيات فاتحة ───────────────────────
  static const Color sage500      = Color(0xFF6C798C); // رمادي ✦
  static const Color sage400      = Color(0xFFA7B4C0);
  static const Color sage300      = Color(0xFFD3DEE2);
  static const Color sage200      = Color(0xFFE4EEF0);
  static const Color sage100      = Color(0xFFF1F8F8); // scaffold الفاتح
  static const Color sage50       = Color(0xFFF8FCFC);

  // ── النصوص ───────────────────────────────────────────────────────────────
  static const Color textDark     = Color(0xFF12303A);
  static const Color textMid      = Color(0xFF3E5560);
  static const Color textMuted    = Color(0xFF6C798C);

  // ══════════════════════════════════════════════════════════════════════════
  //  ألوان الوضع الداكن — "أزرق و برتقالي"  (ثوابت جديدة، إضافية بالكامل)
  // ══════════════════════════════════════════════════════════════════════════
  static const Color navyDeep     = Color(0xFF04122A); // splash / login
  static const Color navyBg       = Color(0xFF071A33); // scaffold الداكن
  static const Color navySurface  = Color(0xFF0E2647); // أسطح
  static const Color navyCard     = Color(0xFF14315A); // بطاقات
  static const Color navyBorder   = Color(0xFF1F4372); // حدود
  static const Color navyPrimary  = Color(0xFF002655); // أزرق داكن رئيسي ✦

  static const Color orange600    = Color(0xFFD65F10);
  static const Color orange500    = Color(0xFFF47720); // برتقالي ✦
  static const Color orange400    = Color(0xFFFF9147);

  static const Color blue500      = Color(0xFF0A5FCD); // أزرق فاتح ✦
  static const Color blue400      = Color(0xFF3D85E0);

  static const Color darkText     = Color(0xFFEAF1FA);
  static const Color darkMutedTxt = Color(0xFF93A7C4);

  // ── دلالية ───────────────────────────────────────────────────────────────
  static const Color success      = Color(0xFF0E9F80);
  static const Color successLight = Color(0xFFDFF5EF);
  static const Color warning      = Color(0xFFB07D2B);
  static const Color warningLight = Color(0xFFFFF3CD);
  static const Color error        = Color(0xFFD2483F);
  static const Color errorLight   = Color(0xFFFDE8E8);

  // ── أسماء متوافقة مع الشاشات القديمة (لا تكسر أي شيء) ───────────────────
  static const Color navy900      = mocha900;
  static const Color navy800      = mocha800;
  static const Color navy700      = mocha700;
  static const Color navy600      = mocha500;
  static const Color navy500      = mocha600;
  static const Color navy400      = mocha400;
  static const Color navy200      = mocha200;
  static const Color navy100      = mocha100;
  static const Color navy50       = mocha50;
  static const Color sky500       = coral500;
  static const Color sky400       = coral400;
  static const Color sky300       = coral200;
  static const Color sky100       = coral100;
  static const Color sky50        = coral50;
  static const Color slate900     = textDark;
  static const Color slate700     = textMid;
  static const Color slate500     = textMuted;
  static const Color slate300     = sage500;
  static const Color slate200     = sage300;
  static const Color slate100     = sage100;
  static const Color slate50      = sage50;

  // ════════════════════════════════════════════════════════════════════════
  //  Design Tokens
  // ════════════════════════════════════════════════════════════════════════

  static const double space2  = 2;
  static const double space4  = 4;
  static const double space8  = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space40 = 40;
  static const double space48 = 48;

  static const double radiusSm   = 12;
  static const double radiusMd   = 16;
  static const double radiusLg   = 20;
  static const double radiusXl   = 28;
  static const double radiusPill = 999;

  static const BorderRadius brSm = BorderRadius.all(Radius.circular(radiusSm));
  static const BorderRadius brMd = BorderRadius.all(Radius.circular(radiusMd));
  static const BorderRadius brLg = BorderRadius.all(Radius.circular(radiusLg));
  static const BorderRadius brXl = BorderRadius.all(Radius.circular(radiusXl));

  static List<BoxShadow> get shadowSm => [
        BoxShadow(color: mocha900.withValues(alpha: 0.04), blurRadius: 6, offset: const Offset(0, 2)),
      ];
  static List<BoxShadow> get shadowMd => [
        BoxShadow(color: mocha900.withValues(alpha: 0.06), blurRadius: 16, offset: const Offset(0, 6)),
        BoxShadow(color: mocha900.withValues(alpha: 0.04), blurRadius: 4, offset: const Offset(0, 2)),
      ];
  static List<BoxShadow> get shadowLg => [
        BoxShadow(color: mocha900.withValues(alpha: 0.10), blurRadius: 28, offset: const Offset(0, 12)),
        BoxShadow(color: mocha900.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 4)),
      ];
  static List<BoxShadow> coloredShadow(Color c, {double alpha = 0.35}) => [
        BoxShadow(color: c.withValues(alpha: alpha), blurRadius: 20, offset: const Offset(0, 10)),
      ];

  static const Duration motionFast = Duration(milliseconds: 180);
  static const Duration motionMed  = Duration(milliseconds: 280);
  static const Duration motionSlow = Duration(milliseconds: 450);
  static const Curve    easeOutExpo = Curves.easeOutCubic;

  // ── Tajawal للعناوين + Cairo للنصوص ─────────────────────────────────────
  static TextTheme get _cairoTextTheme {
    final base = GoogleFonts.cairoTextTheme();
    return base.copyWith(
      displayLarge:   GoogleFonts.tajawal(textStyle: base.displayLarge,   fontWeight: FontWeight.w800, height: 1.15, letterSpacing: -0.5),
      displayMedium:  GoogleFonts.tajawal(textStyle: base.displayMedium,  fontWeight: FontWeight.w800, height: 1.18, letterSpacing: -0.5),
      displaySmall:   GoogleFonts.tajawal(textStyle: base.displaySmall,   fontWeight: FontWeight.w700, height: 1.20),
      headlineLarge:  GoogleFonts.tajawal(textStyle: base.headlineLarge,  fontWeight: FontWeight.w700, height: 1.20),
      headlineMedium: GoogleFonts.tajawal(textStyle: base.headlineMedium, fontWeight: FontWeight.w700, height: 1.25),
      headlineSmall:  GoogleFonts.tajawal(textStyle: base.headlineSmall,  fontWeight: FontWeight.w700, height: 1.30),
      titleLarge:     GoogleFonts.tajawal(textStyle: base.titleLarge,     fontWeight: FontWeight.w700, height: 1.30),
      titleMedium:    GoogleFonts.cairo(textStyle: base.titleMedium,      fontWeight: FontWeight.w600, height: 1.40, letterSpacing: 0.1),
      titleSmall:     GoogleFonts.cairo(textStyle: base.titleSmall,       fontWeight: FontWeight.w600, height: 1.40),
      bodyLarge:      GoogleFonts.cairo(textStyle: base.bodyLarge,        height: 1.60, letterSpacing: 0.1),
      bodyMedium:     GoogleFonts.cairo(textStyle: base.bodyMedium,       height: 1.60, letterSpacing: 0.1),
      bodySmall:      GoogleFonts.cairo(textStyle: base.bodySmall,        height: 1.50),
      labelLarge:     GoogleFonts.cairo(textStyle: base.labelLarge,       fontWeight: FontWeight.w600, letterSpacing: 0.2),
      labelMedium:    GoogleFonts.cairo(textStyle: base.labelMedium,      fontWeight: FontWeight.w600),
      labelSmall:     GoogleFonts.cairo(textStyle: base.labelSmall,       fontWeight: FontWeight.w600),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  //  الوضع الفاتح — تركواز و كورال
  // ══════════════════════════════════════════════════════════════════════════
  static ThemeData light() {
    final cs = ColorScheme(
      brightness:               Brightness.light,
      primary:                  mocha500,       // تركواز
      onPrimary:                Colors.white,
      primaryContainer:         mocha100,
      onPrimaryContainer:       mocha800,
      secondary:                coral500,       // كورال
      onSecondary:              Colors.white,
      secondaryContainer:       coral100,
      onSecondaryContainer:     mocha700,
      tertiary:                 sage500,        // رمادي
      onTertiary:               Colors.white,
      tertiaryContainer:        sage200,
      onTertiaryContainer:      textDark,
      error:                    error,
      onError:                  Colors.white,
      errorContainer:           errorLight,
      onErrorContainer:         const Color(0xFF7F1D1D),
      surface:                  Colors.white,
      onSurface:                textDark,
      surfaceContainerHighest:  sage100,
      outline:                  sage400,
      outlineVariant:           sage300,
      shadow:                   Colors.black,
      scrim:                    Colors.black,
      inverseSurface:           mocha800,
      onInverseSurface:         sage50,
      inversePrimary:           mocha200,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      scaffoldBackgroundColor: sage100,
      textTheme: _cairoTextTheme.apply(bodyColor: textDark, displayColor: textDark),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: mocha500,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: GoogleFonts.tajawal(
            fontSize: 19, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.2),
        iconTheme: const IconThemeData(color: Colors.white),
        shadowColor: Colors.black26,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.white,
        shadowColor: mocha500.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          side: const BorderSide(color: sage200),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: coral500,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 15.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          minimumSize: const Size(64, 52),
          elevation: 3,
          shadowColor: coral500.withValues(alpha: 0.45),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: coral500,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 15.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          minimumSize: const Size(64, 52),
          elevation: 3,
          shadowColor: coral500.withValues(alpha: 0.45),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: mocha500,
          side: const BorderSide(color: mocha500, width: 1.5),
          textStyle: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(64, 50),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: coral500,
          textStyle: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
          minimumSize: const Size(0, 40),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: sage50,
        hintStyle: GoogleFonts.cairo(color: textMuted, fontSize: 14),
        labelStyle: GoogleFonts.cairo(color: textMuted, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: sage400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: sage400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: mocha500, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: coral500,
        unselectedItemColor: textMuted,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: coral100,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: coral500);
          }
          return const IconThemeData(color: textMuted);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.cairo(color: coral500, fontSize: 11, fontWeight: FontWeight.bold);
          }
          return GoogleFonts.cairo(color: textMuted, fontSize: 11);
        }),
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: mocha100,
        selectedColor: coral100,
        labelStyle: GoogleFonts.cairo(fontSize: 13, color: textMid),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: const BorderSide(color: sage300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      dividerTheme: const DividerThemeData(color: sage300, thickness: 1, space: 1),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: mocha800,
        contentTextStyle: GoogleFonts.cairo(color: Colors.white, fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: mocha500,
        linearTrackColor: sage300,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: mocha500,
        unselectedLabelColor: textMuted,
        indicatorColor: coral500,
        labelStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14),
        unselectedLabelStyle: GoogleFonts.cairo(fontSize: 14),
        dividerColor: sage300,
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  //  الوضع الداكن — أزرق و برتقالي
  // ══════════════════════════════════════════════════════════════════════════
  static ThemeData dark() {
    const darkBg      = navyBg;
    const darkSurface = navySurface;
    const darkCard    = navyCard;
    const darkBorder  = navyBorder;
    const dText       = darkText;
    const dMuted      = darkMutedTxt;

    final cs = ColorScheme(
      brightness:               Brightness.dark,
      primary:                  orange500,      // برتقالي = العنصر النشط
      onPrimary:                Colors.white,
      primaryContainer:         const Color(0xFF5C2A08),
      onPrimaryContainer:       const Color(0xFFFFD2B0),
      secondary:                blue500,        // أزرق فاتح
      onSecondary:              Colors.white,
      secondaryContainer:       const Color(0xFF0B2F63),
      onSecondaryContainer:     const Color(0xFFBBD5F7),
      tertiary:                 peach500,       // بيج
      onTertiary:               navyPrimary,
      tertiaryContainer:        darkCard,
      onTertiaryContainer:      dText,
      error:                    const Color(0xFFF87171),
      onError:                  darkBg,
      errorContainer:           const Color(0xFF4A1515),
      onErrorContainer:         const Color(0xFFFCA5A5),
      surface:                  darkSurface,
      onSurface:                dText,
      surfaceContainerHighest:  darkCard,
      outline:                  darkBorder,
      outlineVariant:           const Color(0xFF1A3763),
      shadow:                   Colors.black,
      scrim:                    Colors.black,
      inverseSurface:           sage100,
      onInverseSurface:         textDark,
      inversePrimary:           blue400,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: cs,
      scaffoldBackgroundColor: darkBg,
      textTheme: _cairoTextTheme.apply(bodyColor: dText, displayColor: dText),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: darkSurface,
        foregroundColor: dText,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: GoogleFonts.tajawal(
            fontSize: 19, fontWeight: FontWeight.w800, color: dText, letterSpacing: 0.2),
        iconTheme: const IconThemeData(color: dText),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: darkCard,
        shadowColor: Colors.black.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          side: const BorderSide(color: darkBorder),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: orange500,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 15.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          minimumSize: const Size(64, 52),
          elevation: 3,
          shadowColor: orange500.withValues(alpha: 0.45),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: orange500,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 15.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMd)),
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          minimumSize: const Size(64, 52),
          elevation: 3,
          shadowColor: orange500.withValues(alpha: 0.45),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: orange500,
          side: const BorderSide(color: orange500, width: 1.5),
          textStyle: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          minimumSize: const Size(64, 50),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: orange500,
          textStyle: GoogleFonts.cairo(fontWeight: FontWeight.w600, fontSize: 14),
          minimumSize: const Size(0, 40),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkCard,
        hintStyle: GoogleFonts.cairo(color: dMuted, fontSize: 14),
        labelStyle: GoogleFonts.cairo(color: dMuted, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: orange500, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkSurface,
        selectedItemColor: orange500,
        unselectedItemColor: dMuted,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: darkSurface,
        indicatorColor: const Color(0xFF5C2A08),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: orange500);
          }
          return const IconThemeData(color: dMuted);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.cairo(color: orange500, fontSize: 11, fontWeight: FontWeight.bold);
          }
          return GoogleFonts.cairo(color: dMuted, fontSize: 11);
        }),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: darkCard,
        selectedColor: const Color(0xFF5C2A08),
        labelStyle: GoogleFonts.cairo(fontSize: 13, color: dText),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: const BorderSide(color: darkBorder),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      dividerTheme: const DividerThemeData(color: darkBorder, thickness: 1, space: 1),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: darkCard,
        contentTextStyle: GoogleFonts.cairo(color: dText, fontSize: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: orange500,
        linearTrackColor: navyBorder,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: orange500,
        unselectedLabelColor: dMuted,
        indicatorColor: orange500,
        labelStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14),
        unselectedLabelStyle: GoogleFonts.cairo(fontSize: 14),
        dividerColor: navyBorder,
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  //  Gradients
  // ══════════════════════════════════════════════════════════════════════════

  // ترويسة الرئيسية — تركواز متدرّج (يعمل في الوضعين)
  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [mocha700, mocha500, mocha400],
    stops: [0.0, 0.55, 1.0],
  );

  // ترويسة داكنة — أزرق متدرّج (للاستخدام في الوضع الليلي)
  static const LinearGradient headerGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [navyPrimary, navyCard, navySurface],
    stops: [0.0, 0.55, 1.0],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [coral500, coral600],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  static const LinearGradient ctaGradient = LinearGradient(
    colors: [coral400, coral600],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  // برتقالي متدرّج (CTA للوضع الداكن)
  static const LinearGradient ctaGradientDark = LinearGradient(
    colors: [orange400, orange600],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const LinearGradient peachGlow = LinearGradient(
    colors: [peach500, coral400],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient cardSheen(bool isDark) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDark
            ? const [navyCard, navySurface]
            : const [Colors.white, sage50],
      );

  static const LinearGradient progressGradient = LinearGradient(
    colors: [mocha500, mocha400],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  // شاشة البداية وتسجيل الدخول — أزرق داكن (مطابق للتصميم الأول)
  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [navyDeep, navyPrimary, navyCard],
    stops: [0.0, 0.5, 1.0],
  );

  // بطاقات الفئات — مستوحاة من بطاقات التصميمين
  static const List<List<Color>> categoryGradients = [
    [mocha600, mocha400],                    // تركواز
    [coral600, coral400],                    // كورال
    [blue500, blue400],                      // أزرق
    [orange600, orange400],                  // برتقالي
    [Color(0xFF5B3A8E), Color(0xFF7E5BB5)],  // بنفسجي
    [Color(0xFF4A5A73), Color(0xFF6C798C)],  // رمادي
  ];
}
