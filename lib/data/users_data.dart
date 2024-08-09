Map<String, Map>  usersData = {
  'heloo@gmail.com': {
    'password': '1111',
    'name': 'Anna',
  }
};

bool loginChecking(String login) => usersData.containsKey(login);
bool passwordCheking(String login, String pass) {
  if (usersData[login]?['password'] == pass) {
    return true;
  } else {
    return false;
  }
}