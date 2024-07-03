import 'package:topenergy/Resources/constants.dart';

class CustomSnackbar {
  void showErrorMessage(String message) {
    SnackbarUtils.showErrorSnackbar(message);
  }

  void showSuccessMessage(String message) {
    SnackbarUtils.showSuccessSnackbar(message);
  }
}
