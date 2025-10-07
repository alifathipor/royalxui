// import 'dart:async';
// import 'package:dio/dio.dart';
// import 'package:royalxui_app/pages/auth/auth_md.dart' as md;

// import 'package:royalxui_app/toolkit.dart' as t;

// Future<md.OtpResponseModel> postSignInOtp({
//   CancelToken? cancelToken,
//   required Future<void> Function()? retryRequest,
//   required md.OtpRequestModel body,
// }) async {
//   try {
//     Response response = await t.HttpClient(retryRequest: retryRequest).post(
//       t.Urls.signInOtp,
//       cancelToken: cancelToken,
//       body: body.toJson(),
//       isSuccessStatus: false,
//     );

//     return md.OtpResponseModel.fromJson(response.data);
//   } on DioException catch (error) {
//     throw error.message ?? '';
//   } catch (error) {
//     throw error.toString();
//   }
// }

// Future<md.AuthResponseModel> postOtpVerify({
//   CancelToken? cancelToken,
//   required Future<void> Function()? retryRequest,
//   required md.OtpVerifyRequestModel body,
// }) async {
//   try {
//     Response response = await t.HttpClient(retryRequest: retryRequest).post(
//       t.Urls.verify,
//       cancelToken: cancelToken,
//       body: body.toJson(),
//       isSuccessStatus: false,
//     );

//     if (response.data == null) {
//       throw Exception('Response data is null');
//     }
//     return md.AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
//   } on DioException catch (error) {
//     throw error.message ?? '';
//   } catch (error) {
//     throw error.toString();
//   }
// }

// Future<md.PostUserRes> postUser({
//   CancelToken? cancelToken,
//   required Future<void> Function()? retryRequest,
//   required md.AppUser body,
// }) async {
//   try {
//     Response response = await t.HttpClient(retryRequest: retryRequest).post(
//       t.Urls.users,
//       cancelToken: cancelToken,
//       body: body.toMap(),
//       isSuccessStatus: false,
//     );

//     if (response.data == null) {
//       throw Exception('Response data is null');
//     }
//     return md.PostUserRes.fromJson(response.data as Map<String, dynamic>);
//   } on DioException catch (error) {
//     throw error.message ?? '';
//   } catch (error) {
//     throw error.toString();
//   }
// }

