import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/payroll_template/data/repositories/template_repository.dart';
import 'package:staful/feature/payroll_template/domain/interfaces/template_interface.dart';
import 'package:staful/feature/payroll_template/domain/model/template_model.dart';
import 'package:staful/provider/uid_provider.dart';
import 'package:staful/ui/widgets/overlay_search_results_widget.dart';

final filterTemplatesUsecaseProvider = Provider((ref) {
  final templateInterface = ref.watch(templateRepositoryProvider);
  final uid = ref.watch(uidProvider);
  return FilterTemplatesUsecase(templateInterface, uid);
});

class FilterTemplatesUsecase {
  final TemplateInterface _templateInterface;
  final String? uid;

  FilterTemplatesUsecase(this._templateInterface, this.uid);

  Future<List<TemplateModel>> execute(
      {required String text, required List<TemplateModel> templateList}) async {
    if (text.isEmpty) return templateList;

    return templateList.where((template) {
      final chosungName = decomposeHangul(template.name);
      final chosungInput = decomposeHangul(text);
      return chosungName.startsWith(chosungInput);
    }).toList();
  }
}
