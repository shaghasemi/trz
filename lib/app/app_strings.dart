class Strings {
  bool convertStrToBool(final String value) =>
      value.toString().toLowerCase() == 'true';

  bool validEmail(final String email) => RegExp(
          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  String? validateEmail(final String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  // View
  static String get viewEmpty => "No Items Found";

  // File
  static String get successSave => "Saved Successfully";

  static String get failedSave => "Could not get save directory";

  static String get failFileSelect => "No file selected";

  static String get selectFile => "Select a file first";

  // Network

  static String get networkError => "Check internet connection and try again";

  static String get unknownError => "Unknown Error";

  static String get retry => "Try Again";

  static String get unknownTry => "Unknown Error. Try Again";

  static String get retrieveErrorTry => "Error retrieving data. Try Again";

  static String get noData => "No data was found!";

  static String get failedToken => "Failed retrieving user identity";

  static String get tryAgain => "Please try again";

  static String get errorAuthentication =>
      "Error authenticating user. Please login again.";

  // Validation

  static String get isEmpty => "This field cannot be empty";

  // Other

  static String get failedBuild => "Build Failed";

  static String get idMissing => "No ID for this trip";

  static String get loremLong =>
      "Amet minim mollit non deserunt ullamco est sit aliqua dolor"
      " do amet sint. Velit officia consequat duis enim velit mollit."
      " Exercitation veniam consequat sunt nostrud amet. Amet minim"
      " mollit non deserunt ullamco est sit aliqua dolor do amet sint."
      " Velit officia consequat duis enim velit mollit. Exercitation"
      " veniam consequat sunt nostrud amet.";
}
