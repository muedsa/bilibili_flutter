///
//  Generated code. Do not modify.
//  source: danmaku.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use postPanelBizTypeDescriptor instead')
const PostPanelBizType$json = const {
  '1': 'PostPanelBizType',
  '2': const [
    const {'1': 'PostPanelBizTypeNone', '2': 0},
    const {'1': 'PostPanelBizTypeEncourage', '2': 1},
  ],
};

/// Descriptor for `PostPanelBizType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List postPanelBizTypeDescriptor = $convert.base64Decode('ChBQb3N0UGFuZWxCaXpUeXBlEhgKFFBvc3RQYW5lbEJpelR5cGVOb25lEAASHQoZUG9zdFBhbmVsQml6VHlwZUVuY291cmFnZRAB');
@$core.Deprecated('Use renderTypeDescriptor instead')
const RenderType$json = const {
  '1': 'RenderType',
  '2': const [
    const {'1': 'RenderTypeNone', '2': 0},
    const {'1': 'RenderTypeSingle', '2': 1},
    const {'1': 'RenderTypeRotation', '2': 2},
  ],
};

/// Descriptor for `RenderType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List renderTypeDescriptor = $convert.base64Decode('CgpSZW5kZXJUeXBlEhIKDlJlbmRlclR5cGVOb25lEAASFAoQUmVuZGVyVHlwZVNpbmdsZRABEhYKElJlbmRlclR5cGVSb3RhdGlvbhAC');
@$core.Deprecated('Use checkboxTypeDescriptor instead')
const CheckboxType$json = const {
  '1': 'CheckboxType',
  '2': const [
    const {'1': 'CheckboxTypeNone', '2': 0},
    const {'1': 'CheckboxTypeEncourage', '2': 1},
  ],
};

/// Descriptor for `CheckboxType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List checkboxTypeDescriptor = $convert.base64Decode('CgxDaGVja2JveFR5cGUSFAoQQ2hlY2tib3hUeXBlTm9uZRAAEhkKFUNoZWNrYm94VHlwZUVuY291cmFnZRAB');
@$core.Deprecated('Use toastFunctionTypeDescriptor instead')
const ToastFunctionType$json = const {
  '1': 'ToastFunctionType',
  '2': const [
    const {'1': 'ToastFunctionTypeNone', '2': 0},
    const {'1': 'ToastFunctionTypePostPanel', '2': 1},
  ],
};

/// Descriptor for `ToastFunctionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List toastFunctionTypeDescriptor = $convert.base64Decode('ChFUb2FzdEZ1bmN0aW9uVHlwZRIZChVUb2FzdEZ1bmN0aW9uVHlwZU5vbmUQABIeChpUb2FzdEZ1bmN0aW9uVHlwZVBvc3RQYW5lbBAB');
@$core.Deprecated('Use toastBizTypeDescriptor instead')
const ToastBizType$json = const {
  '1': 'ToastBizType',
  '2': const [
    const {'1': 'ToastBizTypeNone', '2': 0},
    const {'1': 'ToastBizTypeEncourage', '2': 1},
  ],
};

/// Descriptor for `ToastBizType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List toastBizTypeDescriptor = $convert.base64Decode('CgxUb2FzdEJpelR5cGUSFAoQVG9hc3RCaXpUeXBlTm9uZRAAEhkKFVRvYXN0Qml6VHlwZUVuY291cmFnZRAB');
@$core.Deprecated('Use dmWebViewReplyDescriptor instead')
const DmWebViewReply$json = const {
  '1': 'DmWebViewReply',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'state', '17': true},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'text', '17': true},
    const {'1': 'textSide', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'textSide', '17': true},
    const {'1': 'dmSge', '3': 4, '4': 1, '5': 11, '6': '.com.muedsa.bilibili.model.DmSegConfig', '9': 3, '10': 'dmSge', '17': true},
    const {'1': 'flag', '3': 5, '4': 1, '5': 11, '6': '.com.muedsa.bilibili.model.DanmakuFlagConfig', '9': 4, '10': 'flag', '17': true},
    const {'1': 'specialDms', '3': 6, '4': 3, '5': 9, '10': 'specialDms'},
    const {'1': 'checkBox', '3': 7, '4': 1, '5': 8, '9': 5, '10': 'checkBox', '17': true},
    const {'1': 'count', '3': 8, '4': 1, '5': 3, '9': 6, '10': 'count', '17': true},
    const {'1': 'commandDms', '3': 9, '4': 3, '5': 11, '6': '.com.muedsa.bilibili.model.CommandDm', '10': 'commandDms'},
    const {'1': 'dmSetting', '3': 10, '4': 1, '5': 11, '6': '.com.muedsa.bilibili.model.DanmuWebPlayerConfig', '9': 7, '10': 'dmSetting', '17': true},
    const {'1': 'reportFilter', '3': 11, '4': 1, '5': 9, '9': 8, '10': 'reportFilter', '17': true},
    const {'1': 'expressions', '3': 12, '4': 3, '5': 11, '6': '.com.muedsa.bilibili.model.Expressions', '10': 'expressions'},
    const {'1': 'postPanel', '3': 13, '4': 3, '5': 11, '6': '.com.muedsa.bilibili.model.PostPanel', '10': 'postPanel'},
  ],
  '8': const [
    const {'1': '_state'},
    const {'1': '_text'},
    const {'1': '_textSide'},
    const {'1': '_dmSge'},
    const {'1': '_flag'},
    const {'1': '_checkBox'},
    const {'1': '_count'},
    const {'1': '_dmSetting'},
    const {'1': '_reportFilter'},
  ],
};

