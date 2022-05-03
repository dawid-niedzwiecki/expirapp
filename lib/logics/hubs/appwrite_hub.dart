import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/services.dart';

import '../../models/product_model.dart';

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
  late Database database;

  void initHub() {
    client = Client(endPoint: endpoint);
    account = Account(client);
    client.setProject(projectId);
    database = Database(client);
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

  Future<List<ProductModel>> getProducts() async {
    int total, offset = 0;
    List<ProductModel> productList = List.empty();
    do {
      DocumentList result = await database.listDocuments(
        collectionId: products,
        limit: 100,
        offset: offset,
      );
      offset += 100;
      total = result.total;
      for (int i = 0; i < total; i++) {
        productList.add(ProductModel.fromJson(result.documents[i].data));
      }
    } while (total > 0);
    return productList;
  }
}
