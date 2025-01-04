import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/template/data/repositories/template_repository.dart';
import 'package:staful/feature/template/domain/interfaces/template_interface.dart';
import 'package:staful/feature/template/presentation/provider/template_state.dart';

// final staffNotifierProvider =
//     StateNotifierProvider.autoDispose<TemplateNotifier, TemplateState>((ref) {
    
//   return TemplateNotifier();
// });

class TemplateNotifier extends StateNotifier<TemplateState> {
  final TemplateInterface _templateInterface;

  TemplateNotifier(this._templateInterface) : super(const TemplateState());
}
