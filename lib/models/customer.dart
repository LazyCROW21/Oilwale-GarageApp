class Customer {
  late bool active;
  late String customerId;
  late String customerName;
  late String customerPhoneNumber;
  late String customerAddress;
  late String customerPincode;
  String? garageReferralCode;
  String? createdAt;
  String? updatedAt;

  Customer(
      {required this.active,
      required this.customerId,
      required this.customerName,
      required this.customerPhoneNumber,
      required this.customerAddress,
      required this.customerPincode,
      this.garageReferralCode,
      required this.createdAt,
      required this.updatedAt});

  Customer.fromJSON(Map<String, dynamic> json) {
    this.active = json['active'];
    this.customerId = json['customerId'];
    this.customerName = json['customerName'];
    this.customerPhoneNumber = json['customerPhoneNumber'];
    this.customerAddress = json['customerAddress'];
    this.customerPincode = json['customerPincode'];
    this.garageReferralCode = json['garageReferralCode'];
    this.createdAt = json['createdAt'];
    this.updatedAt = json['updatedAt'];
  }
}
