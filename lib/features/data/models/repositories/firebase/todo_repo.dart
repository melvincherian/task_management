import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management/features/data/models/todo_model.dart';

class TodoRepository{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
    
  Future<void>createTodo(TodoModel todo)async{
    try{
      await _firestore.collection('todos').doc(todo.id).set(todo.toJson());
      print('todo addedd successfully');

    }catch(e){
      print('Error adding todo$e');
      rethrow;
    }
  }

  Future<void>editTodo(TodoModel todo)async{
  try{
    await _firestore.collection('todos').doc(todo.id).update(todo.toJson());
  }catch(e){
    print('Error updating todo $e');
  }
  }

  Future<void>deleteTodo(String id)async{
    try{
      await _firestore.collection('todos').doc(id).delete();
    }catch(e){
      print('Error deleting to do');
    }
  }

}