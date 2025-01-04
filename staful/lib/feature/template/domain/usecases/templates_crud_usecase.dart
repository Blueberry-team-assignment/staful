import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/template/data/dto/template_dto.dart';
import 'package:staful/feature/template/data/repositories/template_repository.dart';
import 'package:staful/feature/template/domain/interfaces/template_interface.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';

final templateCrudUsecaseProvider = Provider((ref) {
  final templateInterface = ref.watch(templateRepositoryProvider);
  return TemplateCrudUsecase(templateInterface, ref);
});

class TemplateCrudUsecase {
  final TemplateInterface _templateInterface;
  final Ref ref;

  TemplateCrudUsecase(this._templateInterface, this.ref);

  Future<void> createTemplate(TemplateModel template) async {
    /// fixxx
    await _templateInterface.createTemplate(
        uid: ref.read(logInProvider).user!.uid,
        dto: TemplateDto.fromJson(template.toJson()));
  }

  Future<List<TemplateModel>> getAllTemplates() async {
    final templates = await _templateInterface.fetchAllTemplates();
    return templates;
  }

  Future<void> updateTemplate(TemplateModel template) async {
    // template.copyWith
    // fixxxx
    await _templateInterface.updateTemplate(
      uid: ref.read(logInProvider).user!.uid,
      dto: TemplateDto.fromJson(template.toJson()),
      templateId: template.id!,
    );
  }

  Future<void> deleteTemplate(String templateId) async {
    // fixxx
    await _templateInterface.deleteTemplate(
        templateId: templateId, uid: ref.read(logInProvider).user!.uid);
  }
}
