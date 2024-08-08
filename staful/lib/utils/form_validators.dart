String? validateId(String? value) {
  final RegExp idRegExp = RegExp(
    r'^[a-zA-Z0-9]{4,20}$',
  );

  if (value == null || idRegExp.hasMatch(value)) {
    return null;
  }
  return '아이디는 4자 이상 20자 이하의 영문 대소문자와 숫자만 허용됩니다.';
}

String? validateName(String? value) {
  final RegExp nameRegExp = RegExp(
    r'^[\p{L}\s]+$', // 한글, 영어, 공백만 허용
    unicode: true, // Unicode 문자를 지원하도록 설정
  );

  if (value == null || nameRegExp.hasMatch(value)) {
    return null;
  }
  return '이름은 한글, 영어 및 띄어쓰기만 허용되며, 특수 기호는 포함될 수 없습니다.';
}

String? validatePw(String? value) {
  final RegExp passwordRegExp = RegExp(
    r'^(?!.*\s)[a-zA-Z0-9]{4,20}$',
    unicode: true,
  );
  if (value == null || passwordRegExp.hasMatch(value)) {
    return null;
  }
  return "비밀번호는 대문자 1개와 특수 기호 1개를 포함해 8자 이상이어야 합니다.";
}
