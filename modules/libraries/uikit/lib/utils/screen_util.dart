import 'package:flutter/material.dart';

/// class-setting that defines devices' dimensions
abstract class ScreenDimension {
  static const (double min, double max) small = (0, 640);
  static const (double min, double max) medium = (640, 1024);
  static const (double min, double max) large = (1024, double.infinity);
}

/// class-setting for the text scaling factor of a device type
abstract class DeviceTextScaleFactor {
  static const double small = 1;
  static const double medium = 1.3;
  static const double large = 1;
}


/// util-function that make code simpler
Widget _callDeviceBuilderCheckingNull(
  WidgetBuilder? builder,
  BuildContext context,
) =>
    builder == null ? const SizedBox.shrink() : builder(context);




/// [ScreenUtil] is the main class for adopting widgets and make them responsive
class ScreenUtil {
  static DeviceType deviceTypeOf(Size size) => switch (size) {
        (Size size) when size.width <= DeviceType.small.size.$2 =>
          DeviceType.small,
        (Size size) when size.width <= DeviceType.medium.size.$2 =>
          DeviceType.medium,
        (Size size) when size.width <= DeviceType.large.size.$2 =>
          DeviceType.large,
        _ => throw DeviceTypeException("Undefined device type with $size"),
      };
}


// Base DeviceType class
@immutable
sealed class DeviceType {
  final String representation;
  final (double, double) size;

  final double textScaleFactor;

  static DeviceType large = const LargeDeviceType();
  static DeviceType medium = const MediumDeviceType();
  static DeviceType small = const SmallDeviceType();

  const DeviceType({
    required this.representation,
    required this.size,
    this.textScaleFactor = 1,
  });

  @override
  String toString() => representation;
}

/// [LargeDeviceType] is a class for large devices
final class LargeDeviceType extends DeviceType {
  const LargeDeviceType()
      : super(
          representation: "Large",
          size: ScreenDimension.large,
          textScaleFactor: DeviceTextScaleFactor.large,
        );
}

/// [MediumDeviceType] is a class for medium devices
final class MediumDeviceType extends DeviceType {
  const MediumDeviceType()
      : super(
          representation: "Medium",
          size: ScreenDimension.medium,
          textScaleFactor: DeviceTextScaleFactor.medium,
        );
}

/// [SmallDeviceType] is a class for medium devices
final class SmallDeviceType extends DeviceType {
  const SmallDeviceType()
      : super(
          representation: "Small",
          size: ScreenDimension.small,
          textScaleFactor: DeviceTextScaleFactor.small,
        );
}

/// Extension allows you to work with a class using BuildContext
extension ScreenUtilExtension on BuildContext {

  DeviceType get deviceType =>
      ScreenUtil.deviceTypeOf(MediaQuery.of(this).size);

  /// Adapt widget by DeviceType
  Widget adaptByDeviceType({
    WidgetBuilder? large,
    WidgetBuilder? medium,
    WidgetBuilder? small,
  }) {
    return switch (ScreenUtil.deviceTypeOf(MediaQuery.of(this).size)) {
      LargeDeviceType _ => _callDeviceBuilderCheckingNull(large, this),
      MediumDeviceType _ => _callDeviceBuilderCheckingNull(medium, this),
      SmallDeviceType _ => _callDeviceBuilderCheckingNull(small, this),
    };
  }

  /// Perform action by DeviceType
  void performActionByDeviceType({
    VoidCallback? large,
    VoidCallback? medium,
    VoidCallback? small,
  }) =>
      switch (ScreenUtil.deviceTypeOf(MediaQuery.of(this).size)) {
        LargeDeviceType _ => large == null ? () {} : large(),
        MediumDeviceType _ => medium == null ? () {} : medium(),
        SmallDeviceType _ => small == null ? () {} : small(),
      };
}

/// [DeviceTypeException] 
class DeviceTypeException implements Exception {
  final String message;
  const DeviceTypeException(this.message);

  @override
  String toString() => message;
}