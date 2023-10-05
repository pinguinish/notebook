import 'package:flutter/material.dart';

/// class-setting that defines devices' dimensions
abstract class ScreenDimension {
  static const double small = 640;
  static const double medium = 1024;
  static const double large = double.infinity;
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

// /// [ScreenUtil] is the main class for adopting widgets and make them responsive
class ScreenUtil {
  static DeviceType deviceTypeOf(double width) => switch (width) {
        (double width) when width <= DeviceType.small.screenDimension =>
          DeviceType.small,
        (double width) when width <= DeviceType.medium.screenDimension =>
          DeviceType.medium,
        (double width) when width <= DeviceType.large.screenDimension =>
          DeviceType.large,
        _ =>
          throw DeviceTypeException("Undefined device type with $width width"),
      };
}

// Base DeviceType class
@immutable
sealed class DeviceType {
  final String representation;
  final double screenDimension;

  final double textScaleFactor;

  static DeviceType large = const LargeDeviceType();
  static DeviceType medium = const MediumDeviceType();
  static DeviceType small = const SmallDeviceType();

  const DeviceType({
    required this.representation,
    required this.screenDimension,
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
          screenDimension: ScreenDimension.large,
          textScaleFactor: DeviceTextScaleFactor.large,
        );
}

/// [MediumDeviceType] is a class for medium devices
final class MediumDeviceType extends DeviceType {
  const MediumDeviceType()
      : super(
          representation: "Medium",
          screenDimension: ScreenDimension.medium,
          textScaleFactor: DeviceTextScaleFactor.medium,
        );
}

/// [SmallDeviceType] is a class for medium devices
final class SmallDeviceType extends DeviceType {
  const SmallDeviceType()
      : super(
          representation: "Small",
          screenDimension: ScreenDimension.small,
          textScaleFactor: DeviceTextScaleFactor.small,
        );
}

/// A widget that helps to achive responsiveness
class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    this.small,
    this.medium,
    this.large,
  }) : assert(
          small != null && medium != null && large != null,
          "at least one of the parameters must be passed",
        );

  final WidgetBuilder? small;
  final WidgetBuilder? medium;
  final WidgetBuilder? large;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) =>
          switch (ScreenUtil.deviceTypeOf(constraints.maxWidth)) {
        LargeDeviceType _ => _callDeviceBuilderCheckingNull(large, context),
        MediumDeviceType _ => _callDeviceBuilderCheckingNull(medium, context),
        SmallDeviceType _ => _callDeviceBuilderCheckingNull(small, context),
      },
    );
  }
}

/// Extension allows you to work with a class using BuildContext
extension ScreenUtilExtension on BuildContext {
  DeviceType get deviceType =>
      ScreenUtil.deviceTypeOf(MediaQuery.of(this).size.width);
}

/// [DeviceTypeException]
class DeviceTypeException implements Exception {
  final String message;
  const DeviceTypeException(this.message);

  @override
  String toString() => message;
}
