import 'package:staful/domain/models/template_model.dart';

abstract class TemplateRepository {
  Future<List<SelectableTemplate>> fetchTemplates();
}
