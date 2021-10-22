class EmailValidation{
  final String email;

  EmailValidation(this.email);

  bool isValidEmail(){

    String  pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    bool emailValid = regExp.hasMatch(email);
    return emailValid;
  }
}