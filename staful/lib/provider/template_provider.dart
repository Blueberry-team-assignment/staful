import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/template_repository.dart';
import 'package:staful/domain/models/template_model.dart';
import 'package:staful/domain/template_repository.dart';

// 레포지토리 인스턴스
final templateRepositoryProvider = Provider<TemplateRepository>((ref) => TemplateRepositoryImpl());

// 템플릿 상태 관리
final templateProvider = StateNotifierProvider<TemplateNotifier, List<SelectableTemplate>>((ref) {
  final repository = ref.read(templateRepositoryProvider);
  return TemplateNotifier(repository);
});

class TemplateNotifier extends StateNotifier<List<SelectableTemplate>> {
  final TemplateRepository _repository;

  TemplateNotifier(this._repository) : super([]);

  Future<void> loadTemplates() async {
    final templates = await _repository.fetchTemplates();
    state = templates;
  }
}

