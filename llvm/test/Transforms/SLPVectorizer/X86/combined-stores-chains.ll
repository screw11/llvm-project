; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -slp-vectorizer -S -mtriple=x86_64-- -mcpu=corei7 | FileCheck %s

define void @foo(i8* %v0, i8* readonly %v1) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    [[T0:%.*]] = bitcast i8* [[V0:%.*]] to i32*
; CHECK-NEXT:    [[T1:%.*]] = bitcast i8* [[V1:%.*]] to i32*
; CHECK-NEXT:    [[T02:%.*]] = bitcast i8* [[V0]] to i64*
; CHECK-NEXT:    [[T12:%.*]] = bitcast i8* [[V1]] to i64*
; CHECK-NEXT:    [[T14:%.*]] = getelementptr inbounds i32, i32* [[T1]], i64 4
; CHECK-NEXT:    [[T18:%.*]] = getelementptr inbounds i32, i32* [[T1]], i64 5
; CHECK-NEXT:    [[T22:%.*]] = getelementptr inbounds i32, i32* [[T1]], i64 6
; CHECK-NEXT:    [[T26:%.*]] = getelementptr inbounds i32, i32* [[T1]], i64 7
; CHECK-NEXT:    [[T142:%.*]] = getelementptr inbounds i64, i64* [[T12]], i64 8
; CHECK-NEXT:    [[T182:%.*]] = getelementptr inbounds i64, i64* [[T12]], i64 9
; CHECK-NEXT:    [[T222:%.*]] = getelementptr inbounds i64, i64* [[T12]], i64 10
; CHECK-NEXT:    [[T262:%.*]] = getelementptr inbounds i64, i64* [[T12]], i64 11
; CHECK-NEXT:    [[T21:%.*]] = getelementptr inbounds i32, i32* [[T0]], i64 4
; CHECK-NEXT:    [[T25:%.*]] = getelementptr inbounds i32, i32* [[T0]], i64 5
; CHECK-NEXT:    [[T29:%.*]] = getelementptr inbounds i32, i32* [[T0]], i64 6
; CHECK-NEXT:    [[T32:%.*]] = getelementptr inbounds i32, i32* [[T0]], i64 7
; CHECK-NEXT:    [[T212:%.*]] = getelementptr inbounds i64, i64* [[T02]], i64 8
; CHECK-NEXT:    [[T252:%.*]] = getelementptr inbounds i64, i64* [[T02]], i64 9
; CHECK-NEXT:    [[T292:%.*]] = getelementptr inbounds i64, i64* [[T02]], i64 10
; CHECK-NEXT:    [[T322:%.*]] = getelementptr inbounds i64, i64* [[T02]], i64 11
; CHECK-NEXT:    [[TMP1:%.*]] = bitcast i64* [[T142]] to <2 x i64>*
; CHECK-NEXT:    [[TMP2:%.*]] = load <2 x i64>, <2 x i64>* [[TMP1]], align 8
; CHECK-NEXT:    [[TMP3:%.*]] = add nsw <2 x i64> [[TMP2]], <i64 4, i64 4>
; CHECK-NEXT:    [[TMP4:%.*]] = bitcast i64* [[T212]] to <2 x i64>*
; CHECK-NEXT:    [[TMP5:%.*]] = bitcast i64* [[T222]] to <2 x i64>*
; CHECK-NEXT:    [[TMP6:%.*]] = load <2 x i64>, <2 x i64>* [[TMP5]], align 8
; CHECK-NEXT:    [[TMP7:%.*]] = add nsw <2 x i64> [[TMP6]], <i64 6, i64 7>
; CHECK-NEXT:    [[TMP8:%.*]] = bitcast i64* [[T292]] to <2 x i64>*
; CHECK-NEXT:    [[TMP9:%.*]] = bitcast i32* [[T14]] to <4 x i32>*
; CHECK-NEXT:    [[TMP10:%.*]] = load <4 x i32>, <4 x i32>* [[TMP9]], align 4
; CHECK-NEXT:    [[TMP11:%.*]] = add nsw <4 x i32> [[TMP10]], <i32 4, i32 4, i32 6, i32 7>
; CHECK-NEXT:    store <2 x i64> [[TMP3]], <2 x i64>* [[TMP4]], align 8
; CHECK-NEXT:    store <2 x i64> [[TMP7]], <2 x i64>* [[TMP8]], align 8
; CHECK-NEXT:    [[TMP12:%.*]] = bitcast i32* [[T21]] to <4 x i32>*
; CHECK-NEXT:    store <4 x i32> [[TMP11]], <4 x i32>* [[TMP12]], align 4
; CHECK-NEXT:    ret void
;
  %t0 = bitcast i8* %v0 to i32*
  %t1 = bitcast i8* %v1 to i32*

  %t02 = bitcast i8* %v0 to i64*
  %t12 = bitcast i8* %v1 to i64*

  %t14 = getelementptr inbounds i32, i32* %t1, i64 4
  %t18 = getelementptr inbounds i32, i32* %t1, i64 5
  %t22 = getelementptr inbounds i32, i32* %t1, i64 6
  %t26 = getelementptr inbounds i32, i32* %t1, i64 7

  %t142 = getelementptr inbounds i64, i64* %t12, i64 8
  %t182 = getelementptr inbounds i64, i64* %t12, i64 9
  %t222 = getelementptr inbounds i64, i64* %t12, i64 10
  %t262 = getelementptr inbounds i64, i64* %t12, i64 11

  %t21 = getelementptr inbounds i32, i32* %t0, i64 4
  %t25 = getelementptr inbounds i32, i32* %t0, i64 5
  %t29 = getelementptr inbounds i32, i32* %t0, i64 6
  %t32 = getelementptr inbounds i32, i32* %t0, i64 7

  %t212 = getelementptr inbounds i64, i64* %t02, i64 8
  %t252 = getelementptr inbounds i64, i64* %t02, i64 9
  %t292 = getelementptr inbounds i64, i64* %t02, i64 10
  %t322 = getelementptr inbounds i64, i64* %t02, i64 11

  %t19 = load i32, i32* %t14, align 4
  %t23 = load i32, i32* %t18, align 4
  %t27 = load i32, i32* %t22, align 4
  %t30 = load i32, i32* %t26, align 4

  %t192 = load i64, i64* %t142, align 8
  %t232 = load i64, i64* %t182, align 8
  %t272 = load i64, i64* %t222, align 8
  %t302 = load i64, i64* %t262, align 8

  %t20 = add nsw i32 %t19, 4
  %t24 = add nsw i32 %t23, 4
  %t28 = add nsw i32 %t27, 6
  %t31 = add nsw i32 %t30, 7

  %t202 = add nsw i64 %t192, 4
  %t242 = add nsw i64 %t232, 4
  %t282 = add nsw i64 %t272, 6
  %t312 = add nsw i64 %t302, 7

  store i64 %t202, i64* %t212, align 8
  store i64 %t242, i64* %t252, align 8
  store i64 %t282, i64* %t292, align 8
  store i64 %t312, i64* %t322, align 8

  store i32 %t20, i32* %t21, align 4
  store i32 %t24, i32* %t25, align 4
  store i32 %t28, i32* %t29, align 4
  store i32 %t31, i32* %t32, align 4

  ret void
}
