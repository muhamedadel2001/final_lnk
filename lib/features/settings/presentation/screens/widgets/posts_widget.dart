import 'package:final_lnk/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostsTab extends StatelessWidget {
  const PostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Text("4 property", style: TextStyle(fontSize: 14.sp)),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(top: 20.h),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => PropertyCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4.r)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: Image.asset(
              'assets/my_logo.png',
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "Classic Apartment For sale",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: primaryClr,
                        size: 12.sp,
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        flex: 2,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "sidi bishr",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                      SvgPicture.asset('assets/imgs/distance.svg', width: 12.w),
                      SizedBox(width: 2.w),
                      Expanded(
                        flex: 1,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "400m",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/imgs/price.svg', width: 12.w),
                      SizedBox(width: 2.w),
                      Flexible(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "2.000.000 EG",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Flexible(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/imgs/office.svg', width: 12.w),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            "Apartment",
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: primaryClr,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            "View details",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
