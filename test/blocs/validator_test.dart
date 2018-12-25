import 'package:flutter_test/flutter_test.dart';
import 'package:login_form_bloc/src/blocs/validator.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  test("validateEmail: valid email", () {
    Observable.just("abc@cba.com")
        .transform(Validator().validateEmail)
        .listen((email) {
      expect(email, "abc@cba.com");
    });
  });

  test("validateEmail: invalid email", () {
    Observable.just("invalid").transform(Validator().validateEmail).listen(
        (email) {
      expect(false, "Not expected to reach here");
    }, onError: (error) {
      expect("Please enter a valid email address", error);
    });
  });

  test("validatePassword: valid password", () {
    Observable.just("validPassword")
        .transform(Validator().validatePassword)
        .listen((password) {
      expect(password, "validPassword");
    });
  });

  test("validateEmail: invalid email", () {
    Observable.just("invalid").transform(Validator().validatePassword).listen(
        (password) {
      expect(false, "Not expected to reach here");
    }, onError: (error) {
      expect(
          "Password contains six characters or more and has at least one lowercase and one uppercase alphabetical character or has at least one lowercase and one numeric character or has at least one uppercase and one numeric character.",
          error);
    });
  });
}
