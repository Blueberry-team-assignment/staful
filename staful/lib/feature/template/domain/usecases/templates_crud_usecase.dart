import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/template/data/dto/template_dto.dart';
import 'package:staful/feature/template/data/repositories/template_repository.dart';
import 'package:staful/feature/template/domain/interfaces/template_interface.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';
import 'package:staful/provider/uid_provider.dart';

final templateCrudUsecaseProvider = Provider((ref) {
  final templateInterface = ref.watch(templateRepositoryProvider);
  final uid = ref.watch(uidProvider);
  return TemplateCrudUsecase(templateInterface, uid);
});

class TemplateCrudUsecase {
  final TemplateInterface _templateInterface;
  final String? uid;

  TemplateCrudUsecase(this._templateInterface, this.uid);

  Future<void> createTemplate(TemplateModel template) async {
    await _templateInterface.createTemplate(
        uid: uid!, dto: TemplateDto.fromJson(template.toJson()));
  }

  Future<List<TemplateModel>> getAllTemplates() async {
    final templates = await _templateInterface.fetchAllTemplates(
      uid: uid!,
    );
    return templates;
  }

  Future<void> updateTemplate(TemplateModel template) async {
    // template.copyWith
    await _templateInterface.updateTemplate(
      uid: uid!,
      dto: TemplateDto.fromJson(template.toJson()),
      templateId: template.id!,
    );
  }

  Future<void> deleteTemplate(String templateId) async {
    await _templateInterface.deleteTemplate(templateId: templateId, uid: uid!);
  }
}
