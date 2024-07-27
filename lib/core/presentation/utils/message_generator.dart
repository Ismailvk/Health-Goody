class MessageGenerator {
  static const Map<String, Map<String, String>> _messageMap = {
    "en": {
      "un-expected-error": "Some un expected error happened!",
      "un-expected-error-message": "Some un expected error happened!",
      "auth-signin": "Sign In",
      "auth-signin-no-account": "Don't have an account? ",
      "auth-signin-methods": "Or sign in with",
      "auth-signin-message": "Hi! Welcome back, you've been missed",
      "auth-create-account": "Create Account",
      "auth-select-gender": "Select Gender",
      "user-enter-name": "Enter Your Name",
      "user-enter-age": "Enter Your Age",
      "auth-complete-profile-message":
          "Don't worry, Only you can see your personal data. No one else will be able to see it.",
      "auth-create-account-message":
          "Fill your information below or register with your own account.",
      "auth-visit-site-guide": "Agree with https://github.com/IsmailVk/",
    }
  };

  static const Map<String, Map<String, String>> _labelMap = {
    "en": {
      "OK": "OK",
      "email": "Email",
      "password": "Password",
      "name": "Name",
      "mobile": "Mobile No",
      "auth-complete-profile": "Complete Your Profile",
      "age": "Age",
      "profile": "Profile",
      "create-account": "Create Account",
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