/// Descriptor for `DmWebViewReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmWebViewReplyDescriptor = $convert.base64Decode('Cg5EbVdlYlZpZXdSZXBseRIZCgVzdGF0ZRgBIAEoBUgAUgVzdGF0ZYgBARIXCgR0ZXh0GAIgASgJSAFSBHRleHSIAQESHwoIdGV4dFNpZGUYAyABKAlIAlIIdGV4dFNpZGWIAQESQQoFZG1TZ2UYBCABKAsyJi5jb20ubXVlZHNhLmJpbGliaWxpLm1vZGVsLkRtU2VnQ29uZmlnSANSBWRtU2dliAEBEkUKBGZsYWcYBSABKAsyLC5jb20ubXVlZHNhLmJpbGliaWxpLm1vZGVsLkRhbm1ha3VGbGFnQ29uZmlnSARSBGZsYWeIAQESHgoKc3BlY2lhbERtcxgGIAMoCVIKc3BlY2lhbERtcxIfCghjaGVja0JveBgHIAEoCEgFUghjaGVja0JveIgBARIZCgVjb3VudBgIIAEoA0gGUgVjb3VudIgBARJECgpjb21tYW5kRG1zGAkgAygLMiQuY29tLm11ZWRzYS5iaWxpYmlsaS5tb2RlbC5Db21tYW5kRG1SCmNvbW1hbmREbXMSUgoJZG1TZXR0aW5nGAogASgLMi8uY29tLm11ZWRzYS5iaWxpYmlsaS5tb2RlbC5EYW5tdVdlYlBsYXllckNvbmZpZ0gHUglkbVNldHRpbmeIAQESJwoMcmVwb3J0RmlsdGVyGAsgASgJSAhSDHJlcG9ydEZpbHRlcogBARJICgtleHByZXNzaW9ucxgMIAMoCzImLmNvbS5tdWVkc2EuYmlsaWJpbGkubW9kZWwuRXhwcmVzc2lvbnNSC2V4cHJlc3Npb25zEkIKCXBvc3RQYW5lbBgNIAMoCzIkLmNvbS5tdWVkc2EuYmlsaWJpbGkubW9kZWwuUG9zdFBhbmVsUglwb3N0UGFuZWxCCAoGX3N0YXRlQgcKBV90ZXh0QgsKCV90ZXh0U2lkZUIICgZfZG1TZ2VCBwoFX2ZsYWdCCwoJX2NoZWNrQm94QggKBl9jb3VudEIMCgpfZG1TZXR0aW5nQg8KDV9yZXBvcnRGaWx0ZXI=');
@$core.Deprecated('Use postPanelDescriptor instead')
const PostPanel$json = const {
  '1': 'PostPanel',
  '2': const [
    const {'1': 'start', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'start', '17': true},
    const {'1': 'end', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'end', '17': true},
    const {'1': 'priority', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'priority', '17': true},
    const {'1': 'bizId', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'bizId', '17': true},
    const {'1': 'bizType', '3': 5, '4': 1, '5': 14, '6': '.com.muedsa.bilibili.model.PostPanelBizType', '9': 4, '10': 'bizType', '17': true},
    const {'1': 'clickButton', '3': 6, '4': 1, '5': 11, '6': '.com.muedsa.bilibili.model.ClickButton', '9': 5, '10': 'clickButton', '17': true},
    const {'1': 'textInput', '3': 7, '4': 1, '5': 11, '6': '.com.muedsa.bilibili.model.TextInput', '9': 6, '10': 'textInput', '17': true},
    const {'1': 'checkBox', '3': 8, '4': 1, '5': 11, '6': '.com.muedsa.bilibili.model.CheckBox', '9': 7, '10': 'checkBox', '17': true},
    const {'1': 'toast', '3': 9, '4': 1, '5': 11, '6': '.com.muedsa.bilibili.model.Toast', '9': 8, '10': 'toast', '17': true},
  ],
  '8': const [
    const {'1': '_start'},
    const {'1': '_end'},
    const {'1': '_priority'},
    const {'1': '_bizId'},
    const {'1': '_bizType'},
    const {'1': '_clickButton'},
    const {'1': '_textInput'},
    const {'1': '_checkBox'},
    const {'1': '_toast'},
  ],
};

