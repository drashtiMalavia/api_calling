import 'dart:convert';
/// userId : 1
/// id : 1
/// title : "delectus aut autem"
/// completed : false

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));
String todoModelToJson(TodoModel data) => json.encode(data.toJson());
class TodoModel {
  TodoModel({
      num? userId, 
      num? id, 
      String? title, 
      bool? completed,}){
    _userId = userId;
    _id = id;
    _title = title;
    _completed = completed;
}

  TodoModel.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _completed = json['completed'];
  }
  num? _userId;
  num? _id;
  String? _title;
  bool? _completed;

  num? get userId => _userId;
  num? get id => _id;
  String? get title => _title;
  bool? get completed => _completed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['completed'] = _completed;
    return map;
  }

}