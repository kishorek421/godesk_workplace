class AppRegExp {
  //   static final RegExp nameRegExp = RegExp(r'^([a-zA-Z\s])?$');
  //=========================changed regex
  static final RegExp nameRegExp = RegExp(r'^([A-Za-z\s]?){3,50}$');
  static final RegExp mobileRegExp = RegExp(r'^\+?\d{1,4}[\s.-]?\(?\d{1,4}\)?[\s.-]?\d{1,4}[\s.-]?\d{1,9}$');
  static final RegExp password = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  // ASDFG7896K
  static final RegExp panRegExp = RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]{1}');
  static final RegExp accountNoRegExp = RegExp(r'[0-9]{10,18}');
  static final RegExp gstno =
      RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');
  static final RegExp orgAddress = RegExp(r'^\d{1,5}\s[A-Za-z0-9\s\.-]$');
  static final RegExp pincode = RegExp(r'^\d{6}$');

  // SBIN0125620
  static final RegExp ifscCodeRegExp = RegExp(r'^[A-Z]{4}0[0-9]{6}$');
  static final RegExp mailRegExp =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  // 123412341234
  // 1234 1234 1234
  // 1234-1234-1234
  //===============Changed Regex
  static final RegExp aadhaarRegExp = RegExp(r'^\d{4}[\s-]?\d{4}[\s-]?\d{4}$');

  // D61014070660905
  // HR-0619850034761
  static final RegExp licenseRegExp =
      RegExp(r'^[A-Z]{1,2}([- ]?)([ ]?)\d{12,14}$');

  // "^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$"

  // MP 09 AB 1234
  // AH 17 FT 2387
  // UT 32 DR 6423
  // DL 01 C AA 1111
  // static final RegExp registrationNoRegExp = RegExp(r'^[A-Z]{2}\\s[0-9]{2}\\s[A-Z]{2}\\s[0-9]{3,4}$');
  static final RegExp registrationNoRegExp =
      RegExp(r'^[A-Z]{2}[0-9]{1,2}[A-Z]{1,2}[0-9]{3,4}$');

  static final RegExp onlyNoRegExp = RegExp(r'^[0,9]{6}$');

  // static final RegExp mobileno = RegExp(
  //     r'^(?:\+?(\d{1,3}))?[-.\s]?((\d{10})|(\d{3}[-.\s]?\d{3}[-.\s]?\d{4}))$');

  static final RegExp numbersOnly = RegExp("[0-9]");
  static final RegExp alphabetsOnly = RegExp("[a-zA-Z]");
  static final RegExp alphabetsWithSpaceOnly = RegExp("[a-zA-Z ]");

  // static final RegExp alphabetsWithSpaceOnly = RegExp("[a-zA-Z ]");
  static final RegExp alphabetsAndNumbersOnly = RegExp("[0-9a-zA-Z]");
  static final RegExp alphabetsAndNumbersWithSpaceOnly = RegExp("[0-9a-zA-Z ]");
}
