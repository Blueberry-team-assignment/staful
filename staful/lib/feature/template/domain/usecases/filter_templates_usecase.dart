import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/template/data/repositories/template_repository.dart';
import 'package:staful/feature/template/domain/interfaces/template_interface.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:staful/ui/widgets/overlay_search_results_widget.dart';

final filterTemplatesUsecaseProvider = Provider((ref) {
  final templateInterface = ref.watch(templateRepositoryProvider);
  return FilterTemplatesUsecase(templateInterface, ref);
});

class FilterTemplatesUsecase {
  final TemplateInterface _templateInterface;
  final Ref ref;

  FilterTemplatesUsecase(this._templateInterface, this.ref);

  Future<List<TemplateModel>> execute({required String text}) async {
    final templates = await _templateInterface.fetchAllTemplates(
      uid: ref.read(logInProvider).authUser!.uid,
    );

    if (text.isEmpty) return templates;

    return templates.where((template) {
      final chosungName = decomposeHangul(template.name);
      final chosungInput = decomposeHangul(text);
      return chosungName.startsWith(chosungInput);
    }).toList();
  }
}
