///
//  Generated code. Do not modify.
//  source: danmaku.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PostPanelBizType extends $pb.ProtobufEnum {
  static const PostPanelBizType PostPanelBizTypeNone = PostPanelBizType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PostPanelBizTypeNone');
  static const PostPanelBizType PostPanelBizTypeEncourage = PostPanelBizType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PostPanelBizTypeEncourage');

  static const $core.List<PostPanelBizType> values = <PostPanelBizType> [
    PostPanelBizTypeNone,
    PostPanelBizTypeEncourage,
  ];

  static final $core.Map<$core.int, PostPanelBizType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PostPanelBizType? valueOf($core.int value) => _byValue[value];

  const PostPanelBizType._($core.int v, $core.String n) : super(v, n);
}

class RenderType extends $pb.ProtobufEnum {
  static const RenderType RenderTypeNone = RenderType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RenderTypeNone');
  static const RenderType RenderTypeSingle = RenderType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RenderTypeSingle');
  static const RenderType RenderTypeRotation = RenderType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RenderTypeRotation');

  static const $core.List<RenderType> values = <RenderType> [
    RenderTypeNone,
    RenderTypeSingle,
    RenderTypeRotation,
  ];

  static final $core.Map<$core.int, RenderType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RenderType? valueOf($core.int value) => _byValue[value];

  const RenderType._($core.int v, $core.String n) : super(v, n);
}

class CheckboxType extends $pb.ProtobufEnum {
  static const CheckboxType CheckboxTypeNone = CheckboxType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CheckboxTypeNone');
  static const CheckboxType CheckboxTypeEncourage = CheckboxType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CheckboxTypeEncourage');

  static const $core.List<CheckboxType> values = <CheckboxType> [
    CheckboxTypeNone,
    CheckboxTypeEncourage,
  ];

  static final $core.Map<$core.int, CheckboxType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CheckboxType? valueOf($core.int value) => _byValue[value];

  const CheckboxType._($core.int v, $core.String n) : super(v, n);
}

class ToastFunctionType extends $pb.ProtobufEnum {
  static const ToastFunctionType ToastFunctionTypeNone = ToastFunctionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ToastFunctionTypeNone');
  static const ToastFunctionType ToastFunctionTypePostPanel = ToastFunctionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ToastFunctionTypePostPanel');

  static const $core.List<ToastFunctionType> values = <ToastFunctionType> [
    ToastFunctionTypeNone,
    ToastFunctionTypePostPanel,
  ];

  static final $core.Map<$core.int, ToastFunctionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ToastFunctionType? valueOf($core.int value) => _byValue[value];

  const ToastFunctionType._($core.int v, $core.String n) : super(v, n);
}

class ToastBizType extends $pb.ProtobufEnum {
  static const ToastBizType ToastBizTypeNone = ToastBizType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ToastBizTypeNone');
  static const ToastBizType ToastBizTypeEncourage = ToastBizType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ToastBizTypeEncourage');

  static const $core.List<ToastBizType> values = <ToastBizType> [
    ToastBizTypeNone,
    ToastBizTypeEncourage,
  ];

  static final $core.Map<$core.int, ToastBizType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ToastBizType? valueOf($core.int value) => _byValue[value];

  const ToastBizType._($core.int v, $core.String n) : super(v, n);
}

