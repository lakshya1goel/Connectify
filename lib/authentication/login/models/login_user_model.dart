class LoginUserModel {
  String? accessToken;
  String? refreshToken;
  String? userId;
  String? email;
  String? profileImageUrl;
  String? msg;
  bool? success;

  LoginUserModel(
      {this.accessToken,
        this.refreshToken,
        this.userId,
        this.email,
        this.profileImageUrl,
        this.msg,
        this.success});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    userId = json['userId'];
    email = json['email'];
    profileImageUrl = json['profileImageUrl'];
    msg = json['msg'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['profileImageUrl'] = this.profileImageUrl;
    data['msg'] = this.msg;
    data['success'] = this.success;
    return data;
  }
}
