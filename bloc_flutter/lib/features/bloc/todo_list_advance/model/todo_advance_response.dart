import 'dart:convert';

List<TodoAdvanceResponse> todoAdvanceResponseFromJson(String str) => List<TodoAdvanceResponse>.from(json.decode(str).map((x) => TodoAdvanceResponse.fromJson(x)));

String todoAdvanceResponseToJson(List<TodoAdvanceResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoAdvanceResponse {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    TodoAdvanceResponse({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory TodoAdvanceResponse.fromJson(Map<String, dynamic> json) => TodoAdvanceResponse(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title, 
        "completed": completed,
    };
}
