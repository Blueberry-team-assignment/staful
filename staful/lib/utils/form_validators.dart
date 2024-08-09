String? validateId(String? value) {
  final RegExp idRegExp = RegExp(
    r'^[a-zA-Z0-9]{4,20}$', // 4~20자 영문 대소문자와 숫자만 허용
    unicode: true,
  );

  if ((value ?? '').isEmpty || idRegExp.hasMatch(value!)) {
    return null;
  }
  return '아이디는 4자 이상 20자 이하의 영문 대소문자와 숫자만 허용됩니다.';
}

String? validateName(String? value) {
  final RegExp nameRegExp = RegExp(
    r'^[\p{L}\s]+$', // 한글, 영어, 공백만 허용
    unicode: true,
  );
  final RegExp incompleteKoreanRegExp = RegExp(
    r'^[a-zA-Z가-힣\s]+$', // 자음과 모음 단독으로 있는 경우 검출
    unicode: true,
  );

  if ((value ?? '').isEmpty) {
    return null;
  }

  if (nameRegExp.hasMatch(value!) == false) {
    return '숫자와 특수 기호는 포함될 수 없습니다.';
  }

  if (incompleteKoreanRegExp.hasMatch(value) == false) {
    return "형식이 올바르지 않습니다.";
  }
  return null;
}

String? validateStoreName(String? value) {
  final RegExp nameRegExp = RegExp(
    r'^[a-zA-Z가-힣0-9\s]+$', // 한글, 영어, 숫자, 공백만 허용
    unicode: true,
  );
  RegExp specialCharsRegExp = RegExp(
    r'[!@#\$%^&*(),.?":;{}|<>]',
    unicode: true,
  );

  if ((value ?? '').isEmpty) {
    return null;
  }

  if (specialCharsRegExp.hasMatch(value!) == true) {
    return "특수기호는 포함될 수 없습니다.";
  }

  if (nameRegExp.hasMatch(value) == false) {
    return "형식이 올바르지 않습니다.";
  }
  return null;
}

String? validatePw(String? value) {
  final RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[!@#$%^&*()])[a-zA-Z0-9!@#$%^&*()]{8,20}$', // 영문대문자 1개, 특수기호 1개 포함해 8~20자 허용
    unicode: true,
  );
  if ((value ?? '').isEmpty || passwordRegExp.hasMatch(value!)) {
    return null;
  }
  return "비밀번호는 대문자 1개와 특수 기호 1개를 포함해 8자 이상 20자 이하여야 합니다.";
}

String? arePasswordsMatching(String? pw, String? pwConfirm) {
  if ((pwConfirm ?? "").isEmpty || validatePw(pw) == null && pw == pwConfirm) {
    return null;
  }
  return "비밀번호가 일치하지 않습니다.";
}