/// Descriptor for `PostPanel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postPanelDescriptor = $convert.base64Decode('CglQb3N0UGFuZWwSGQoFc3RhcnQYASABKANIAFIFc3RhcnSIAQESFQoDZW5kGAIgASgDSAFSA2VuZIgBARIfCghwcmlvcml0eRgDIAEoA0gCUghwcmlvcml0eYgBARIZCgViaXpJZBgEIAEoA0gDUgViaXpJZIgBARJKCgdiaXpUeXBlGAUgASgOMisuY29tLm11ZWRzYS5iaWxpYmlsaS5tb2RlbC5Qb3N0UGFuZWxCaXpUeXBlSARSB2JpelR5cGWIAQESTQoLY2xpY2tCdXR0b24YBiABKAsyJi5jb20ubXVlZHNhLmJpbGliaWxpLm1vZGVsLkNsaWNrQnV0dG9uSAVSC2NsaWNrQnV0dG9uiAEBEkcKCXRleHRJbnB1dBgHIAEoCzIkLmNvbS5tdWVkc2EuYmlsaWJpbGkubW9kZWwuVGV4dElucHV0SAZSCXRleHRJbnB1dIgBARJECghjaGVja0JveBgIIAEoCzIjLmNvbS5tdWVkc2EuYmlsaWJpbGkubW9kZWwuQ2hlY2tCb3hIB1IIY2hlY2tCb3iIAQESOwoFdG9hc3QYCSABKAsyIC5jb20ubXVlZHNhLmJpbGliaWxpLm1vZGVsLlRvYXN0SAhSBXRvYXN0iAEBQggKBl9zdGFydEIGCgRfZW5kQgsKCV9wcmlvcml0eUIICgZfYml6SWRCCgoIX2JpelR5cGVCDgoMX2NsaWNrQnV0dG9uQgwKCl90ZXh0SW5wdXRCCwoJX2NoZWNrQm94QggKBl90b2FzdA==');
@$core.Deprecated('Use clickButtonDescriptor instead')
const ClickButton$json = const {
  '1': 'ClickButton',
  '2': const [
    const {'1': 'portraitText', '3': 1, '4': 3, '5': 9, '10': 'portraitText'},
    const {'1': 'landscapeText', '3': 2, '4': 3, '5': 9, '10': 'landscapeText'},
    const {'1': 'portraitTextFocus', '3': 3, '4': 3, '5': 9, '10': 'portraitTextFocus'},
    const {'1': 'landscapeTextFocus', '3': 4, '4': 3, '5': 9, '10': 'landscapeTextFocus'},
    const {'1': 'renderType', '3': 5, '4': 1, '5': 14, '6': '.com.muedsa.bilibili.model.RenderType', '9': 0, '10': 'renderType', '17': true},
    const {'1': 'show', '3': 6, '4': 1, '5': 8, '9': 1, '10': 'show', '17': true},
  ],
  '8': const [
    const {'1': '_renderType'},
    const {'1': '_show'},
  ],
};

/// Descriptor for `ClickButton`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clickButtonDescriptor = $convert.base64Decode('CgtDbGlja0J1dHRvbhIiCgxwb3J0cmFpdFRleHQYASADKAlSDHBvcnRyYWl0VGV4dBIkCg1sYW5kc2NhcGVUZXh0GAIgAygJUg1sYW5kc2NhcGVUZXh0EiwKEXBvcnRyYWl0VGV4dEZvY3VzGAMgAygJUhFwb3J0cmFpdFRleHRGb2N1cxIuChJsYW5kc2NhcGVUZXh0Rm9jdXMYBCADKAlSEmxhbmRzY2FwZVRleHRGb2N1cxJKCgpyZW5kZXJUeXBlGAUgASgOMiUuY29tLm11ZWRzYS5iaWxpYmlsaS5tb2RlbC5SZW5kZXJUeXBlSABSCnJlbmRlclR5cGWIAQESFwoEc2hvdxgGIAEoCEgBUgRzaG93iAEBQg0KC19yZW5kZXJUeXBlQgcKBV9zaG93');
@$core.Deprecated('Use textInputDescriptor instead')
const TextInput$json = const {
  '1': 'TextInput',
  '2': const [
    const {'1': 'portraitPlaceholder', '3': 1, '4': 3, '5': 9, '10': 'portraitPlaceholder'},
    const {'1': 'landscapePlaceholder', '3': 2, '4': 3, '5': 9, '10': 'landscapePlaceholder'},
    const {'1': 'renderType', '3': 3, '4': 1, '5': 14, '6': '.com.muedsa.bilibili.model.RenderType', '9': 0, '10': 'renderType', '17': true},
    const {'1': 'placeholderPost', '3': 4, '4': 1, '5': 8, '9': 1, '10': 'placeholderPost', '17': true},
    const {'1': 'show', '3': 5, '4': 1, '5': 8, '9': 2, '10': 'show', '17': true},
  ],
  '8': const [
    const {'1': '_renderType'},
    const {'1': '_placeholderPost'},
    const {'1': '_show'},
  ],
};

