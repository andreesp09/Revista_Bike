import 'package:revistabike_app/config/00-configs.dart';

class RandomFondoImage {
  String returnFondoImage(int pIndex) {
    if (pIndex > 9) {
      pIndex = pIndex % 10;
    }
    switch (pIndex) {
      case 0:
        {
          return fondoImageOne;
        }
      case 1:
        {
          return fondoImageTwo;
        }
      case 2:
        {
          return fondoImageThree;
        }
      case 3:
        {
          return fondoImageFour;
        }
      case 4:
        {
          return fondoImageFive;
        }
      case 5:
        {
          return fondoImageSix;
        }
      case 6:
        {
          return fondoImageOne;
        }
      case 7:
        {
          return fondoImageTwo;
        }
      case 8:
        {
          return fondoImageThree;
        }
      case 9:
        {
          return fondoImageFour;
        }

      default:
        {
          return '';
        }
    }
  }
}
