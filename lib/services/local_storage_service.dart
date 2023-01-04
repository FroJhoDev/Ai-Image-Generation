import 'package:shared_preferences/shared_preferences.dart';

saveOnLocalStorage(String prompText) async {
  final prefs = await SharedPreferences.getInstance();
  const key = 'last_prompts';
  List<String> mypromptsList = prefs.getStringList(key) ?? [];
  mypromptsList.add(prompText);
  prefs.setStringList(key, mypromptsList);
}

Future<List<String>> readOnLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  const key = 'last_prompts';
  List<String> mypromptsList = prefs.getStringList(key) ?? [];
  return mypromptsList;
}

Future<List<String>> removeFromLocalStorage(int prompIndex) async {
  final prefs = await SharedPreferences.getInstance();
  const key = 'last_prompts';
  List<String> mypromptsList = prefs.getStringList(key) ?? [];

  mypromptsList.removeAt(prompIndex);

  prefs.setStringList(key, mypromptsList);
  return mypromptsList;
}
