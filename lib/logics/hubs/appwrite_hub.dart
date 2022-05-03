import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/services.dart';

import '../../models/message_dto.dart';
import '../../models/product_dto.dart';
import '../../models/template_dto.dart';

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

  // PRODUCTS
  Future<List<ProductDto>> getProducts() async {
    int total, offset = 0;
    List<ProductDto> productList = [];
    do {
      DocumentList result = await database.listDocuments(
        collectionId: products,
        limit: 100,
        offset: offset,
      );
      offset += 100;
      total = result.total;
      for (int i = 0; i < total; i++) {
        productList.add(ProductDto.fromJson(result.documents[i].data));
      }
    } while (total > 0);
    return productList;
  }

  Future<void> addProduct(ProductDto product) async {
    await database.createDocument(
      collectionId: products,
      documentId: 'unique()',
      data: product.toJson(),
    );
  }

  Future<void> editProduct(ProductDto product) async {
    await database.updateDocument(
      collectionId: products,
      documentId: product.id,
      data: product.toJson(),
    );
  }

  Future<void> deleteProduct(ProductDto product) async {
    await database.deleteDocument(
      collectionId: products,
      documentId: product.id,
    );
  }

  // TEMPLATES
  Future<List<TemplateDto>> getTemplates() async {
    int total, offset = 0;
    List<TemplateDto> productList = [];
    do {
      DocumentList result = await database.listDocuments(
        collectionId: templates,
        limit: 100,
        offset: offset,
      );
      offset += 100;
      total = result.total;
      for (int i = 0; i < total; i++) {
        productList.add(TemplateDto.fromJson(result.documents[i].data));
      }
    } while (total > 0);
    return productList;
  }

  Future<void> addTemplate(TemplateDto template) async {
    await database.createDocument(
      collectionId: templates,
      documentId: 'unique()',
      data: template.toJson(),
    );
  }

  Future<void> editTemplate(TemplateDto template) async {
    await database.updateDocument(
      collectionId: templates,
      documentId: template.id,
      data: template.toJson(),
    );
  }

  Future<void> deleteTemplate(TemplateDto template) async {
    await database.deleteDocument(
      collectionId: templates,
      documentId: template.id,
    );
  }

  // MESSAGES
  Future<List<MessageDto>> getMessages() async {
    int total, offset = 0;
    List<MessageDto> productList = [];
    do {
      DocumentList result = await database.listDocuments(
        collectionId: messages,
        limit: 100,
        offset: offset,
      );
      offset += 100;
      total = result.total;
      for (int i = 0; i < total; i++) {
        productList.add(MessageDto.fromJson(result.documents[i].data));
      }
    } while (total > 0);
    return productList;
  }
}
