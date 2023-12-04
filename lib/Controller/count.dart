import 'package:get/get.dart';

import '../Model/count_model.dart';

class countercontter extends GetxController {
  countermodel countmodel = countermodel(counter: 1.obs);

  void Increment() {
    countmodel.counter++;
  }

  void Decrement() {
    countmodel.counter--;
  }
}
