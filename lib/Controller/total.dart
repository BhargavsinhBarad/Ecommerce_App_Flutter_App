import 'package:af_exam_2/Model/total_model.dart';
import 'package:af_exam_2/Views/Utils/List.dart';
import 'package:get/get.dart';

class totalcontter extends GetxController {
  totalmodel ta = totalmodel(total: 0.obs);

  void sum() {
    cartproduct.forEach(
      (e) {
        ta.total += e['price'];
      },
    );
  }
}
