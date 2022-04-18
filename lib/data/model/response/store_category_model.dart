// To parse this JSON Data, do
//
//     final storeCategoryModel = storeCategoryModelFromJson(jsonString);
class StoreCategoryModel {
    StoreCategoryModel({
        this.id,
        this.parentCategory,
        this.createdAt,
        this.updatedAt,
        this.title,
    });

    int? id;
    dynamic parentCategory;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? title;

    factory StoreCategoryModel.fromJson(Map<String, dynamic> json) => StoreCategoryModel(
        id: json["id"],
        parentCategory: json["parent_category"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parent_category": parentCategory,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "title": title,
    };
}
