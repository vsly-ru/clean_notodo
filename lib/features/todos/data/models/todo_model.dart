import 'package:notodo/core/interfaces/model.dart';
import '../../domain/entities/todo.dart';

class TodoDataModel implements IDataModel<ToDo> {
  @override
  ToDo? fromMap(Map<String, dynamic> obj,
      {bool nullInsteadOfThrowing = false}) {
    try {
      return ToDo(
          id: obj['id']!,
          title: obj['title']!,
          description: obj['description']!,
          fullDescription: obj['fullDescription'],
          owner: obj['owner'],
          actor: obj['actor'],
          isComplited: obj['isComplited'] ?? false,
          isInWork: obj['isInWork'] ?? false);
    } catch (err) {
      if (nullInsteadOfThrowing) {
        return null;
      } else {
        rethrow;
      }
    }
  }

  @override
  Map<String, dynamic> toMap(ToDo t) {
    return <String, dynamic>{
      "id": t.id,
      "title": t.title,
      "description": t.description,
      "fullDescription": t.fullDescription,
      "owner": t.owner,
      "actor": t.actor,
      "isComplited": t.isComplited,
      "isInWork": t.isInWork
    };
  }
}
