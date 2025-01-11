import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/pay_detail/domain/model/pay_detail_model.dart';
import 'package:staful/ui/widgets/overlay_search_results_widget.dart';

final filterPayDetailsUsecaseProvider = Provider((ref) {
  return FilterPayDetailsUsecase();
});

class FilterPayDetailsUsecase {
  List<PayDetailModel> execute(
      {required String text, required List<PayDetailModel> payDetailList}) {
    return payDetailList.where((payDetail) {
      final chosungName = decomposeHangul(payDetail.desc);
      final chosungInput = decomposeHangul(text);
      return chosungName.startsWith(chosungInput);
    }).toList();
  }
}
