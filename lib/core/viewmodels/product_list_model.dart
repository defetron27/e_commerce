import 'package:e_commerce/core/enums/view_state.dart';
import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/core/services/api.dart';
import 'package:e_commerce/helpers/dependency_assembly.dart';

import 'base_model.dart';

class ProductListModel extends BaseModel {
  API api = dependencyAssembler<API>();

  List<Product>? _products;

  List<Product> get products {
    return _products ?? <Product>[];
  }

  Future getProducts() async {
    applyState(ViewState.busy);
    _products = await api.getProducts();
    applyState(ViewState.idle);
  }
}