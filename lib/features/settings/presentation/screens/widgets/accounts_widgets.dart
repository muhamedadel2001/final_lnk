import 'package:final_lnk/core/util/fonts.dart';
import 'package:final_lnk/core/util/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:final_lnk/core/util/screens.dart' as screens;

class AccountsWidgets extends StatelessWidget {
  const AccountsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  LangKeys.subAccounts,
                  style: getStyleBold16(context),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, screens.addSubScreen);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF609966)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  LangKeys.addSub,
                  style: getStyleBold13(
                    context,
                  ).copyWith(color: Color(0xFF609966)),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 4,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 2.r,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: Image.asset(
                              'assets/imgs/hoda.jpeg', // حط الصورة المناسبة هنا
                              height: 40.w,
                              width: 40.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "jo ahmed",
                                  style: getStyleBold13(context),
                                ),
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "jo@gmail.com",
                                  style: getStyle10(
                                    context,
                                  ).copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                screens.subAccDetailsScreenScreen,
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(59.w, 22.h),
                              maximumSize: Size(62.w, 25.h),
                              side: BorderSide(color: Color(0xFF609966)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              LangKeys.view,
                              style: getStyleBold13(
                                context,
                              ).copyWith(color: Color(0xFF609966)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
