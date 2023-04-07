

part of 'model.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.status,
        required this.msg,
        required this.user,
        required this.token,
    });

    String status;
    String msg;
    User user;
    String token;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        msg: json["msg"],
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    User({
        required this.id,
        required this.nama,
        required this.email,
        required this.password,
        required this.passwordConfirmation,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String nama;
    String email;
    String password;
    String passwordConfirmation;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