/// Descriptor for `TextInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textInputDescriptor = $convert.base64Decode('CglUZXh0SW5wdXQSMAoTcG9ydHJhaXRQbGFjZWhvbGRlchgBIAMoCVITcG9ydHJhaXRQbGFjZWhvbGRlchIyChRsYW5kc2NhcGVQbGFjZWhvbGRlchgCIAMoCVIUbGFuZHNjYXBlUGxhY2Vob2xkZXISSgoKcmVuZGVyVHlwZRgDIAEoDjIlLmNvbS5tdWVkc2EuYmlsaWJpbGkubW9kZWwuUmVuZGVyVHlwZUgAUgpyZW5kZXJUeXBliAEBEi0KD3BsYWNlaG9sZGVyUG9zdBgEIAEoCEgBUg9wbGFjZWhvbGRlclBvc3SIAQESFwoEc2hvdxgFIAEoCEgCUgRzaG93iAEBQg0KC19yZW5kZXJUeXBlQhIKEF9wbGFjZWhvbGRlclBvc3RCBwoFX3Nob3c=');
@$core.Deprecated('Use checkBoxDescriptor instead')
const CheckBox$json = const {
  '1': 'CheckBox',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.com.muedsa.bilibili.model.CheckboxType', '9': 1, '10': 'type', '17': true},
    const {'1': 'defaultValue', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'defaultValue', '17': true},
    const {'1': 'show', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'show', '17': true},
  ],
  '8': const [
    const {'1': '_text'},
    const {'1': '_type'},
    const {'1': '_defaultValue'},
    const {'1': '_show'},
  ],
};

/// Descriptor for `CheckBox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkBoxDescriptor = $convert.base64Decode('CghDaGVja0JveBIXCgR0ZXh0GAEgASgJSABSBHRleHSIAQESQAoEdHlwZRgCIAEoDjInLmNvbS5tdWVkc2EuYmlsaWJpbGkubW9kZWwuQ2hlY2tib3hUeXBlSAFSBHR5cGWIAQESJwoMZGVmYXVsdFZhbHVlGAMgASgISAJSDGRlZmF1bHRWYWx1ZYgBARIXCgRzaG93GAQgASgISANSBHNob3eIAQFCBwoFX3RleHRCBwoFX3R5cGVCDwoNX2RlZmF1bHRWYWx1ZUIHCgVfc2hvdw==');
@$core.Deprecated('Use toastDescriptor instead')
const Toast$json = const {
  '1': 'Toast',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
    const {'1': 'duration', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'duration', '17': true},
    const {'1': 'show', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'show', '17': true},
    const {'1': 'button', '3': 4, '4': 1, '5': 11, '6': '.com.muedsa.bilibili.model.Button', '9': 3, '10': 'button', '17': true},
  ],
  '8': const [
    const {'1': '_text'},
    const {'1': '_duration'},
    const {'1': '_show'},
    const {'1': '_button'},
  ],
};

/// Descriptor for `Toast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toastDescriptor = $convert.base64Decode('CgVUb2FzdBIXCgR0ZXh0GAEgASgJSABSBHRleHSIAQESHwoIZHVyYXRpb24YAiABKAVIAVIIZHVyYXRpb26IAQESFwoEc2hvdxgDIAEoCEgCUgRzaG93iAEBEj4KBmJ1dHRvbhgEIAEoCzIhLmNvbS5tdWVkc2EuYmlsaWJpbGkubW9kZWwuQnV0dG9uSANSBmJ1dHRvbogBAUIHCgVfdGV4dEILCglfZHVyYXRpb25CBwoFX3Nob3dCCQoHX2J1dHRvbg==');
@$core.Deprecated('Use buttonDescriptor instead')
const Button$json = const {
  '1': 'Button',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
    const {'1': 'action', '3': 2, '4': 1, '5': 14, '6': '.com.muedsa.bilibili.model.ToastFunctionType', '9': 1, '10': 'action', '17': true},
  ],
  '8': const [
    const {'1': '_text'},
    const {'1': '_action'},
  ],
};

