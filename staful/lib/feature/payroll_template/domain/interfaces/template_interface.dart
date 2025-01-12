import 'package:staful/feature/payroll_template/data/dto/template_dto.dart';
import 'package:staful/feature/payroll_template/domain/model/template_model.dart';

abstract class TemplateInterface {
  Future<List<TemplateModel>> fetchAllTemplates({
    required String uid,
  });

  Future<TemplateModel> updateTemplate({
    required String uid,
    required String templateId,
    required TemplateDto dto,
  });

  Future<TemplateModel> createTemplate({
    required TemplateDto dto,
    required String uid,
  });

  Future<void> deleteTemplate({
    required String templateId,
    required String uid,
  });
}
