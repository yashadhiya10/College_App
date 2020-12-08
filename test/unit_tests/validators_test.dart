import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/core/mixins/validators.dart';

class ValidateTest with Validators {}

void main() {
  ValidateTest validateTest = ValidateTest();

  group("Email Validation", () {
    test("Empty email generates error", () {
      final result = validateTest.validateEmail('');

      expect(result, "Please enter a valid email");
    });

    test("Empty without @ generates error", () {
      final result = validateTest.validateEmail('itsamail.com');

      expect(result, "Please enter a valid email");
    });

    test("Empty without domain generates error", () {
      final result = validateTest.validateEmail('itsamail@com');

      expect(result, "Please enter a valid email");
    });

    test("Invalid email generates error", () {
      final result = validateTest.validateEmail('itsamail@.com');

      expect(result, "Please enter a valid email");
    });
  });

  group("Password Validation", () {
    test("Empty password generates error", () {
      final result = validateTest.validatePassword('');

      expect(result, "Please Enter Your Password");
    });

    test("Password with less than 6 chars generates error", () {
      final result = validateTest.validatePassword('12345');

      expect(result, "Your password must be atleast 6");
    });
  });

  group("Roll no. Validation", () {
    test("Empty rollno. generates error", () {
      final result = validateTest.validateRollNo('');

      expect(result, "Please enter your rollno.");
    });

    test("Invalid rollno generates error", () {
      final result = validateTest.validateRollNo('11909080');

      expect(result, "Please enter a valid rollno.");
    });
  });

  group("Phone no. Validation", () {
    test("Empty phone_no. generates error", () {
      final result = validateTest.validatePhoneNo('');

      expect(result, "Please enter your contact details");
    });

    test("Invalid phone_no. generates error", () {
      final result = validateTest.validatePhoneNo('11909080');

      expect(result, "Please enter a valid number");
    });
  });
}
