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
      state.add(user);
    }
  }

  bool checkUser(String login, String password) {
    for (UserModel user in state) {
      if (user.email == login && user.password == password){
        return true;
      }
    }
    return false;
  }

  String? userName(String login) {
    for (UserModel user in state) {
      if (user.email == login) {
        return user.name;
      }
    }
    return null;
  }

 
}

final userNotifier = NotifierProvider<UserNotifier, Set<UserModel>>((){
  return UserNotifier();
});

final userNameProvider = StateProvider<String>((ref) {
  return '';
});