/// Descriptor for `Button`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buttonDescriptor = $convert.base64Decode('CgZCdXR0b24SFwoEdGV4dBgBIAEoCUgAUgR0ZXh0iAEBEkkKBmFjdGlvbhgCIAEoDjIsLmNvbS5tdWVkc2EuYmlsaWJpbGkubW9kZWwuVG9hc3RGdW5jdGlvblR5cGVIAVIGYWN0aW9uiAEBQgcKBV90ZXh0QgkKB19hY3Rpb24=');
@$core.Deprecated('Use commandDmDescriptor instead')
const CommandDm$json = const {
  '1': 'CommandDm',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'id', '17': true},
    const {'1': 'oid', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'oid', '17': true},
    const {'1': 'mid', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'mid', '17': true},
    const {'1': 'command', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'command', '17': true},
    const {'1': 'content', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'content', '17': true},
    const {'1': 'progress', '3': 6, '4': 1, '5': 5, '9': 5, '10': 'progress', '17': true},
    const {'1': 'ctime', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'ctime', '17': true},
    const {'1': 'mtime', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'mtime', '17': true},
    const {'1': 'extra', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'extra', '17': true},
    const {'1': 'idStr', '3': 10, '4': 1, '5': 9, '9': 9, '10': 'idStr', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
    const {'1': '_oid'},
    const {'1': '_mid'},
    const {'1': '_command'},
    const {'1': '_content'},
    const {'1': '_progress'},
    const {'1': '_ctime'},
    const {'1': '_mtime'},
    const {'1': '_extra'},
    const {'1': '_idStr'},
  ],
};

/// Descriptor for `CommandDm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commandDmDescriptor = $convert.base64Decode('CglDb21tYW5kRG0SEwoCaWQYASABKANIAFICaWSIAQESFQoDb2lkGAIgASgDSAFSA29pZIgBARIVCgNtaWQYAyABKANIAlIDbWlkiAEBEh0KB2NvbW1hbmQYBCABKANIA1IHY29tbWFuZIgBARIdCgdjb250ZW50GAUgASgJSARSB2NvbnRlbnSIAQESHwoIcHJvZ3Jlc3MYBiABKAVIBVIIcHJvZ3Jlc3OIAQESGQoFY3RpbWUYByABKAlIBlIFY3RpbWWIAQESGQoFbXRpbWUYCCABKAlIB1IFbXRpbWWIAQESGQoFZXh0cmEYCSABKAlICFIFZXh0cmGIAQESGQoFaWRTdHIYCiABKAlICVIFaWRTdHKIAQFCBQoDX2lkQgYKBF9vaWRCBgoEX21pZEIKCghfY29tbWFuZEIKCghfY29udGVudEILCglfcHJvZ3Jlc3NCCAoGX2N0aW1lQggKBl9tdGltZUIICgZfZXh0cmFCCAoGX2lkU3Ry');
@$core.Deprecated('Use dmSegConfigDescriptor instead')
const DmSegConfig$json = const {
  '1': 'DmSegConfig',
  '2': const [
    const {'1': 'pageSize', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'pageSize', '17': true},
    const {'1': 'total', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'total', '17': true},
  ],
  '8': const [
    const {'1': '_pageSize'},
    const {'1': '_total'},
  ],
};

/// Descriptor for `DmSegConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmSegConfigDescriptor = $convert.base64Decode('CgtEbVNlZ0NvbmZpZxIfCghwYWdlU2l6ZRgBIAEoA0gAUghwYWdlU2l6ZYgBARIZCgV0b3RhbBgCIAEoA0gBUgV0b3RhbIgBAUILCglfcGFnZVNpemVCCAoGX3RvdGFs');
@$core.Deprecated('Use danmakuFlagConfigDescriptor instead')
const DanmakuFlagConfig$json = const {
  '1': 'DanmakuFlagConfig',
  '2': const [
    const {'1': 'recFlag', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'recFlag', '17': true},
    const {'1': 'recText', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'recText', '17': true},
    const {'1': 'recSwitch', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'recSwitch', '17': true},
  ],
  '8': const [
    const {'1': '_recFlag'},
    const {'1': '_recText'},
    const {'1': '_recSwitch'},
  ],
};

