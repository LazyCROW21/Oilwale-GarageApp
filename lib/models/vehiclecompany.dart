class VehicleCompany {
  late final String vehicleCompanyId;
  late final String vehicleCompany;

  VehicleCompany(
      {required this.vehicleCompanyId, required this.vehicleCompany});

  VehicleCompany.fromJSON(Map<String, dynamic> json) {
    this.vehicleCompanyId = json['vehicleCompanyId'];
    this.vehicleCompany = json['vehicleCompany'];
  }
}
