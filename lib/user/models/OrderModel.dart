
import 'OrderUserModel.dart';
import 'PackageDataModel.dart';
import 'PropertyOrderModel.dart';
import 'StatusModel.dart';

class OrderModel {
  OrderModel({
    required this.id,
    required this.numberOfPersons,
    required this.currentStatus,
    required this.bookCountForThisUser,
    required this.date,
    required this.dateString,
    required this.status,
    required this.transaction,
    required this.customerMoney,
    required this.property,
    required this.user,
    required this.package,
    required this.packageData,
    required this.packageType,
    required this.tag,
    required this.appMoney,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingNumber,
    required this.v,
  });

  String id;
  int numberOfPersons;
  String currentStatus;
  int bookCountForThisUser;
  DateTime date;
  DateTime dateString;
  List<StatusModel> status;
  num transaction;
  num customerMoney;
  PropertyOrderModel property;
  OrderUserModel user;
  String package;
  PackageDataModel packageData;
  String packageType;
  String tag;
  num appMoney;
  DateTime createdAt;
  DateTime updatedAt;
  String bookingNumber;
  int v;

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
    id: json["_id"],
    numberOfPersons: json["number_of_persons"],
    currentStatus: json["current_status"],
    bookCountForThisUser: json["book_count_for_this_user"],
    date: DateTime.parse(json["date"]),
    dateString: DateTime.parse(json["date_string"]??DateTime.now().toIso8601String()),
    status: List<StatusModel>.from(json["status"].map((x) => StatusModel.fromMap(x))),
    transaction: json["transaction"],
    customerMoney: json["customer_money"],
    property: PropertyOrderModel.fromMap(json["property"]),
    user: OrderUserModel.fromMap(json["user"]),
    package: json["package"],
    packageData: json["package_data"]!=null?PackageDataModel.fromMap(json["package_data"]): json["package_data"],
    packageType: json["package_type"],
    tag: json["tag"],
    appMoney: json["app_money"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bookingNumber: json["booking_number"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "number_of_persons": numberOfPersons,
    "current_status": currentStatus,
    "book_count_for_this_user": bookCountForThisUser,
    "date": date.toIso8601String(),
    "date_string": "${dateString.year.toString().padLeft(4, '0')}-${dateString.month.toString().padLeft(2, '0')}-${dateString.day.toString().padLeft(2, '0')}",
    "status": List<dynamic>.from(status.map((x) => x.toMap())),
    "transaction": transaction,
    "customer_money": customerMoney,
    "property": property.toMap(),
    "user": user.toMap(),
    "package": package,
    "package_data": packageData.toMap(),
    "package_type": packageType,
    "tag": tag,
    "app_money": appMoney,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "booking_number": bookingNumber,
    "__v": v,
  };
}
