import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/template/domain/interfaces/template_interface.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';

final getTemplatesUsecaseProvider = Provider((ref) {
  return;
});

class GetTemplatesUsecase {
  final TemplateInterface _templateInterface;

  GetTemplatesUsecase(this._templateInterface);

  Future<List<TemplateModel>> execute() async {
    final templates = await _templateInterface.fetchAllTemplates();

    return templates;
  }
}
