/// All user-facing Arabic strings in one place.
///
/// This class acts as the single source of truth for UI text.
/// When adding full localization (e.g., flutter_localizations + ARB files),
/// replace references to this class with the generated `AppLocalizations`.
abstract final class AppStrings {
  // ─── App ───────────────────────────────────────────────────────────────────
  static const String appName = 'بلف';
  static const String appTagline = 'اخدع · افوز · استمتع';

  // ─── Auth ──────────────────────────────────────────────────────────────────
  static const String login = 'تسجيل الدخول';
  static const String loginWelcome = 'أهلاً بك في بلف';
  static const String loginSubtitle = 'سجّل دخولك وابدأ التحدي';
  static const String username = 'اسم اللاعب';
  static const String usernameHint = 'أدخل اسمك هنا...';
  static const String password = 'كلمة المرور';
  static const String passwordHint = '••••••••';
  static const String loginButton = 'ابدأ اللعب';
  static const String noAccount = 'ليس لديك حساب؟';
  static const String register = 'أنشئ حساباً';
  static const String forgotPassword = 'نسيت كلمة المرور؟';

  // ─── Home ──────────────────────────────────────────────────────────────────
  static const String home = 'الرئيسية';
  static const String greeting = 'مرحباً';
  static const String createRoom = 'إنشاء غرفة';
  static const String joinRoom = 'الانضمام لغرفة';
  static const String leaderboard = 'لوحة المتصدرين';
  static const String howToPlay = 'كيف تلعب؟';

  // ─── Lobby ─────────────────────────────────────────────────────────────────
  static const String waitingRoom = 'غرفة الانتظار';
  static const String roomCode = 'كود الغرفة';
  static const String copyRoomCode = 'نسخ الكود';
  static const String codeCopied = 'تم نسخ الكود!';
  static const String players = 'اللاعبون';
  static const String waitingForPlayers = 'في انتظار اللاعبين...';
  static const String startGame = 'ابدأ اللعبة';
  static const String enterRoomCode = 'أدخل كود الغرفة';
  static const String join = 'انضم';
  static const String minPlayers = 'الحد الأدنى للاعبين: ٢';
  static const String maxPlayers = 'الحد الأقصى للاعبين: ٥';

  // ─── Categories ────────────────────────────────────────────────────────────
  static const String preferredCategories = 'الفئات المفضلة';
  static const String selectCategories = 'اختر فئاتك المفضلة';
  static const String selectCategoriesSubtitle =
      'اختر ما تحب وسيتم دمج اختيارات الجميع';
  static const String categorySelection = 'اختيار الفئة';
  static const String chooseCategory = 'اختر الفئة لهذه الجولة';

  // ─── Game ──────────────────────────────────────────────────────────────────
  static const String round = 'الجولة';
  static const String of = 'من';
  static const String writeAnswer = 'اكتب إجابتك الوهمية';
  static const String writeAnswerSubtitle =
      'اكتب إجابة تبدو صحيحة لتخدع اللاعبين الآخرين';
  static const String answerHint = 'إجابتك الوهمية...';
  static const String submit = 'أرسل الإجابة';
  static const String timeLeft = 'الوقت المتبقي';
  static const String seconds = 'ث';
  static const String vote = 'صوّت للإجابة الصحيحة';
  static const String voteSubtitle = 'أي إجابة تعتقد أنها صحيحة؟';
  static const String cannotVoteOwn = 'لا يمكنك التصويت لإجابتك';
  static const String reveal = 'الكشف عن الإجابات';
  static const String theCorrectAnswer = 'الإجابة الصحيحة';
  static const String yourAnswer = 'إجابتك';
  static const String fooled = 'خدع';
  static const String nobody = 'لا أحد';
  static const String correct = 'صحيح ✓';
  static const String wrong = 'خاطئ ✗';

  // ─── Scoring ───────────────────────────────────────────────────────────────
  static const String roundSummary = 'ملخص الجولة';
  static const String points = 'نقطة';
  static const String correctVotePoints = '+٢ للإجابة الصحيحة';
  static const String fooledPlayerPoints = '+١ لكل لاعب خدعته';
  static const String nextRound = 'الجولة التالية';

  // ─── Final Result ──────────────────────────────────────────────────────────
  static const String finalResult = 'النتيجة النهائية';
  static const String winner = 'الفائز';
  static const String playAgain = 'العب مرة أخرى';
  static const String backHome = 'العودة للرئيسية';

  // ─── Profile ───────────────────────────────────────────────────────────────
  static const String profile = 'الملف الشخصي';
  static const String totalWins = 'الانتصارات';
  static const String gamesPlayed = 'ألعاب';
  static const String totalPoints = 'النقاط';
  static const String editProfile = 'تعديل الملف';

  // ─── Settings ──────────────────────────────────────────────────────────────
  static const String settings = 'الإعدادات';
  static const String language = 'اللغة';
  static const String sound = 'الصوت';
  static const String soundEffects = 'المؤثرات الصوتية';
  static const String notifications = 'الإشعارات';
  static const String logout = 'تسجيل الخروج';
  static const String logoutConfirm = 'هل تريد تسجيل الخروج؟';
  static const String version = 'الإصدار';

  // ─── Common ────────────────────────────────────────────────────────────────
  static const String loading = 'جاري التحميل...';
  static const String error = 'حدث خطأ ما';
  static const String errorDefault = 'حاول مرة أخرى';
  static const String retry = 'إعادة المحاولة';
  static const String empty = 'لا توجد بيانات';
  static const String cancel = 'إلغاء';
  static const String confirm = 'تأكيد';
  static const String ok = 'حسناً';
  static const String back = 'رجوع';
  static const String next = 'التالي';
  static const String save = 'حفظ';
  static const String skip = 'تخطي';
  static const String done = 'تم';
  static const String yes = 'نعم';
  static const String no = 'لا';
  static const String underConstruction = 'قيد الإنشاء';
  static const String comingSoon = 'قريباً...';
}
