import 'dart:convert';

bool isValidJson(String jsonString) {
  try {
    if (jsonString.isEmpty) return false;
    json.decode(jsonString);
  } catch (e) {
    return false;
  }
  return true;
}
