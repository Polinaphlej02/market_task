import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_task/models/user_model.dart';



// bool loginChecking(String login) => usersData.containsKey(login);
// bool passwordCheking(String login, String pass) {
//   if (usersData[login]?['password'] == pass) {
//     return true;
//   } else {
//     return false;
//   }
// }

class UserNotifier extends Notifier<Set<UserModel>> {
  
  @override
  Set<UserModel> build() {
    return {
    };
  }

  void addUser (UserModel user) {
    if (!state.contains(user)) {
      state = {...state, user};
    }
  }

  bool checkUser(String login, String password) {
    for (UserModel user in state) {
      if (user.email == login && user.password == password){
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

 
}

final userNotifier = NotifierProvider<UserNotifier, Set<UserModel>>((){
  return UserNotifier();
});

final userNameProvider = Provider<String>((ref) {
  return "";
});