import 'package:flutter/material.dart';
import 'package:staful/ui/widgets/staff_profile_widget.dart';
import 'package:staful/ui/widgets/submit_button_widget.dart';

class OverlaySearchResultsWidget extends StatefulWidget {
  final List<String> suggestions;
  final TextEditingController controller;
  final void Function(String) onSelect;
  final bool staffSearch;

  const OverlaySearchResultsWidget({
    super.key,
    required this.suggestions,
    required this.controller,
    required this.onSelect,
    this.staffSearch = true,
  });

  @override
  OverlaySearchResultsWidgetState createState() =>
      OverlaySearchResultsWidgetState();
}

class OverlaySearchResultsWidgetState
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

    final inputText = widget.controller.text;

    // 초성 입력인지 여부 확인
    final filteredSuggestions = _searchByChosung(inputText);

    // 필터링된 리스트가 비어 있으면 오버레이를 표시하지 않음
    if (filteredSuggestions.isEmpty) return;

    // 오버레이 생성
    _overlayEntry = _createOverlay(filteredSuggestions);
    Overlay.of(context).insert(_overlayEntry!);
  }

  // 초성 검색 로직 (초성+중성)
  List<String> _searchByChosung(String input) {
    final inputChosung = decomposeHangul(input); // 입력된 텍스트를

    return widget.suggestions.where((suggestion) {
      String chosungName = decomposeHangul(suggestion);
      return chosungName.startsWith(inputChosung);
    }).toList();
  }

  // 초성,중성,종성으로 한글 분리하는 함수
  String decomposeHangul(String input) {
    const int baseCode = 44032; // '가'의 유니코드
    const int chosungBase = 588;
    const int jungseongBase = 28;

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
    const List<String> jungseongList = [
      "ㅏ",
      "ㅐ",
      "ㅑ",
      "ㅒ",
      "ㅓ",
      "ㅔ",
      "ㅕ",
      "ㅖ",
      "ㅗ",
      "ㅘ",
      "ㅙ",
      "ㅚ",
      "ㅛ",
      "ㅜ",
      "ㅝ",
      "ㅞ",
      "ㅟ",
      "ㅠ",
      "ㅡ",
      "ㅢ",
      "ㅣ"
    ];
    const List<String> jongseongList = [
      "",
      "ㄱ",
      "ㄲ",
      "ㄳ",
      "ㄴ",
      "ㄵ",
      "ㄶ",
      "ㄷ",
      "ㄹ",
      "ㄺ",
      "ㄻ",
      "ㄼ",
      "ㄽ",
      "ㄾ",
      "ㄿ",
      "ㅀ",
      "ㅁ",
      "ㅂ",
      "ㅄ",
      "ㅅ",
      "ㅆ",
      "ㅇ",
      "ㅈ",
      "ㅊ",
      "ㅋ",
      "ㅌ",
      "ㅍ",
      "ㅎ"
    ];

    String result = '';
    for (int i = 0; i < input.length; i++) {
      int charCode = input.codeUnitAt(i);

      if (charCode >= baseCode && charCode <= baseCode + 11171) {
        int syllableIndex = charCode - baseCode;
        int chosungIndex = syllableIndex ~/ chosungBase;
        int jungseongIndex = (syllableIndex % chosungBase) ~/ jungseongBase;
        int jongseongIndex = syllableIndex % jungseongBase;

        result += chosungList[chosungIndex] +
            jungseongList[jungseongIndex] +
            jongseongList[jongseongIndex];
      } else {
        if (input[i].isNotEmpty) result += input[i]; // 한글이 아닌 경우 그대로 추가
      }
    }
    return result.toLowerCase();
  }

  OverlayEntry _createOverlay(List<String> filteredSuggestions) {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _removeOverlay(); // 바깥 영역 클릭 시 오버레이 제거
        },
        child: Stack(
          children: [
            Positioned(
              left: 30,
              right: 30,
              top: 210,
              child: Material(
                color: Colors.white,
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
                              if (widget.staffSearch)
                                const StaffProfileWidget(
                                    imagePath:
                                        "lib/assets/images/Ellipse 5.png"),
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
                      if (widget.staffSearch)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: SubmitButtonWidget(text: "직원 등록"),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
