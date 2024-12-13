import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:staful/domain/models/template_model.dart';
import 'package:staful/domain/template_repository.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  @override
  Future<List<SelectableTemplate>> fetchTemplates() async {
    final snapshot = await FirebaseFirestore.instance.collection('templates').get();
    return snapshot.docs
        .map((doc) => SelectableTemplate.fromFirestore(doc.data()))
        .toList();
  }
}