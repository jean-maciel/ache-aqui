import 'package:ache_aqui/models/product.dart';

class ProductTracker extends Product {
  final String lastLocation;
  final DateTime lastLocationDate;

  ProductTracker(
    super.name,
    super.category,
    super.trackingCode,
    this.lastLocation,
    this.lastLocationDate,
  );
}
