import 'package:appwrite/appwrite.dart';
import 'package:flutter/services.dart';

class AppwriteHub {
  AppwriteHub._internal();

  factory AppwriteHub() {
    return _instance;
  }

  static final AppwriteHub _instance = AppwriteHub._internal();

  static const String endpoint = 'https://appwrite.expir.app/v1';
  static const String projectId = 'expirapp';
  static const String products = 'expirapp';
  static const String templates = 'templates';
  static const String messages = 'messages';

  late Client client;
  late Account account;

  void initHub() {
    client = Client(endPoint: endpoint);
    account = Account(client);
    client.setProject(projectId);
  }

  Future<void> login() async {
    try {
      String result = await account.createOAuth2Session(
        provider: 'amazon',
        
      );
      print(result);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
