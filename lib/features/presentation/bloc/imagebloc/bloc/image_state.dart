part of 'image_bloc.dart';

@immutable
sealed class ImageState {}

final class ImageInitial extends ImageState {}

final class ImagePickerSuccess extends ImageState{
  final File imageFile;

  ImagePickerSuccess(this.imageFile);

}
final class ImagePickerFailure extends ImageState{
  final String message;

  ImagePickerFailure(this.message);
}