/// Descriptor for `DanmakuFlagConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmakuFlagConfigDescriptor = $convert.base64Decode('ChFEYW5tYWt1RmxhZ0NvbmZpZxIdCgdyZWNGbGFnGAEgASgFSABSB3JlY0ZsYWeIAQESHQoHcmVjVGV4dBgCIAEoCUgBUgdyZWNUZXh0iAEBEiEKCXJlY1N3aXRjaBgDIAEoBUgCUglyZWNTd2l0Y2iIAQFCCgoIX3JlY0ZsYWdCCgoIX3JlY1RleHRCDAoKX3JlY1N3aXRjaA==');
@$core.Deprecated('Use dmSegMobileReplyDescriptor instead')
const DmSegMobileReply$json = const {
  '1': 'DmSegMobileReply',
  '2': const [
    const {'1': 'elems', '3': 1, '4': 3, '5': 11, '6': '.com.muedsa.bilibili.model.DanmakuElem', '10': 'elems'},
  ],
};

/// Descriptor for `DmSegMobileReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmSegMobileReplyDescriptor = $convert.base64Decode('ChBEbVNlZ01vYmlsZVJlcGx5EjwKBWVsZW1zGAEgAygLMiYuY29tLm11ZWRzYS5iaWxpYmlsaS5tb2RlbC5EYW5tYWt1RWxlbVIFZWxlbXM=');
@$core.Deprecated('Use danmakuElemDescriptor instead')
const DanmakuElem$json = const {
  '1': 'DanmakuElem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'id', '17': true},
    const {'1': 'progress', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'progress', '17': true},
    const {'1': 'mode', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'mode', '17': true},
    const {'1': 'fontSize', '3': 4, '4': 1, '5': 5, '9': 3, '10': 'fontSize', '17': true},
    const {'1': 'color', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'color', '17': true},
    const {'1': 'midHash', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'midHash', '17': true},
    const {'1': 'content', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'content', '17': true},
    const {'1': 'ctime', '3': 8, '4': 1, '5': 3, '9': 7, '10': 'ctime', '17': true},
    const {'1': 'weight', '3': 9, '4': 1, '5': 5, '9': 8, '10': 'weight', '17': true},
    const {'1': 'action', '3': 10, '4': 1, '5': 9, '9': 9, '10': 'action', '17': true},
    const {'1': 'pool', '3': 11, '4': 1, '5': 5, '9': 10, '10': 'pool', '17': true},
    const {'1': 'idStr', '3': 12, '4': 1, '5': 9, '9': 11, '10': 'idStr', '17': true},
    const {'1': 'attr', '3': 13, '4': 1, '5': 5, '9': 12, '10': 'attr', '17': true},
    const {'1': 'animation', '3': 22, '4': 1, '5': 9, '9': 13, '10': 'animation', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
    const {'1': '_progress'},
    const {'1': '_mode'},
    const {'1': '_fontSize'},
    const {'1': '_color'},
    const {'1': '_midHash'},
    const {'1': '_content'},
    const {'1': '_ctime'},
    const {'1': '_weight'},
    const {'1': '_action'},
    const {'1': '_pool'},
    const {'1': '_idStr'},
    const {'1': '_attr'},
    const {'1': '_animation'},
  ],
};

