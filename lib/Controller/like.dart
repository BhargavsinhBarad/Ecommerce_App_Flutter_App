import 'package:af_exam_2/Model/like_model.dart';
import 'package:get/get.dart';

class likecontroller extends GetxController {
  likemodel l1 = likemodel(like: false);

  void like() {
    l1.like = !l1.like;
    update();
  }
}
