

class PropertyOwner {
  PropertyOwner({
    required this.id,
    required this.name,
    required this.mobile,
  });

  String id;
  String name;
  String mobile;

  factory PropertyOwner.fromMap(Map<String, dynamic> json) => PropertyOwner(
    id: json["_id"],
    name: json["name"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "mobile": mobile,
  };
}