/// Descriptor for `DanmakuElem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmakuElemDescriptor = $convert.base64Decode('CgtEYW5tYWt1RWxlbRITCgJpZBgBIAEoA0gAUgJpZIgBARIfCghwcm9ncmVzcxgCIAEoBUgBUghwcm9ncmVzc4gBARIXCgRtb2RlGAMgASgFSAJSBG1vZGWIAQESHwoIZm9udFNpemUYBCABKAVIA1IIZm9udFNpemWIAQESGQoFY29sb3IYBSABKA1IBFIFY29sb3KIAQESHQoHbWlkSGFzaBgGIAEoCUgFUgdtaWRIYXNoiAEBEh0KB2NvbnRlbnQYByABKAlIBlIHY29udGVudIgBARIZCgVjdGltZRgIIAEoA0gHUgVjdGltZYgBARIbCgZ3ZWlnaHQYCSABKAVICFIGd2VpZ2h0iAEBEhsKBmFjdGlvbhgKIAEoCUgJUgZhY3Rpb26IAQESFwoEcG9vbBgLIAEoBUgKUgRwb29siAEBEhkKBWlkU3RyGAwgASgJSAtSBWlkU3RyiAEBEhcKBGF0dHIYDSABKAVIDFIEYXR0cogBARIhCglhbmltYXRpb24YFiABKAlIDVIJYW5pbWF0aW9uiAEBQgUKA19pZEILCglfcHJvZ3Jlc3NCBwoFX21vZGVCCwoJX2ZvbnRTaXplQggKBl9jb2xvckIKCghfbWlkSGFzaEIKCghfY29udGVudEIICgZfY3RpbWVCCQoHX3dlaWdodEIJCgdfYWN0aW9uQgcKBV9wb29sQggKBl9pZFN0ckIHCgVfYXR0ckIMCgpfYW5pbWF0aW9u');
@$core.Deprecated('Use danmuWebPlayerConfigDescriptor instead')
const DanmuWebPlayerConfig$json = const {
  '1': 'DanmuWebPlayerConfig',
  '2': const [
    const {'1': 'dmSwitch', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'dmSwitch', '17': true},
    const {'1': 'aiSwitch', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'aiSwitch', '17': true},
    const {'1': 'aiLevel', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'aiLevel', '17': true},
    const {'1': 'typeTop', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'typeTop', '17': true},
    const {'1': 'typeScroll', '3': 5, '4': 1, '5': 8, '9': 4, '10': 'typeScroll', '17': true},
    const {'1': 'typeBottom', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'typeBottom', '17': true},
    const {'1': 'typeColor', '3': 7, '4': 1, '5': 8, '9': 6, '10': 'typeColor', '17': true},
    const {'1': 'typeSpecial', '3': 8, '4': 1, '5': 8, '9': 7, '10': 'typeSpecial', '17': true},
    const {'1': 'preventShade', '3': 9, '4': 1, '5': 8, '9': 8, '10': 'preventShade', '17': true},
    const {'1': 'dmask', '3': 10, '4': 1, '5': 8, '9': 9, '10': 'dmask', '17': true},
    const {'1': 'opacity', '3': 11, '4': 1, '5': 2, '9': 10, '10': 'opacity', '17': true},
    const {'1': 'dmArea', '3': 12, '4': 1, '5': 5, '9': 11, '10': 'dmArea', '17': true},
    const {'1': 'speedPlus', '3': 13, '4': 1, '5': 2, '9': 12, '10': 'speedPlus', '17': true},
    const {'1': 'fontSize', '3': 14, '4': 1, '5': 2, '9': 13, '10': 'fontSize', '17': true},
    const {'1': 'fullScreenSync', '3': 15, '4': 1, '5': 8, '9': 14, '10': 'fullScreenSync', '17': true},
    const {'1': 'speedSync', '3': 16, '4': 1, '5': 8, '9': 15, '10': 'speedSync', '17': true},
    const {'1': 'fontFamily', '3': 17, '4': 1, '5': 9, '9': 16, '10': 'fontFamily', '17': true},
    const {'1': 'bold', '3': 18, '4': 1, '5': 8, '9': 17, '10': 'bold', '17': true},
    const {'1': 'fontBorder', '3': 19, '4': 1, '5': 5, '9': 18, '10': 'fontBorder', '17': true},
    const {'1': 'drawType', '3': 20, '4': 1, '5': 9, '9': 19, '10': 'drawType', '17': true},
    const {'1': 'seniorModeSwitch', '3': 21, '4': 1, '5': 5, '9': 20, '10': 'seniorModeSwitch', '17': true},
  ],
  '8': const [
    const {'1': '_dmSwitch'},
    const {'1': '_aiSwitch'},
    const {'1': '_aiLevel'},
    const {'1': '_typeTop'},
    const {'1': '_typeScroll'},
    const {'1': '_typeBottom'},
    const {'1': '_typeColor'},
    const {'1': '_typeSpecial'},
    const {'1': '_preventShade'},
    const {'1': '_dmask'},
    const {'1': '_opacity'},
    const {'1': '_dmArea'},
    const {'1': '_speedPlus'},
    const {'1': '_fontSize'},
    const {'1': '_fullScreenSync'},
    const {'1': '_speedSync'},
    const {'1': '_fontFamily'},
    const {'1': '_bold'},
    const {'1': '_fontBorder'},
    const {'1': '_drawType'},
    const {'1': '_seniorModeSwitch'},
  ],
};

