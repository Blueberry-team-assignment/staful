import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staful/data/models/staff_model.dart';
import 'package:staful/data/models/template_model.dart';
import 'package:staful/data/dto/template/create_template_dto.dart';
import 'package:staful/data/dto/template/update_template_dto.dart';

final templateRepositoryProvider = Provider<TemplateInterface>((ref) {
  return TemplateRepository(FirebaseFirestore.instance);
});

abstract class TemplateInterface {
  Future<List<Template>> fetchAllTemplates({
    required String uid,
  });

  Future<Template> updateTemplate({
    required String uid,
    required UpdateTemplateDto updateTemplateDto,
  });

  Future<void> deleteTemplate({
    required String uid,
    required String templateId,
  });

  Future<Template> createTemplate({
    required String uid,
    required CreateTemplateDto createTemplateDto,
  });
}

class TemplateRepository implements TemplateInterface {
  final FirebaseFirestore _firestore;

  TemplateRepository(this._firestore);

  @override
  Future<List<Template>> fetchAllTemplates({
    required String uid,
  }) async {
    final templateList = await _firestore
        .collection('users')
        .doc(uid)
        .collection('template')
        .get();

    return templateList.docs.map((template) {
      // doc id 추가
      final data = template.data();
      data['templateId'] = template.id;

      return Template.fromFirestore(data);
    }).toList();
  }

  @override
  Future<Template> updateTemplate({
    required String uid,
    required UpdateTemplateDto updateTemplateDto,
  }) async {
    try {
      final templateRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('template')
          .doc(updateTemplateDto.templateId);

      await templateRef.update(updateTemplateDto.toJson());

      final updatedDoc = await templateRef.get();
      print('template updated : ${updatedDoc.data()}');
      return Template.fromFirestore(updatedDoc.data()!);
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
  Future<Template> createTemplate({
    required String uid,
    required CreateTemplateDto createTemplateDto,
  }) async {
    try {
      final templateRef =
          _firestore.collection('users').doc(uid).collection('template');

      final newDoc = await templateRef.add(createTemplateDto.toJson());

      final createdDoc = await newDoc.get();
      return Template.fromFirestore(createdDoc.data()!);
    } catch (e) {
      throw Exception('Failed to create staff: $e');
    }
  }
}
