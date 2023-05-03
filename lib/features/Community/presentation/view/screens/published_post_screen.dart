import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_utils.dart';
import '../../../../appointment_booking/presentation/view/widgets/my_text_form_filed.dart';

class PublishedPostScreen extends StatefulWidget {
  const PublishedPostScreen({super.key});

  @override
  State<PublishedPostScreen> createState() => _PublishedPostScreenState();
}

class _PublishedPostScreenState extends State<PublishedPostScreen> {
  final TextEditingController postController = TextEditingController();
  File? _imageFile;
  File? image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarOfPublishedPostScreen(),
              Padding(
                padding: EdgeInsets.fromLTRB(18.w, 40.h, 18.w, 0),
                child: Column(
                  children: [
                    MyTextFormFiled(
                      controller: postController,
                      textInputType: TextInputType.text,
                      validator: () {},
                      headerText: 'نص المنشور',
                      maxLines: null,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await getImageFromGallery();
                      },
                      child: Container(
                        height: 220.h,
                        width: 330.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.sp),
                        ),
                        child: image == null
                            ? Icon(
                                Icons.add_a_photo,
                                color: MyColors.primary,
                                size: 40,
                              )
                            : Container(
                                height: 220.h,
                                width: 330.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                      image!,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(14.sp),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        await getImageFromGallery();
                      },
                      style: OutlinedButton.styleFrom(
                          maximumSize: Size(255.w, 45.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            text: 'اضافة صور',
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: Image.asset(
                                AssetsData.gallery,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<File?> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('success picked image jjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
      setState(() {
        image = File(pickedFile.path);
      });
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future<void> _sendImage() async {
    final String apiUrl = 'https://your-api-url.com/upload-image';
    final Dio dio = Dio();
    final FormData formData = FormData.fromMap(
      {
        'image': await MultipartFile.fromFile(_imageFile!.path,
            filename: 'image.png'),
      },
    );
    await dio.post(apiUrl, data: formData);
  }
}

/*
         GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                      child: _imageFile == null
                          ? Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 40,
                            )
                          : Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _imageFile == null ? null : _sendImage,
                    child: Text('Send Image to API'),
                  ),
*/

class AppBarOfPublishedPostScreen extends StatelessWidget {
  const AppBarOfPublishedPostScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      color: MyColors.primary,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                backgroundColor: Colors.white,
                minimumSize: Size(110.w, 38.h),
              ),
              onPressed: () {},
              child: TextUtils(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                text: 'نشر',
                color: MyColors.primary,
              ),
            ),
          ),
          const Spacer(),
          TextUtils(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            text: 'كتابة منشور',
            color: Colors.white,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 19.sp,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
