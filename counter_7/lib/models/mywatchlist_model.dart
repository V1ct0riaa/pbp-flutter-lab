// To parse this JSON data, do
//
//     final mineWatchList = mineWatchListFromJson(jsonString);

import 'dart:convert';

List<MineWatchList> mineWatchListFromJson(String str) => List<MineWatchList>.from(json.decode(str).map((x) => MineWatchList.fromJson(x)));

String mineWatchListToJson(List<MineWatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MineWatchList {
    MineWatchList({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    int userId;
    int id;
    String title;
    bool completed;

    factory MineWatchList.fromJson(Map<String, dynamic> json) => MineWatchList(
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
