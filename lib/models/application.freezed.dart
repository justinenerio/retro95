// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'application.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ApplicationTearOff {
  const _$ApplicationTearOff();

  _Application call(
      {int processId,
      String processName,
      String label,
      String image,
      bool selected,
      bool maximized,
      bool minimized}) {
    return _Application(
      processId: processId,
      processName: processName,
      label: label,
      image: image,
      selected: selected,
      maximized: maximized,
      minimized: minimized,
    );
  }
}

// ignore: unused_element
const $Application = _$ApplicationTearOff();

mixin _$Application {
  int get processId;
  String get processName;
  String get label;
  String get image;
  bool get selected;
  bool get maximized;
  bool get minimized;

  $ApplicationCopyWith<Application> get copyWith;
}

abstract class $ApplicationCopyWith<$Res> {
  factory $ApplicationCopyWith(
          Application value, $Res Function(Application) then) =
      _$ApplicationCopyWithImpl<$Res>;
  $Res call(
      {int processId,
      String processName,
      String label,
      String image,
      bool selected,
      bool maximized,
      bool minimized});
}

class _$ApplicationCopyWithImpl<$Res> implements $ApplicationCopyWith<$Res> {
  _$ApplicationCopyWithImpl(this._value, this._then);

  final Application _value;
  // ignore: unused_field
  final $Res Function(Application) _then;

  @override
  $Res call({
    Object processId = freezed,
    Object processName = freezed,
    Object label = freezed,
    Object image = freezed,
    Object selected = freezed,
    Object maximized = freezed,
    Object minimized = freezed,
  }) {
    return _then(_value.copyWith(
      processId: processId == freezed ? _value.processId : processId as int,
      processName:
          processName == freezed ? _value.processName : processName as String,
      label: label == freezed ? _value.label : label as String,
      image: image == freezed ? _value.image : image as String,
      selected: selected == freezed ? _value.selected : selected as bool,
      maximized: maximized == freezed ? _value.maximized : maximized as bool,
      minimized: minimized == freezed ? _value.minimized : minimized as bool,
    ));
  }
}

abstract class _$ApplicationCopyWith<$Res>
    implements $ApplicationCopyWith<$Res> {
  factory _$ApplicationCopyWith(
          _Application value, $Res Function(_Application) then) =
      __$ApplicationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int processId,
      String processName,
      String label,
      String image,
      bool selected,
      bool maximized,
      bool minimized});
}

class __$ApplicationCopyWithImpl<$Res> extends _$ApplicationCopyWithImpl<$Res>
    implements _$ApplicationCopyWith<$Res> {
  __$ApplicationCopyWithImpl(
      _Application _value, $Res Function(_Application) _then)
      : super(_value, (v) => _then(v as _Application));

  @override
  _Application get _value => super._value as _Application;

  @override
  $Res call({
    Object processId = freezed,
    Object processName = freezed,
    Object label = freezed,
    Object image = freezed,
    Object selected = freezed,
    Object maximized = freezed,
    Object minimized = freezed,
  }) {
    return _then(_Application(
      processId: processId == freezed ? _value.processId : processId as int,
      processName:
          processName == freezed ? _value.processName : processName as String,
      label: label == freezed ? _value.label : label as String,
      image: image == freezed ? _value.image : image as String,
      selected: selected == freezed ? _value.selected : selected as bool,
      maximized: maximized == freezed ? _value.maximized : maximized as bool,
      minimized: minimized == freezed ? _value.minimized : minimized as bool,
    ));
  }
}

class _$_Application with DiagnosticableTreeMixin implements _Application {
  _$_Application(
      {this.processId,
      this.processName,
      this.label,
      this.image,
      this.selected,
      this.maximized,
      this.minimized});

  @override
  final int processId;
  @override
  final String processName;
  @override
  final String label;
  @override
  final String image;
  @override
  final bool selected;
  @override
  final bool maximized;
  @override
  final bool minimized;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Application(processId: $processId, processName: $processName, label: $label, image: $image, selected: $selected, maximized: $maximized, minimized: $minimized)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Application'))
      ..add(DiagnosticsProperty('processId', processId))
      ..add(DiagnosticsProperty('processName', processName))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('selected', selected))
      ..add(DiagnosticsProperty('maximized', maximized))
      ..add(DiagnosticsProperty('minimized', minimized));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Application &&
            (identical(other.processId, processId) ||
                const DeepCollectionEquality()
                    .equals(other.processId, processId)) &&
            (identical(other.processName, processName) ||
                const DeepCollectionEquality()
                    .equals(other.processName, processName)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)) &&
            (identical(other.maximized, maximized) ||
                const DeepCollectionEquality()
                    .equals(other.maximized, maximized)) &&
            (identical(other.minimized, minimized) ||
                const DeepCollectionEquality()
                    .equals(other.minimized, minimized)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(processId) ^
      const DeepCollectionEquality().hash(processName) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(selected) ^
      const DeepCollectionEquality().hash(maximized) ^
      const DeepCollectionEquality().hash(minimized);

  @override
  _$ApplicationCopyWith<_Application> get copyWith =>
      __$ApplicationCopyWithImpl<_Application>(this, _$identity);
}

abstract class _Application implements Application {
  factory _Application(
      {int processId,
      String processName,
      String label,
      String image,
      bool selected,
      bool maximized,
      bool minimized}) = _$_Application;

  @override
  int get processId;
  @override
  String get processName;
  @override
  String get label;
  @override
  String get image;
  @override
  bool get selected;
  @override
  bool get maximized;
  @override
  bool get minimized;
  @override
  _$ApplicationCopyWith<_Application> get copyWith;
}
