import 'package:flutter/material.dart';
import 'package:staful/widgets/staff_profile_widget.dart';
import 'package:staful/widgets/submit_button_widget.dart';

class OverlaySearchResultsWidget extends StatefulWidget {
  final List<String> suggestions;
  final TextEditingController controller;
  final void Function(String) onSelect;

  const OverlaySearchResultsWidget({
    super.key,
    required this.suggestions,
    required this.controller,
    required this.onSelect,
  });

  @override
  _OverlaySearchResultsWidgetState createState() =>
      _OverlaySearchResultsWidgetState();
}

class _OverlaySearchResultsWidgetState
    extends State<OverlaySearchResultsWidget> {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_showOverlay);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_showOverlay);
    _removeOverlay(); // dispose 시 오버레이를 삭제
    super.dispose();
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  void _showOverlay() {
    // 기존 오버레이가 있으면 삭제
    _removeOverlay();

    if (widget.controller.text.isEmpty) return;

    final inputText2 = widget.controller.text;
    final inputText = widget.controller.value.text;
    print("value : $inputText");
    print("value2 : $inputText2");

    // 초성 입력인지 여부 확인
    final filteredSuggestions = _isKorean(inputText)
        ? _searchByChosungOnly(inputText) // 초성만 입력된 경우
        : _isKorean(inputText)
            ? _searchByChosung(inputText) // 초성+중성 입력된 경우
            : _searchByEnglish(inputText); // 영어 입력된 경우

    // 필터링된 리스트가 비어 있으면 오버레이를 표시하지 않음
    if (filteredSuggestions.isEmpty) return;

    // 오버레이 생성
    _overlayEntry = _createOverlay(filteredSuggestions);
    Overlay.of(context).insert(_overlayEntry!);
  }

  // 한글인지 여부 확인
  bool _isKorean(String input) {
    // 한글 초성 또는 완성된 한글 음절인지 확인하는 정규식
    final regex = RegExp(r'^[\u1100-\u1112\uAC00-\uD7A3]+$');
    print(regex.hasMatch(input));
    return regex.hasMatch(input);
  }

  // 초성만 입력된 상태인지 확인
  bool _isChosungOnly(String input) {
    // 초성만 입력된 경우는 유니코드 범위에서 초성만 해당하는 문자들로만 구성된 경우
    print("ㄱ".codeUnits);
    print(input.codeUnits);
    return input.codeUnits.every((unit) => unit >= 0x1100 && unit <= 0x1112);
  }

  // 초성만 입력된 경우 검색
  List<String> _searchByChosungOnly(String input) {
    final inputChosung = input; // 입력된 문자 자체가 초성일 경우 그대로 사용
    print("inputChosung");
    print(inputChosung);
    return widget.suggestions.where((suggestion) {
      String chosungName = getChosung(suggestion);
      print("chosungName :");
      print(chosungName);
      return chosungName.startsWith(inputChosung); // 초성만 비교
    }).toList();
  }

  // 초성 검색 로직 (초성+중성)
  List<String> _searchByChosung(String input) {
    final inputChosung = getChosung(input); // 입력된 텍스트에서 초성 추출

    return widget.suggestions.where((suggestion) {
      String chosungName = getChosung(suggestion);
      return chosungName.startsWith(inputChosung); // 초성+중성으로 시작하는지 확인
    }).toList();
  }

  // 기존 로직 (영어 검색)
  List<String> _searchByEnglish(String input) {
    return widget.suggestions
        .where((suggestion) =>
            suggestion.isNotEmpty &&
            suggestion.toLowerCase().contains(input.toLowerCase()))
        .toList();
  }

  // 초성을 추출하는 함수
  String getChosung(String input) {
    const int baseCode = 44032; // '가'의 유니코드
    const int chosungBase = 588; // 각 초성의 간격
    const List<String> chosungList = [
      "ㄱ",
      "ㄲ",
      "ㄴ",
      "ㄷ",
      "ㄸ",
      "ㄹ",
      "ㅁ",
      "ㅂ",
      "ㅃ",
      "ㅅ",
      "ㅆ",
      "ㅇ",
      "ㅈ",
      "ㅉ",
      "ㅊ",
      "ㅋ",
      "ㅌ",
      "ㅍ",
      "ㅎ"
    ];

    String result = '';
    for (int i = 0; i < input.length; i++) {
      int charCode = input.codeUnitAt(i);

      // 완성된 한글 음절인지 확인 (유니코드 범위에 있는지)
      if (charCode >= baseCode && charCode <= baseCode + 11171) {
        int chosungIndex = (charCode - baseCode) ~/ chosungBase;
        result += chosungList[chosungIndex];
      } else if (charCode >= 0x1100 && charCode <= 0x1112) {
        // 한글 초성 유니코드 범위에서 초성 추출 (ㄱ~ㅎ)
        result += String.fromCharCode(charCode);
      } else {
        result += input[i]; // 한글이 아닌 경우 그대로 추가
      }
    }
    return result;
  }

  OverlayEntry _createOverlay(List<String> filteredSuggestions) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: 31,
        right: 31,
        top: 215,
        child: Material(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: filteredSuggestions.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const StaffProfileWidget(imageName: "Ellipse 5.png"),
                        Expanded(
                          child: ListTile(
                            title: Text(filteredSuggestions[index]),
                            onTap: () {
                              widget.onSelect(filteredSuggestions[index]);
                              _removeOverlay(); // 선택 후 오버레이 제거
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: SubmitButtonWidget(text: "직원 등록"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
