import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

// String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

// class LoginResponse {
//   LoginResponse({
//     required this.token,
//     required this.error,
//   });

//   String token;

//   factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
//         token: json["token"]!=null? json["token"]:"",
//         error: json["error"]!=null? json["error"]:"",
//       );

// Map<String, dynamic> toJson() => {
//       "token": token,
//       "error": error,
//     };
// }
class LoginResponse {
  final String token;
  final String error;
  LoginResponse({required this.token, required this.error});
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
  }
  Map<String, dynamic> toJson() => {
        "token": token,
        "error": error,
      };
}