/// Descriptor for `DanmuWebPlayerConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmuWebPlayerConfigDescriptor = $convert.base64Decode('ChREYW5tdVdlYlBsYXllckNvbmZpZxIfCghkbVN3aXRjaBgBIAEoCEgAUghkbVN3aXRjaIgBARIfCghhaVN3aXRjaBgCIAEoCEgBUghhaVN3aXRjaIgBARIdCgdhaUxldmVsGAMgASgFSAJSB2FpTGV2ZWyIAQESHQoHdHlwZVRvcBgEIAEoCEgDUgd0eXBlVG9wiAEBEiMKCnR5cGVTY3JvbGwYBSABKAhIBFIKdHlwZVNjcm9sbIgBARIjCgp0eXBlQm90dG9tGAYgASgISAVSCnR5cGVCb3R0b22IAQESIQoJdHlwZUNvbG9yGAcgASgISAZSCXR5cGVDb2xvcogBARIlCgt0eXBlU3BlY2lhbBgIIAEoCEgHUgt0eXBlU3BlY2lhbIgBARInCgxwcmV2ZW50U2hhZGUYCSABKAhICFIMcHJldmVudFNoYWRliAEBEhkKBWRtYXNrGAogASgISAlSBWRtYXNriAEBEh0KB29wYWNpdHkYCyABKAJIClIHb3BhY2l0eYgBARIbCgZkbUFyZWEYDCABKAVIC1IGZG1BcmVhiAEBEiEKCXNwZWVkUGx1cxgNIAEoAkgMUglzcGVlZFBsdXOIAQESHwoIZm9udFNpemUYDiABKAJIDVIIZm9udFNpemWIAQESKwoOZnVsbFNjcmVlblN5bmMYDyABKAhIDlIOZnVsbFNjcmVlblN5bmOIAQESIQoJc3BlZWRTeW5jGBAgASgISA9SCXNwZWVkU3luY4gBARIjCgpmb250RmFtaWx5GBEgASgJSBBSCmZvbnRGYW1pbHmIAQESFwoEYm9sZBgSIAEoCEgRUgRib2xkiAEBEiMKCmZvbnRCb3JkZXIYEyABKAVIElIKZm9udEJvcmRlcogBARIfCghkcmF3VHlwZRgUIAEoCUgTUghkcmF3VHlwZYgBARIvChBzZW5pb3JNb2RlU3dpdGNoGBUgASgFSBRSEHNlbmlvck1vZGVTd2l0Y2iIAQFCCwoJX2RtU3dpdGNoQgsKCV9haVN3aXRjaEIKCghfYWlMZXZlbEIKCghfdHlwZVRvcEINCgtfdHlwZVNjcm9sbEINCgtfdHlwZUJvdHRvbUIMCgpfdHlwZUNvbG9yQg4KDF90eXBlU3BlY2lhbEIPCg1fcHJldmVudFNoYWRlQggKBl9kbWFza0IKCghfb3BhY2l0eUIJCgdfZG1BcmVhQgwKCl9zcGVlZFBsdXNCCwoJX2ZvbnRTaXplQhEKD19mdWxsU2NyZWVuU3luY0IMCgpfc3BlZWRTeW5jQg0KC19mb250RmFtaWx5QgcKBV9ib2xkQg0KC19mb250Qm9yZGVyQgsKCV9kcmF3VHlwZUITChFfc2VuaW9yTW9kZVN3aXRjaA==');
@$core.Deprecated('Use expressionsDescriptor instead')
const Expressions$json = const {
  '1': 'Expressions',
  '2': const [
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.com.muedsa.bilibili.model.Expression', '10': 'data'},
  ],
};

/// Descriptor for `Expressions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List expressionsDescriptor = $convert.base64Decode('CgtFeHByZXNzaW9ucxI5CgRkYXRhGAEgAygLMiUuY29tLm11ZWRzYS5iaWxpYmlsaS5tb2RlbC5FeHByZXNzaW9uUgRkYXRh');
@$core.Deprecated('Use expressionDescriptor instead')
const Expression$json = const {
  '1': 'Expression',
  '2': const [
    const {'1': 'keyword', '3': 1, '4': 3, '5': 9, '10': 'keyword'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'period', '3': 3, '4': 3, '5': 11, '6': '.com.muedsa.bilibili.model.Period', '10': 'period'},
  ],
  '8': const [
    const {'1': '_url'},
  ],
};

/// Descriptor for `Expression`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List expressionDescriptor = $convert.base64Decode('CgpFeHByZXNzaW9uEhgKB2tleXdvcmQYASADKAlSB2tleXdvcmQSFQoDdXJsGAIgASgJSABSA3VybIgBARI5CgZwZXJpb2QYAyADKAsyIS5jb20ubXVlZHNhLmJpbGliaWxpLm1vZGVsLlBlcmlvZFIGcGVyaW9kQgYKBF91cmw=');
@$core.Deprecated('Use periodDescriptor instead')
const Period$json = const {
  '1': 'Period',
  '2': const [
    const {'1': 'start', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'start', '17': true},
    const {'1': 'end', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'end', '17': true},
  ],
  '8': const [
    const {'1': '_start'},
    const {'1': '_end'},
  ],
};

/// Descriptor for `Period`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List periodDescriptor = $convert.base64Decode('CgZQZXJpb2QSGQoFc3RhcnQYASABKANIAFIFc3RhcnSIAQESFQoDZW5kGAIgASgDSAFSA2VuZIgBAUIICgZfc3RhcnRCBgoEX2VuZA==');
