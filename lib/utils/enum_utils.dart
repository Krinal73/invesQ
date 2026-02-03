enum AppEnvironment { development, production }

enum TextFormFieldEmptyValidationType { empty }

enum TextFormFieldEmptyAndInvalidValidationType { empty, invalid }

enum ApiStatus {
  unknown,
  loading,
  success,
  error,
  unauthorizedAccess,
  tokenExpired,
  updateApp,
  somethingWentWrong,
  warning,
}

enum SnackBarType { info, error, success, warning }

enum SnackBarPosition { top, bottom }

enum BaseScreenType { profile, members }

enum ProfileSectionType { general, family, education, profession }
