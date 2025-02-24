// //? model upload
// import 'dart:developer';
// import 'dart:io';

// import 'package:app_shop_ease/core/errors/failure.dart';
// import 'package:app_shop_ease/core/services/api/dio_helper/api_consumer.dart';
// import 'package:app_shop_ease/core/utils/app_image_pick.dart';
// import 'package:dartz/dartz.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadFileResponse {
//   String? originalname;
//   String? filename;
//   String? location;

//   UploadFileResponse({this.originalname, this.filename, this.location});

//   UploadFileResponse.fromJson(Map<String, dynamic> json) {
//     originalname = json['originalname'];
//     filename = json['filename'];
//     location = json['location'];
//   }
// }

// class AppUploadFile {
//   ApiConsumer dio;
//   AppUploadFile({required this.dio});

//   Future<Either<Failure, String?>> uploadImage(XFile image) async {
//     log("uploadImage");
//     try {
//       var response = await dio.post(
//         "/api/v1/files/upload",
//         data: {
//           "file": await uploadImageToAPI(image),
//         },
//         isFormData: true,
//       );
//       var data = UploadFileResponse.fromJson(response);
//       log("${data.location}");
//       return Right(data.location);
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.toString()));
//     } on SocketException catch (e) {
//       return Left(ServerFailure(e.toString()));
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
