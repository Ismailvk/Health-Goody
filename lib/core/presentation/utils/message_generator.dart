class MessageGenerator {
  static const Map<String, Map<String, String>> _messageMap = {
    "en": {
      "un-expected-error": "Some un expected error happened!",
      "un-expected-error-message": "Some un expected error happened!",
      "auth-signin": "Sign In",
      "auth-signin-no-account": "Don't have an account? ",
      "auth-signin-methods": "Or sign in with",
      "auth-signin-message": "Hi! Welcome back, you've been missed",
      "auth-visit-site-guide":
          "To explore in-depth instructions for utilizing this rapid starter Flutter project, head over to https://github.com/midhunarmid/health_goody to kick off your journey.",
    }
  };

  static const Map<String, Map<String, String>> _labelMap = {
    "en": {
      "OK": "OK",
      "email": "Email",
      "password": "Password",
      "name": "Name",
    }
  };

  static String getMessage(String message) {
    return (_messageMap[getLanguage()] ?? {})[message] ?? message;
  }

  static String getLabel(String label) {
    return (_labelMap[getLanguage()] ?? {})[label] ?? label;
  }

  static String getLanguage() {
    // Implement multi language support here
    return "en";
  }
}
