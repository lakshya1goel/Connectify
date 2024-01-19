class AccessTokenFromRefreshTokenModel {
  String? myAccessToken;
  String? fullname;
  String? newUsername;
  bool? success;

  AccessTokenFromRefreshTokenModel(
      {this.myAccessToken, this.fullname, this.newUsername, this.success});

  AccessTokenFromRefreshTokenModel.fromJson(Map<String, dynamic> json) {
    myAccessToken = json['myAccessToken'];
    fullname = json['fullname'];
    newUsername = json['newUsername'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['myAccessToken'] = this.myAccessToken;
    data['fullname'] = this.fullname;
    data['newUsername'] = this.newUsername;
    data['success'] = this.success;
    return data;
  }
}
