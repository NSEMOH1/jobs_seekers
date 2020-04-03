
abstract class Stringvalidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements Stringvalidator{
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }

}

class EmailAndPasswordValidators {
  final Stringvalidator emailValidator = NonEmptyStringValidator();
  final Stringvalidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = "Email can\t be empty";
  final String invalidPasswordErrorText = "Password can\t be empty";

}