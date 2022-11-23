import 'package:get/get.dart';
import 'package:ushop_app/model/product_models.dart';
import 'package:ushop_app/services/category_services.dart';

class CategoryController extends GetxController {
  // ignore: non_constant_identifier_names
  var CategoryNameLise = <String>[].obs;
  var isCategoryLoading = false.obs;
  var isAllCategory = false.obs;
  // ignore: non_constant_identifier_names
  var CategoryList = <ProductModels>[].obs;
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryService.getCategory();

    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        CategoryNameLise.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  getAllCategorys(String namecategory) async {
    isAllCategory(true);
    CategoryList.value = await AllCategoryService.getAllCategory(namecategory);

    // try {

    // } finally {
    isAllCategory(false);
    // }
  }

  getCategoryIndex(int index) async {
    var categoryName = await getAllCategorys(CategoryNameLise[index]);
    if (categoryName != null) {
      CategoryList.value = categoryName;
    }
  }
}
