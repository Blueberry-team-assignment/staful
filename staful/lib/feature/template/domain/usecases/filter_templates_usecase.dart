import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/template/data/repositories/template_repository.dart';
import 'package:staful/feature/template/domain/interfaces/template_interface.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:staful/ui/widgets/overlay_search_results_widget.dart';

final filterTemplatesUsecaseProvider = Provider((ref) {
  final templateInterface = ref.watch(templateRepositoryProvider);
  return FilterTemplatesUsecase(templateInterface);
});

class FilterTemplatesUsecase {
  final TemplateInterface _templateInterface;

  FilterTemplatesUsecase(this._templateInterface);

  Future<List<TemplateModel>> execute({required String text}) async {
    final templates = await _templateInterface.fetchAllTemplates();

    if (text.isEmpty) return templates;

    return templates.where((template) {
      final chosungName = decomposeHangul(template.name);
      final chosungInput = decomposeHangul(text);
      return chosungName.startsWith(chosungInput);
    }).toList();
  }
}
