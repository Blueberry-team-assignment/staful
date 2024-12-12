import 'package:easy_localization/easy_localization.dart';

String? validateId(String? value) {
  final RegExp idRegExp = RegExp(
    r'^[a-zA-Z0-9]{4,20}$', // 4~20자 영문 대소문자와 숫자만 허용
    unicode: true,
  );

  if ((value ?? '').isEmpty || idRegExp.hasMatch(value!)) {
    return null;
  }
  return 'idValidationText'.tr();
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
    return 'nameValidationText'.tr();
  }

  if (incompleteKoreanRegExp.hasMatch(value) == false) {
    return "generalValidationText".tr();
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
    return "storeNameValidationText".tr();
  }

  if (nameRegExp.hasMatch(value) == false) {
    return "generalValidationText".tr();
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
  return "pwValidationText".tr();
}

String? arePasswordsMatching(String? pw, String? pwConfirm) {
  if ((pwConfirm ?? "").isEmpty || validatePw(pw) == null && pw == pwConfirm) {
    return null;
  }
  return "pwConfirmText".tr();
}
