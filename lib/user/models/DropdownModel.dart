class DropdownModel {
  int id;
  String name;

  DropdownModel({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return name;
  }

}
