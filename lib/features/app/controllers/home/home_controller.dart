import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();




  Rx<int> currentPageIndex=0.obs;
  final pageController= PageController(); // onboarding pages Page controller
  final headerSliderCurrentIndex = 0.obs;
  final reservationSliderCurrentIndex = 0.obs;
  final approvalSliderCurrentIndex = 0.obs;

  final carousalCurrentIndex=0.obs;
  final expandedListCarousalCurrentIndex=0.obs;
  final showMonthCalender=false.obs;
  final isGra1=true.obs;
  final isGra2=false.obs;
  final isGra3=false.obs;
  final Rx<String> selectedMonth="April 2024".obs;

  int propCurrentIndex=0;
  final openPopup=false.obs;
  final isFavorite=false.obs;
  final fill=false.obs;


  void updatePopupPageIndicator(index){
    carousalCurrentIndex.value=index;
  }

  void updateExpandPageIndicator(index){
    expandedListCarousalCurrentIndex.value=index;
  }

  void find(int index,int length){
    for(int i=0;i<length;i++){
      if(i==index){
        propCurrentIndex=i;
      }
    }
  }
  void updateHeaderSliderIndicator(index) {
    headerSliderCurrentIndex.value = index;
  }
  void updateReservationSliderIndicator(index) {
    reservationSliderCurrentIndex.value = index;
  }

  void updateApprovalSliderIndicator(index) {
    approvalSliderCurrentIndex.value = index;
  }
  /// Update Current Index when Page Scroll
  void updatePageIndicator(index)=> currentPageIndex.value=index;

  /// Jump to the specific dot selected page
  void tabBarButtonClicked(index){
    currentPageIndex.value=index;
    if(index==0){
      isGra1.value=true;
      isGra2.value=false;
      isGra3.value=false;
    } else  if(index==1){
      isGra1.value=false;
      isGra2.value=true;
      isGra3.value=false;
    }else  if(index==2){
      isGra1.value=false;
      isGra2.value=false;
      isGra3.value=true;
    }
    pageController.jumpToPage(index);
  }
}