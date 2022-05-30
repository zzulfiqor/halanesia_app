class ProductCategoryResponse {
  ProductCategoryResponse(
      {required this.id,
      required this.parentId,
      required this.name,
      required this.depth});

  late final int id;
  late final int? parentId;
  late final String name;
  late final int depth;

  ProductCategoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    depth = json['depth'];
  }
}
