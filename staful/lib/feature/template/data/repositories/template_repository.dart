import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/feature/auth/presentation/provider/log_in_provider.dart';
import 'package:staful/feature/template/data/dto/template_dto.dart';
import 'package:staful/feature/template/domain/interfaces/template_interface.dart';
import 'package:staful/feature/template/domain/model/template_model.dart';

final templateRepositoryProvider = Provider<TemplateInterface>((ref) {
  return TemplateRepository(FirebaseFirestore.instance, ref);
});

class TemplateRepository implements TemplateInterface {
  final FirebaseFirestore _firestore;
  final Ref _ref;

  TemplateRepository(this._firestore, this._ref);

  @override
  Future<List<TemplateModel>> fetchAllTemplates() async {
    final uid = _ref.read(logInProvider).user?.uid;

    final templateList = await _firestore
        .collection('users')
        .doc(uid)
        .collection('template')
        .get();

    return templateList.docs.map((template) {
      // doc id 추가
      final data = template.data();
      data['id'] = template.id;

      return TemplateModel.fromJson(data);
    }).toList();
  }

  @override
  Future<TemplateModel> updateTemplate({
    required String uid,
    required String templateId,
    required TemplateDto dto,
  }) async {
    try {
      final templateRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('template')
          .doc(templateId);

      await templateRef.update(dto.toJson());

      final updatedDoc = await templateRef.get();
      print('template updated : ${updatedDoc.data()}');
      return TemplateModel.fromJson(updatedDoc.data()!);
    } catch (e) {
      throw Exception('Failed to update template: $e');
    }
  }

  @override
  Future<void> deleteTemplate({
    required String uid,
    required String templateId,
  }) async {
    try {
      final templateRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('template')
          .doc(templateId);

      await templateRef.delete();
    } catch (e) {
      throw Exception('Failed to delete template: $e');
    }
  }

  @override
  Future<TemplateModel> createTemplate({
    required String uid,
    required TemplateDto dto,
  }) async {
    try {
      final templateRef =
          _firestore.collection('users').doc(uid).collection('template');

      final newDoc = await templateRef.add(dto.toJson());

      final createdDoc = await newDoc.get();
      return TemplateModel.fromJson(createdDoc.data()!);
    } catch (e) {
      throw Exception('Failed to create staff: $e');
    }
  }
}
