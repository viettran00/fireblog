
class PasswordValidation{
  final String password;

  PasswordValidation(this.password);

  bool isValidPassword(){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(password);
  }
}