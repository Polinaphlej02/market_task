import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_task/models/user_model.dart';

List<UserModel> userData = [
  UserModel(email: "heloo@gmail.com", name: "Nancy", password: "1111"),
  UserModel(email: "aaa@gmail.com", name: "Petr", password: "2222"),
];

final userDataProvider = Provider((ref) {
  return userData;
});

bool authChecking(String login, String password) {
  for (UserModel user in userData) {
    if (user.email == login && user.password == password) {
      return true;
    } else {
      return false;
    }
  }
  throw Exception("Null val");
}




// bool loginChecking(String login) => usersData.containsKey(login);
// bool passwordCheking(String login, String pass) {
//   if (usersData[login]?['password'] == pass) {
//     return true;
//   } else {
//     return false;
//   }
// }

