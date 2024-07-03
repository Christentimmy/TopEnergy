import 'package:image_picker/image_picker.dart';

 selectImage() async {
  XFile? file = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    imageQuality: 60,
  );

  if (file != null) {
    return file.readAsBytes();
  }
}
