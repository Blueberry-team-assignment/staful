import 'package:staful/feature/template/data/dto/template_dto.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';

abstract class TemplateInterface {
  Future<List<TemplateModel>> fetchAllTemplates();

  Future<TemplateModel> updateTemplate({
    required String templateId,
    required TemplateDto dto,
  });

  Future<TemplateModel> createTemplate({required TemplateDto dto});

  Future<void> deleteTemplate({required String templateId});
}
