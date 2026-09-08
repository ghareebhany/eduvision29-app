import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/api_constants.dart';
import '../../core/network/dio_client.dart';
import '../../core/theme/app_theme.dart';

// ═════════════════════════════════════════════════════════════════════════════
//  شاشة "نسيت كلمة المرور"
//
//  المشكلة الأصلية: الزر في شاشة تسجيل الدخول كان `onPressed: () {}`
//  أي دالة فارغة بالكامل — لا شاشة ولا مسار ولا طلب API.
//
//  الحل يعمل على مستويين حتّى ينجح مهما كان وضع السيرفر:
//   1) يُحاول POST إلى /app/v1/forgot-password  (لو أضفت المنفذ للإضافة)
//   2) لو المنفذ غير موجود (404 / rest_no_route) يفتح تلقائيًا صفحة
//      استعادة كلمة المرور القياسية في ووردبريس في المتصفّح
//      (wp-login.php?action=lostpassword) — وهي تعمل دائمًا بدون أي تعديل برمجي.
// ═════════════════════════════════════════════════════════════════════════════

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey  = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();

  bool _loading = false;
  bool _sent    = false;
  String? _error;
  /// يصبح true لو اكتشفنا أن منفذ الإضافة غير موجود
  bool _needsWebFallback = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  // ── المسار الأول: منفذ الإضافة ──────────────────────────────────────
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    setState(() {
      _loading = true;
      _error   = null;
    });

    final identifier = _emailCtrl.text.trim();

    try {
      final res = await DioClient.instance.dio.post(
        ApiConstants.forgotPasswordEndpoint,
        data: {
          'user_login': identifier,
          // نُرسل المفتاحين معًا لدعم أي اسم يتوقعه السيرفر
          'email': identifier,
        },
      );

      final body = res.data;
      final ok = res.statusCode != null &&
          res.statusCode! >= 200 &&
          res.statusCode! < 300 &&
          !(body is Map && body['success'] == false);

      if (!mounted) return;
      if (ok) {
        setState(() {
          _loading = false;
          _sent    = true;
        });
      } else {
        setState(() {
          _loading = false;
          _error = (body is Map ? body['message'] as String? : null) ??
              'تعذر إرسال رابط الاستعادة. حاول مرة أخرى.';
        });
      }
    } on DioException catch (e) {
      if (!mounted) return;

      final status = e.response?.statusCode;
      final data   = e.response?.data;
      final code   = data is Map ? data['code']?.toString() : null;

      // المنفذ غير موجود على السيرفر → انتقل للمسار الاحتياطي مباشرةً
      final missingRoute = status == 404 ||
          code == 'rest_no_route' ||
          code == 'rest_invalid_handler';

      if (missingRoute) {
        setState(() {
          _loading = false;
          _needsWebFallback = true;
        });
        await _openWebReset();
        return;
      }

      setState(() {
        _loading = false;
        _error = (data is Map ? data['message'] as String? : null) ??
            (e.type == DioExceptionType.connectionError
                ? 'لا يوجد اتصال بالإنترنت. تحقق من الشبكة وأعد المحاولة.'
                : 'تعذر إرسال رابط الاستعادة. حاول مرة أخرى.');
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'حدث خطأ غير متوقع. جرّب استعادة كلمة المرور من الموقع.';
        _needsWebFallback = true;
      });
    }
  }

  // ── المسار الاحتياطي: صفحة ووردبريس القياسية ─────────────────────────
  Future<void> _openWebReset() async {
    final identifier = _emailCtrl.text.trim();
    final uri = Uri.parse(
      identifier.isEmpty
          ? ApiConstants.lostPasswordUrl
          : '${ApiConstants.lostPasswordUrl}&user_login='
              '${Uri.encodeComponent(identifier)}',
    );

    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (!opened && mounted) {
      setState(() => _error =
          'تعذر فتح المتصفّح. افتح هذا الرابط يدويًا:\n${ApiConstants.lostPasswordUrl}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.navyDeep,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text('استعادة كلمة المرور'),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.splashGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            child: _sent ? _buildSuccess() : _buildForm(),
          ),
        ),
      ),
    );
  }

  // ── حالة النجاح ─────────────────────────────────────────────────────
  Widget _buildSuccess() => Column(
        children: [
          const SizedBox(height: 40),
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.success.withValues(alpha: 0.15),
              border: Border.all(
                  color: AppTheme.success.withValues(alpha: 0.5), width: 2),
            ),
            child: const Icon(Icons.mark_email_read_outlined,
                color: AppTheme.success, size: 46),
          ),
          const SizedBox(height: 24),
          const Text(
            'تم إرسال الرابط ✅',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            'أرسلنا رابط إعادة تعيين كلمة المرور إلى:\n${_emailCtrl.text.trim()}\n\n'
            'تفقّد بريدك (ومجلد الرسائل غير المرغوب فيها) واتبع الرابط لتعيين كلمة مرور جديدة.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton(
              onPressed: () => Navigator.of(context).maybePop(),
              child: const Text('الرجوع لتسجيل الدخول'),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () => setState(() {
              _sent = false;
              _error = null;
            }),
            child: const Text('لم يصلك البريد؟ إعادة المحاولة'),
          ),
        ],
      );

  // ── نموذج الإدخال ─────────────────────────────────────────────────
  Widget _buildForm() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.orange500.withValues(alpha: 0.12),
                border: Border.all(
                    color: AppTheme.orange500.withValues(alpha: 0.45),
                    width: 1.5),
              ),
              child: const Icon(Icons.lock_reset_rounded,
                  color: AppTheme.orange500, size: 42),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'نسيت كلمة المرور؟',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'أدخل البريد الإلكتروني أو اسم المستخدم المرتبط بحسابك، '
            'وسنُرسل لك رابطًا لتعيين كلمة مرور جديدة.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.55),
              fontSize: 13.5,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 28),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(24),
              border:
                  Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            padding: const EdgeInsets.fromLTRB(18, 24, 18, 22),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'البريد الإلكتروني أو اسم المستخدم',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.65),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
                    enabled: !_loading,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    validator: (v) {
                      final t = (v ?? '').trim();
                      if (t.isEmpty) return 'هذا الحقل مطلوب';
                      if (t.length < 3) return 'قيمة غير صالحة';
                      return null;
                    },
                    onFieldSubmitted: (_) => _loading ? null : _submit(),
                    decoration: InputDecoration(
                      hintText: 'you@example.com',
                      hintStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.3)),
                      prefixIcon: const Icon(Icons.alternate_email_rounded,
                          color: Colors.white54, size: 20),
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.07),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Colors.white.withValues(alpha: 0.12)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                            color: Colors.white.withValues(alpha: 0.12)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            color: AppTheme.orange500, width: 1.5),
                      ),
                      errorStyle: const TextStyle(
                          color: Colors.redAccent, fontSize: 12),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                    ),
                  ),

                  if (_error != null) ...[
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.red.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.error_outline,
                              color: Colors.redAccent, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _error!,
                              style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 12.5,
                                  height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 54,
                    child: FilledButton(
                      onPressed: _loading ? null : _submit,
                      child: _loading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Text('إرسال رابط الاستعادة'),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // المسار الاحتياطي — متاح دائمًا للمستخدم
                  OutlinedButton.icon(
                    onPressed: _loading ? null : _openWebReset,
                    icon: const Icon(Icons.open_in_new_rounded, size: 18),
                    label: const Text('الاستعادة عبر الموقع'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.25)),
                      minimumSize: const Size.fromHeight(50),
                    ),
                  ),

                  if (_needsWebFallback) ...[
                    const SizedBox(height: 12),
                    Text(
                      'ℹ️ منفذ الاستعادة غير مُفعّل على السيرفر بعد، '
                      'لذا تم تحويلك لصفحة الاستعادة في الموقع.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppTheme.peach500.withValues(alpha: 0.8),
                        fontSize: 11.5,
                        height: 1.6,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      );
}
