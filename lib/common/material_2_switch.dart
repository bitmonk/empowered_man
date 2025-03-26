// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:empowered/core/extension/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

// Examples can assume:
// void setState(VoidCallback fn) { }
// bool _isSelected = true;

enum _SwitchListTileType { material, adaptive }

/// A [ListTile] with a [Switch]. In other words, a switch with a label.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=0igIjvtEWNU}
///
/// The entire list tile is interactive: tapping anywhere in the tile toggles
/// the switch. Tapping and dragging the [Switch] also triggers the [onChanged]
/// callback.
///
/// To ensure that [onChanged] correctly triggers, the state passed
/// into [value] must be properly managed. This is typically done by invoking
/// [State.setState] in [onChanged] to toggle the state value.
///
/// The [value], [onChanged], [activeColor], [activeThumbImage], and
/// [inactiveThumbImage] properties of this widget are identical to the
/// similarly-named properties on the [Switch] widget.
///
/// The [title], [subtitle], [isThreeLine], and [dense] properties are like
/// those of the same name on [ListTile].
///
/// The [selected] property on this widget is similar to the [ListTile.selected]
/// property. This tile's [activeColor] is used for the selected item's text color, or
/// the theme's [SwitchThemeData.overlayColor] if [activeColor] is null.
///
/// This widget does not coordinate the [selected] state and the
/// [value]; to have the list tile appear selected when the
/// switch button is on, use the same value for both.
///
/// The switch is shown on the right by default in left-to-right languages (i.e.
/// in the [ListTile.trailing] slot) which can be changed using [controlAffinity].
/// The [secondary] widget is placed in the [ListTile.leading] slot.
///
/// This widget requires a [Material] widget ancestor in the tree to paint
/// itself on, which is typically provided by the app's [Scaffold].
/// The [tileColor], and [selectedTileColor] are not painted by the
/// [SwitchListTile] itself but by the [Material] widget ancestor. In this
/// case, one can wrap a [Material] widget around the [SwitchListTile], e.g.:
///
/// {@tool snippet}
/// ```dart
/// ColoredBox(
///   color: Colors.green,
///   child: Material(
///     child: SwitchListTile(
///       tileColor: Colors.red,
///       title: const Text('SwitchListTile with red background'),
///       value: true,
///       onChanged:(bool? value) { },
///     ),
///   ),
/// )
/// ```
/// {@end-tool}
///
/// ## Performance considerations when wrapping [SwitchListTile] with [Material]
///
/// Wrapping a large number of [SwitchListTile]s individually with [Material]s
/// is expensive. Consider only wrapping the [SwitchListTile]s that require it
/// or include a common [Material] ancestor where possible.
///
/// To show the [SwitchListTile] as disabled, pass null as the [onChanged]
/// callback.
///
/// {@tool dartpad}
/// ![SwitchListTile sample](https://flutter.github.io/assets-for-api-docs/assets/material/switch_list_tile.png)
///
/// This widget shows a switch that, when toggled, changes the state of a [bool]
/// member field called `_lights`.
///
/// ** See code in examples/api/lib/material/switch_list_tile/switch_list_tile.0.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This sample demonstrates how [SwitchListTile] positions the switch widget
/// relative to the text in different configurations.
///
/// ** See code in examples/api/lib/material/switch_list_tile/switch_list_tile.1.dart **
/// {@end-tool}
///
/// ## Semantics in SwitchListTile
///
/// Since the entirety of the SwitchListTile is interactive, it should represent
/// itself as a single interactive entity.
///
/// To do so, a SwitchListTile widget wraps its children with a [MergeSemantics]
/// widget. [MergeSemantics] will attempt to merge its descendant [Semantics]
/// nodes into one node in the semantics tree. Therefore, SwitchListTile will
/// throw an error if any of its children requires its own [Semantics] node.
///
/// For example, you cannot nest a [RichText] widget as a descendant of
/// SwitchListTile. [RichText] has an embedded gesture recognizer that
/// requires its own [Semantics] node, which directly conflicts with
/// SwitchListTile's desire to merge all its descendants' semantic nodes
/// into one. Therefore, it may be necessary to create a custom radio tile
/// widget to accommodate similar use cases.
///
/// {@tool dartpad}
/// ![Switch list tile semantics sample](https://flutter.github.io/assets-for-api-docs/assets/material/switch_list_tile_semantics.png)
///
/// Here is an example of a custom labeled radio widget, called
/// LinkedLabelRadio, that includes an interactive [RichText] widget that
/// handles tap gestures.
///
/// ** See code in examples/api/lib/material/switch_list_tile/custom_labeled_switch.0.dart **
/// {@end-tool}
///
/// ## SwitchListTile isn't exactly what I want
///
/// If the way SwitchListTile pads and positions its elements isn't quite what
/// you're looking for, you can create custom labeled switch widgets by
/// combining [Switch] with other widgets, such as [Text], [Padding] and
/// [InkWell].
///
/// {@tool dartpad}
/// ![Custom switch list tile sample](https://flutter.github.io/assets-for-api-docs/assets/material/switch_list_tile_custom.png)
///
/// Here is an example of a custom LabeledSwitch widget, but you can easily
/// make your own configurable widget.
///
/// ** See code in examples/api/lib/material/switch_list_tile/custom_labeled_switch.1.dart **
/// {@end-tool}
///
/// See also:
///
///  * [ListTileTheme], which can be used to affect the style of list tiles,
///    including switch list tiles.
///  * [CheckboxListTile], a similar widget for checkboxes.
///  * [RadioListTile], a similar widget for radio buttons.
///  * [ListTile] and [Switch], the widgets from which this widget is made.
class M2SwitchListTile extends StatelessWidget {
  /// Creates a combination of a list tile and a switch.
  ///
  /// The switch tile itself does not maintain any state. Instead, when the
  /// state of the switch changes, the widget calls the [onChanged] callback.
  /// Most widgets that use a switch will listen for the [onChanged] callback
  /// and rebuild the switch tile with a new [value] to update the visual
  /// appearance of the switch.
  ///
  /// The following arguments are required:
  ///
  /// * [value] determines whether this switch is on or off.
  /// * [onChanged] is called when the user toggles the switch on or off.
  const M2SwitchListTile({
    required this.value, required this.onChanged, super.key,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.thumbIcon,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
    this.tileColor,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.shape,
    this.selectedTileColor,
    this.visualDensity,
    this.enableFeedback,
    this.hoverColor,
  })  : _switchListTileType = _SwitchListTileType.material,
        applyCupertinoTheme = false,
        assert(activeThumbImage != null || onActiveThumbImageError == null),
        assert(inactiveThumbImage != null || onInactiveThumbImageError == null),
        assert(!isThreeLine || subtitle != null);

  /// Creates a Material [ListTile] with an adaptive [Switch], following
  /// Material design's
  /// [Cross-platform guidelines](https://material.io/design/platform-guidance/cross-platform-adaptation.html).
  ///
  /// This widget uses [Switch.adaptive] to change the graphics of the switch
  /// component based on the ambient [ThemeData.platform]. On iOS and macOS, a
  /// [CupertinoSwitch] will be used. On other platforms a Material design
  /// [Switch] will be used.
  ///
  /// If a [CupertinoSwitch] is created, the following parameters are
  /// ignored: [activeTrackColor], [inactiveThumbColor], [inactiveTrackColor],
  /// [activeThumbImage], [inactiveThumbImage].
  const M2SwitchListTile.adaptive({
    required this.value, required this.onChanged, super.key,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.thumbIcon,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
    this.applyCupertinoTheme,
    this.tileColor,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.shape,
    this.selectedTileColor,
    this.visualDensity,
    this.enableFeedback,
    this.hoverColor,
  })  : _switchListTileType = _SwitchListTileType.adaptive,
        assert(!isThreeLine || subtitle != null),
        assert(activeThumbImage != null || onActiveThumbImageError == null),
        assert(inactiveThumbImage != null || onInactiveThumbImageError == null);

  /// Whether this switch is checked.
  final bool value;

  /// Called when the user toggles the switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch tile with the
  /// new value.
  ///
  /// If null, the switch will be displayed as disabled.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// {@tool snippet}
  /// ```dart
  /// SwitchListTile(
  ///   value: _isSelected,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _isSelected = newValue;
  ///     });
  ///   },
  ///   title: const Text('Selection'),
  /// )
  /// ```
  /// {@end-tool}
  final ValueChanged<bool>? onChanged;

  /// {@macro flutter.material.switch.activeColor}
  ///
  /// Defaults to [ColorScheme.secondary] of the current [Theme].
  final Color? activeColor;

  /// {@macro flutter.material.switch.activeTrackColor}
  ///
  /// Defaults to [ColorScheme.secondary] with the opacity set at 50%.
  ///
  /// Ignored if created with [SwitchListTile.adaptive].
  final Color? activeTrackColor;

  /// {@macro flutter.material.switch.inactiveThumbColor}
  ///
  /// Defaults to the colors described in the Material design specification.
  ///
  /// Ignored if created with [SwitchListTile.adaptive].
  final Color? inactiveThumbColor;

  /// {@macro flutter.material.switch.inactiveTrackColor}
  ///
  /// Defaults to the colors described in the Material design specification.
  ///
  /// Ignored if created with [SwitchListTile.adaptive].
  final Color? inactiveTrackColor;

  /// {@macro flutter.material.switch.activeThumbImage}
  final ImageProvider? activeThumbImage;

  /// {@macro flutter.material.switch.onActiveThumbImageError}
  final ImageErrorListener? onActiveThumbImageError;

  /// {@macro flutter.material.switch.inactiveThumbImage}
  ///
  /// Ignored if created with [SwitchListTile.adaptive].
  final ImageProvider? inactiveThumbImage;

  /// {@macro flutter.material.switch.onInactiveThumbImageError}
  final ImageErrorListener? onInactiveThumbImageError;

  /// The color of this switch's thumb.
  ///
  /// Resolved in the following states:
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.disabled].
  ///
  /// If null, then the value of [activeColor] is used in the selected state
  /// and [inactiveThumbColor] in the default state. If that is also null, then
  /// the value of [SwitchThemeData.thumbColor] is used. If that is also null,
  /// The default value is used.
  final WidgetStateProperty<Color?>? thumbColor;

  /// The color of this switch's track.
  ///
  /// Resolved in the following states:
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.disabled].
  ///
  /// If null, then the value of [activeTrackColor] is used in the selected
  /// state and [inactiveTrackColor] in the default state. If that is also null,
  /// then the value of [SwitchThemeData.trackColor] is used. If that is also
  /// null, then the default value is used.
  final WidgetStateProperty<Color?>? trackColor;

  /// {@macro flutter.material.switch.trackOutlineColor}
  ///
  /// The [ListTile] will be focused when this [SwitchListTile] requests focus,
  /// so the focused outline color of the switch will be ignored.
  ///
  /// In Material 3, the outline color defaults to transparent in the selected
  /// state and [ColorScheme.outline] in the unselected state. In Material 2,
  /// the [Switch] track has no outline.
  final WidgetStateProperty<Color?>? trackOutlineColor;

  /// The icon to use on the thumb of this switch
  ///
  /// Resolved in the following states:
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.disabled].
  ///
  /// If null, then the value of [SwitchThemeData.thumbIcon] is used. If this is
  /// also null, then the [Switch] does not have any icons on the thumb.
  final WidgetStateProperty<Icon?>? thumbIcon;

  /// {@macro flutter.material.switch.materialTapTargetSize}
  ///
  /// defaults to [MaterialTapTargetSize.shrinkWrap].
  final MaterialTapTargetSize? materialTapTargetSize;

  /// {@macro flutter.cupertino.CupertinoSwitch.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [WidgetStateProperty.resolve] is used for the following [WidgetState]s:
  ///
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.disabled].
  ///
  /// If null, then the value of [SwitchThemeData.mouseCursor] is used. If that
  /// is also null, then [WidgetStateMouseCursor.clickable] is used.
  final MouseCursor? mouseCursor;

  /// The color for the switch's [Material].
  ///
  /// Resolves in the following states:
  ///  * [WidgetState.pressed].
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///
  /// If null, then the value of [activeColor] with alpha [kRadialReactionAlpha]
  /// and [hoverColor] is used in the pressed and hovered state. If that is also
  /// null, the value of [SwitchThemeData.overlayColor] is used. If that is
  /// also null, then the default value is used in the pressed and hovered state.
  final WidgetStateProperty<Color?>? overlayColor;

  /// {@macro flutter.material.switch.splashRadius}
  ///
  /// If null, then the value of [SwitchThemeData.splashRadius] is used. If that
  /// is also null, then [kRadialReactionRadius] is used.
  final double? splashRadius;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.material.inkwell.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.material.ListTile.tileColor}
  final Color? tileColor;

  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display on the opposite side of the tile from the switch.
  ///
  /// Typically an [Icon] widget.
  final Widget? secondary;

  /// Whether this list tile is intended to display three lines of text.
  ///
  /// If false, the list tile is treated as having one line if the subtitle is
  /// null and treated as having two lines if the subtitle is non-null.
  final bool isThreeLine;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null then its value is based on [ListTileThemeData.dense].
  final bool? dense;

  /// The tile's internal padding.
  ///
  /// Insets a [SwitchListTile]'s contents: its [title], [subtitle],
  /// [secondary], and [Switch] widgets.
  ///
  /// If null, [ListTile]'s default of `EdgeInsets.symmetric(horizontal: 16.0)`
  /// is used.
  final EdgeInsetsGeometry? contentPadding;

  /// Whether to render icons and text in the [activeColor].
  ///
  /// No effort is made to automatically coordinate the [selected] state and the
  /// [value] state. To have the list tile appear selected when the switch is
  /// on, pass the same value to both.
  ///
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// If adaptive, creates the switch with [Switch.adaptive].
  final _SwitchListTileType _switchListTileType;

  /// Defines the position of control and [secondary], relative to text.
  ///
  /// By default, the value of [controlAffinity] is [ListTileControlAffinity.platform].
  final ListTileControlAffinity controlAffinity;

  /// {@macro flutter.material.ListTile.shape}
  final ShapeBorder? shape;

  /// If non-null, defines the background color when [SwitchListTile.selected] is true.
  final Color? selectedTileColor;

  /// Defines how compact the list tile's layout will be.
  ///
  /// {@macro flutter.material.themedata.visualDensity}
  final VisualDensity? visualDensity;

  /// {@macro flutter.material.ListTile.enableFeedback}
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// The color for the tile's [Material] when a pointer is hovering over it.
  final Color? hoverColor;

  /// {@macro flutter.cupertino.CupertinoSwitch.applyTheme}
  final bool? applyCupertinoTheme;

  @override
  Widget build(BuildContext context) {
    final Widget control;
    switch (_switchListTileType) {
      case _SwitchListTileType.adaptive:
        control = ExcludeFocus(
          child: Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
            activeThumbImage: activeThumbImage,
            inactiveThumbImage: inactiveThumbImage,
            materialTapTargetSize:
                materialTapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
            activeTrackColor: activeTrackColor,
            inactiveTrackColor: inactiveTrackColor,
            inactiveThumbColor: inactiveThumbColor,
            autofocus: autofocus,
            onFocusChange: onFocusChange,
            onActiveThumbImageError: onActiveThumbImageError,
            onInactiveThumbImageError: onInactiveThumbImageError,
            thumbColor: thumbColor,
            trackColor: trackColor,
            trackOutlineColor: trackOutlineColor,
            thumbIcon: thumbIcon,
            applyCupertinoTheme: applyCupertinoTheme,
            dragStartBehavior: dragStartBehavior,
            mouseCursor: mouseCursor,
            splashRadius: splashRadius,
            overlayColor: overlayColor,
          ),
        );

      case _SwitchListTileType.material:
        control = ExcludeFocus(
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: activeColor,
            activeThumbImage: activeThumbImage,
            inactiveThumbImage: inactiveThumbImage,
            materialTapTargetSize:
                materialTapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
            activeTrackColor: activeTrackColor,
            inactiveTrackColor: inactiveTrackColor,
            inactiveThumbColor: inactiveThumbColor,
            autofocus: autofocus,
            onFocusChange: onFocusChange,
            onActiveThumbImageError: onActiveThumbImageError,
            onInactiveThumbImageError: onInactiveThumbImageError,
            thumbColor: thumbColor,
            trackColor: trackColor,
            trackOutlineColor: trackOutlineColor,
            thumbIcon: thumbIcon,
            dragStartBehavior: dragStartBehavior,
            mouseCursor: mouseCursor,
            splashRadius: splashRadius,
            overlayColor: overlayColor,
          ),
        );
    }
    Widget? leading;
    Widget? trailing;
    (leading, trailing) = switch (controlAffinity) {
      ListTileControlAffinity.leading => (control, secondary),
      ListTileControlAffinity.trailing || ListTileControlAffinity.platform => (
          secondary,
          control
        ),
    };

    final theme = Theme.of(context);
    final switchTheme = SwitchTheme.of(context);
    final states = <WidgetState>{
      if (selected) WidgetState.selected,
    };
    final effectiveActiveColor = activeColor ??
        switchTheme.thumbColor?.resolve(states) ??
        theme.colorScheme.secondary;
    return MergeSemantics(
      child: ListTile(
        selectedColor: effectiveActiveColor,
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        isThreeLine: isThreeLine,
        dense: dense,
        contentPadding: contentPadding,
        enabled: onChanged != null,
        onTap: onChanged != null
            ? () {
                onChanged!(!value);
              }
            : null,
        selected: selected,
        selectedTileColor: selectedTileColor,
        autofocus: autofocus,
        shape: shape,
        tileColor: tileColor,
        visualDensity: visualDensity,
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        enableFeedback: enableFeedback,
        hoverColor: hoverColor,
      ),
    );
  }
}

// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Examples can assume:
// bool _giveVerse = true;
// late StateSetter setState;

const double _kSwitchMinSize = kMinInteractiveDimension - 8.0;

enum _SwitchType { material, adaptive }

/// A Material Design switch.
///
/// Used to toggle the on/off state of a single setting.
///
/// The switch itself does not maintain any state. Instead, when the state of
/// the switch changes, the widget calls the [onChanged] callback. Most widgets
/// that use a switch will listen for the [onChanged] callback and rebuild the
/// switch with a new [value] to update the visual appearance of the switch.
///
/// If the [onChanged] callback is null, then the switch will be disabled (it
/// will not respond to input). A disabled switch's thumb and track are rendered
/// in shades of grey by default. The default appearance of a disabled switch
/// can be overridden with [inactiveThumbColor] and [inactiveTrackColor].
///
/// Requires one of its ancestors to be a [Material] widget.
///
/// Material Design 3 provides the option to add icons on the thumb of the [Switch].
/// If [ThemeData.useMaterial3] is set to true, users can use [Switch.thumbIcon]
/// to add optional Icons based on the different [WidgetState]s of the [Switch].
///
/// {@tool dartpad}
/// This example shows a toggleable [Switch]. When the thumb slides to the other
/// side of the track, the switch is toggled between on/off.
///
/// ** See code in examples/api/lib/material/switch/switch.0.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This example shows how to customize [Switch] using [WidgetStateProperty]
/// switch properties.
///
/// ** See code in examples/api/lib/material/switch/switch.1.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This example shows how to add icons on the thumb of the [Switch] using the
/// [Switch.thumbIcon] property.
///
/// ** See code in examples/api/lib/material/switch/switch.2.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// This example shows how to use the ambient [CupertinoThemeData] to style all
/// widgets which would otherwise use iOS defaults.
///
/// ** See code in examples/api/lib/material/switch/switch.3.dart **
/// {@end-tool}
///
/// See also:
///
///  * [SwitchListTile], which combines this widget with a [ListTile] so that
///    you can give the switch a label.
///  * [Checkbox], another widget with similar semantics.
///  * [Radio], for selecting among a set of explicit values.
///  * [Slider], for selecting a value in a range.
///  * [WidgetStateProperty], an interface for objects that "resolve" to
///    different values depending on a widget's material state.
///  * <https://material.io/design/components/selection-controls.html#switches>
class Switch extends StatelessWidget {
  /// Creates a Material Design switch.
  ///
  /// The switch itself does not maintain any state. Instead, when the state of
  /// the switch changes, the widget calls the [onChanged] callback. Most widgets
  /// that use a switch will listen for the [onChanged] callback and rebuild the
  /// switch with a new [value] to update the visual appearance of the switch.
  ///
  /// The following arguments are required:
  ///
  /// * [value] determines whether this switch is on or off.
  /// * [onChanged] is called when the user toggles the switch on or off.
  const Switch({
    required this.value, required this.onChanged, super.key,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.thumbIcon,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
  })  : _switchType = _SwitchType.material,
        applyCupertinoTheme = false,
        assert(activeThumbImage != null || onActiveThumbImageError == null),
        assert(inactiveThumbImage != null || onInactiveThumbImageError == null);

  /// Creates an adaptive [Switch] based on whether the target platform is iOS
  /// or macOS, following Material design's
  /// [Cross-platform guidelines](https://material.io/design/platform-guidance/cross-platform-adaptation.html).
  ///
  /// Creates a switch that looks and feels native when the [ThemeData.platform]
  /// is iOS or macOS, otherwise a Material Design switch is created.
  ///
  /// To provide a custom switch theme that's only used by this factory
  /// constructor, pass a custom `Adaptation<SwitchThemeData>` class to the
  /// `adaptations` parameter of [ThemeData]. This can be useful in situations
  /// where you don't want the overall [ThemeData.switchTheme] to apply when
  /// this adaptive constructor is used.
  ///
  /// {@tool dartpad}
  /// This sample shows how to create and use subclasses of [Adaptation] that
  /// define adaptive [SwitchThemeData]s.
  ///
  /// ** See code in examples/api/lib/material/switch/switch.4.dart **
  /// {@end-tool}
  ///
  /// The target platform is based on the current [Theme]: [ThemeData.platform].
  const Switch.adaptive({
    required this.value, required this.onChanged, super.key,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.materialTapTargetSize,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.thumbIcon,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
    this.applyCupertinoTheme,
  })  : assert(activeThumbImage != null || onActiveThumbImageError == null),
        assert(inactiveThumbImage != null || onInactiveThumbImageError == null),
        _switchType = _SwitchType.adaptive;

  /// Whether this switch is on or off.
  final bool value;

  /// Called when the user toggles the switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch with the new
  /// value.
  ///
  /// If null, the switch will be displayed as disabled.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// Switch(
  ///   value: _giveVerse,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _giveVerse = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool>? onChanged;

  /// {@template flutter.material.switch.activeColor}
  /// The color to use when this switch is on.
  /// {@endtemplate}
  ///
  /// Defaults to [ColorScheme.secondary].
  ///
  /// If [thumbColor] returns a non-null color in the [WidgetState.selected]
  /// state, it will be used instead of this color.
  final Color? activeColor;

  /// {@template flutter.material.switch.activeTrackColor}
  /// The color to use on the track when this switch is on.
  /// {@endtemplate}
  ///
  /// Defaults to [ColorScheme.secondary] with the opacity set at 50%.
  ///
  /// If [trackColor] returns a non-null color in the [WidgetState.selected]
  /// state, it will be used instead of this color.
  final Color? activeTrackColor;

  /// {@template flutter.material.switch.inactiveThumbColor}
  /// The color to use on the thumb when this switch is off.
  /// {@endtemplate}
  ///
  /// Defaults to the colors described in the Material design specification.
  ///
  /// If [thumbColor] returns a non-null color in the default state, it will be
  /// used instead of this color.
  final Color? inactiveThumbColor;

  /// {@template flutter.material.switch.inactiveTrackColor}
  /// The color to use on the track when this switch is off.
  /// {@endtemplate}
  ///
  /// Defaults to the colors described in the Material design specification.
  ///
  /// If [trackColor] returns a non-null color in the default state, it will be
  /// used instead of this color.
  final Color? inactiveTrackColor;

  /// {@template flutter.material.switch.activeThumbImage}
  /// An image to use on the thumb of this switch when the switch is on.
  /// {@endtemplate}
  final ImageProvider? activeThumbImage;

  /// {@template flutter.material.switch.onActiveThumbImageError}
  /// An optional error callback for errors emitted when loading
  /// [activeThumbImage].
  /// {@endtemplate}
  final ImageErrorListener? onActiveThumbImageError;

  /// {@template flutter.material.switch.inactiveThumbImage}
  /// An image to use on the thumb of this switch when the switch is off.
  /// {@endtemplate}
  final ImageProvider? inactiveThumbImage;

  /// {@template flutter.material.switch.onInactiveThumbImageError}
  /// An optional error callback for errors emitted when loading
  /// [inactiveThumbImage].
  /// {@endtemplate}
  final ImageErrorListener? onInactiveThumbImageError;

  /// {@template flutter.material.switch.thumbColor}
  /// The color of this [Switch]'s thumb.
  ///
  /// Resolved in the following states:
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [thumbColor] based on the current
  /// [WidgetState] of the [Switch], providing a different [Color] when it is
  /// [WidgetState.disabled].
  ///
  /// ```dart
  /// Switch(
  ///   value: true,
  ///   onChanged: (bool value) { },
  ///   thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return Colors.orange.withOpacity(.48);
  ///     }
  ///     return Colors.orange;
  ///   }),
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// If null, then the value of [activeColor] is used in the selected
  /// state and [inactiveThumbColor] in the default state. If that is also null,
  /// then the value of [SwitchThemeData.thumbColor] is used. If that is also
  /// null, then the following colors are used:
  ///
  /// | State    | Light theme                       | Dark theme                        |
  /// |----------|-----------------------------------|-----------------------------------|
  /// | Default  | `Colors.grey.shade50`             | `Colors.grey.shade400`            |
  /// | Selected | [ColorScheme.secondary] | [ColorScheme.secondary] |
  /// | Disabled | `Colors.grey.shade400`            | `Colors.grey.shade800`            |
  final WidgetStateProperty<Color?>? thumbColor;

  /// {@template flutter.material.switch.trackColor}
  /// The color of this [Switch]'s track.
  ///
  /// Resolved in the following states:
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [trackColor] based on the current
  /// [WidgetState] of the [Switch], providing a different [Color] when it is
  /// [WidgetState.disabled].
  ///
  /// ```dart
  /// Switch(
  ///   value: true,
  ///   onChanged: (bool value) { },
  ///   thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return Colors.orange.withOpacity(.48);
  ///     }
  ///     return Colors.orange;
  ///   }),
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// If null, then the value of [activeTrackColor] is used in the selected
  /// state and [inactiveTrackColor] in the default state. If that is also null,
  /// then the value of [SwitchThemeData.trackColor] is used. If that is also
  /// null, then the following colors are used:
  ///
  /// | State    | Light theme                     | Dark theme                      |
  /// |----------|---------------------------------|---------------------------------|
  /// | Default  | `Color(0x52000000)`             | `Colors.white30`                |
  /// | Selected | [activeColor] with alpha `0x80` | [activeColor] with alpha `0x80` |
  /// | Disabled | `Colors.black12`                | `Colors.white10`                |
  final WidgetStateProperty<Color?>? trackColor;

  /// {@template flutter.material.switch.trackOutlineColor}
  /// The outline color of this [Switch]'s track.
  ///
  /// Resolved in the following states:
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [trackOutlineColor] based on the current
  /// [WidgetState] of the [Switch], providing a different [Color] when it is
  /// [WidgetState.disabled].
  ///
  /// ```dart
  /// Switch(
  ///   value: true,
  ///   onChanged: (bool value) { },
  ///   trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return Colors.orange.withOpacity(.48);
  ///     }
  ///     return null; // Use the default color.
  ///   }),
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// In Material 3, the outline color defaults to transparent in the selected
  /// state and [ColorScheme.outline] in the unselected state. In Material 2,
  /// the [Switch] track has no outline by default.
  final WidgetStateProperty<Color?>? trackOutlineColor;

  /// {@template flutter.material.switch.trackOutlineWidth}
  /// The outline width of this [Switch]'s track.
  ///
  /// Resolved in the following states:
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [trackOutlineWidth] based on the current
  /// [WidgetState] of the [Switch], providing a different outline width when it is
  /// [WidgetState.disabled].
  ///
  /// ```dart
  /// Switch(
  ///   value: true,
  ///   onChanged: (bool value) { },
  ///   trackOutlineWidth: MaterialStateProperty.resolveWith<double?>((Set<MaterialState> states) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return 5.0;
  ///     }
  ///     return null; // Use the default width.
  ///   }),
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// Defaults to 2.0.
  final WidgetStateProperty<double?>? trackOutlineWidth;

  /// {@template flutter.material.switch.thumbIcon}
  /// The icon to use on the thumb of this switch
  ///
  /// Resolved in the following states:
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  ///
  /// {@tool snippet}
  /// This example resolves the [thumbIcon] based on the current
  /// [WidgetState] of the [Switch], providing a different [Icon] when it is
  /// [WidgetState.disabled].
  ///
  /// ```dart
  /// Switch(
  ///   value: true,
  ///   onChanged: (bool value) { },
  ///   thumbIcon: MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
  ///     if (states.contains(MaterialState.disabled)) {
  ///       return const Icon(Icons.close);
  ///     }
  ///     return null; // All other states will use the default thumbIcon.
  ///   }),
  /// )
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  ///
  /// If null, then the value of [SwitchThemeData.thumbIcon] is used. If this is also null,
  /// then the [Switch] does not have any icons on the thumb.
  final WidgetStateProperty<Icon?>? thumbIcon;

  /// {@template flutter.material.switch.materialTapTargetSize}
  /// Configures the minimum size of the tap target.
  /// {@endtemplate}
  ///
  /// If null, then the value of [SwitchThemeData.materialTapTargetSize] is
  /// used. If that is also null, then the value of
  /// [ThemeData.materialTapTargetSize] is used.
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize? materialTapTargetSize;

  final _SwitchType _switchType;

  /// {@macro flutter.cupertino.CupertinoSwitch.applyTheme}
  final bool? applyCupertinoTheme;

  /// {@macro flutter.cupertino.CupertinoSwitch.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@template flutter.material.switch.mouseCursor}
  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [WidgetStateProperty.resolve] is used for the following [WidgetState]s:
  ///
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  ///  * [WidgetState.disabled].
  /// {@endtemplate}
  ///
  /// If null, then the value of [SwitchThemeData.mouseCursor] is used. If that
  /// is also null, then [WidgetStateMouseCursor.clickable] is used.
  ///
  /// See also:
  ///
  ///  * [WidgetStateMouseCursor], a [MouseCursor] that implements
  ///    `MaterialStateProperty` which is used in APIs that need to accept
  ///    either a [MouseCursor] or a [MaterialStateProperty<MouseCursor>].
  final MouseCursor? mouseCursor;

  /// The color for the button's [Material] when it has the input focus.
  ///
  /// If [overlayColor] returns a non-null color in the [WidgetState.focused]
  /// state, it will be used instead.
  ///
  /// If null, then the value of [SwitchThemeData.overlayColor] is used in the
  /// focused state. If that is also null, then the value of
  /// [ThemeData.focusColor] is used.
  final Color? focusColor;

  /// The color for the button's [Material] when a pointer is hovering over it.
  ///
  /// If [overlayColor] returns a non-null color in the [WidgetState.hovered]
  /// state, it will be used instead.
  ///
  /// If null, then the value of [SwitchThemeData.overlayColor] is used in the
  /// hovered state. If that is also null, then the value of
  /// [ThemeData.hoverColor] is used.
  final Color? hoverColor;

  /// {@template flutter.material.switch.overlayColor}
  /// The color for the switch's [Material].
  ///
  /// Resolves in the following states:
  ///  * [WidgetState.pressed].
  ///  * [WidgetState.selected].
  ///  * [WidgetState.hovered].
  ///  * [WidgetState.focused].
  /// {@endtemplate}
  ///
  /// If null, then the value of [activeColor] with alpha
  /// [kRadialReactionAlpha], [focusColor] and [hoverColor] is used in the
  /// pressed, focused and hovered state. If that is also null,
  /// the value of [SwitchThemeData.overlayColor] is used. If that is
  /// also null, then the value of [ColorScheme.secondary] with alpha
  /// [kRadialReactionAlpha], [ThemeData.focusColor] and [ThemeData.hoverColor]
  /// is used in the pressed, focused and hovered state.
  final WidgetStateProperty<Color?>? overlayColor;

  /// {@template flutter.material.switch.splashRadius}
  /// The splash radius of the circular [Material] ink response.
  /// {@endtemplate}
  ///
  /// If null, then the value of [SwitchThemeData.splashRadius] is used. If that
  /// is also null, then [kRadialReactionRadius] is used.
  final double? splashRadius;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.material.inkwell.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  Size _getSwitchSize(BuildContext context) {
    final theme = Theme.of(context);
    var switchTheme = SwitchTheme.of(context);
    if (_switchType == _SwitchType.adaptive) {
      final switchAdaptation =
          theme.getAdaptation<SwitchThemeData>() ??
              const _SwitchThemeAdaptation();
      switchTheme = switchAdaptation.adapt(theme, switchTheme);
    }
    final _SwitchConfig switchConfig =
        // theme.useMaterial3 ? _SwitchConfigM3(context) :
        _SwitchConfigM2();

    final effectiveMaterialTapTargetSize =
        materialTapTargetSize ??
            switchTheme.materialTapTargetSize ??
            theme.materialTapTargetSize;
    return switch (effectiveMaterialTapTargetSize) {
      MaterialTapTargetSize.padded =>
        Size(switchConfig.switchWidth, switchConfig.switchHeight),
      MaterialTapTargetSize.shrinkWrap =>
        Size(switchConfig.switchWidth, switchConfig.switchHeightCollapsed),
    };
  }

  @override
  Widget build(BuildContext context) {
    Color? effectiveActiveThumbColor;
    Color? effectiveActiveTrackColor;

    switch (_switchType) {
      case _SwitchType.material:
        effectiveActiveThumbColor = activeColor;
      case _SwitchType.adaptive:
        switch (Theme.of(context).platform) {
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.linux:
          case TargetPlatform.windows:
            effectiveActiveThumbColor = activeColor;
          case TargetPlatform.iOS:
          case TargetPlatform.macOS:
            effectiveActiveTrackColor = activeColor;
        }
    }
    return _MaterialSwitch(
      value: value,
      onChanged: onChanged,
      size: _getSwitchSize(context),
      activeColor: effectiveActiveThumbColor,
      activeTrackColor: activeTrackColor ?? effectiveActiveTrackColor,
      inactiveThumbColor: inactiveThumbColor,
      inactiveTrackColor: inactiveTrackColor,
      activeThumbImage: activeThumbImage,
      onActiveThumbImageError: onActiveThumbImageError,
      inactiveThumbImage: inactiveThumbImage,
      onInactiveThumbImageError: onInactiveThumbImageError,
      thumbColor: thumbColor,
      trackColor: trackColor,
      trackOutlineColor: trackOutlineColor,
      trackOutlineWidth: trackOutlineWidth,
      thumbIcon: thumbIcon,
      materialTapTargetSize: materialTapTargetSize,
      dragStartBehavior: dragStartBehavior,
      mouseCursor: mouseCursor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      overlayColor: overlayColor,
      splashRadius: splashRadius,
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      autofocus: autofocus,
      applyCupertinoTheme: applyCupertinoTheme,
      switchType: _switchType,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty('value',
        value: value, ifTrue: 'on', ifFalse: 'off', showName: true,),);
    properties.add(ObjectFlagProperty<ValueChanged<bool>>(
        'onChanged', onChanged,
        ifNull: 'disabled',),);
  }
}

class _MaterialSwitch extends StatefulWidget {
  const _MaterialSwitch({
    required this.value,
    required this.onChanged,
    required this.size,
    required this.switchType,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
    this.thumbColor,
    this.trackColor,
    this.trackOutlineColor,
    this.trackOutlineWidth,
    this.thumbIcon,
    this.materialTapTargetSize,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
    this.applyCupertinoTheme,
  })  : assert(activeThumbImage != null || onActiveThumbImageError == null),
        assert(inactiveThumbImage != null || onInactiveThumbImageError == null);

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageProvider? inactiveThumbImage;
  final ImageErrorListener? onInactiveThumbImageError;
  final WidgetStateProperty<Color?>? thumbColor;
  final WidgetStateProperty<Color?>? trackColor;
  final WidgetStateProperty<Color?>? trackOutlineColor;
  final WidgetStateProperty<double?>? trackOutlineWidth;
  final WidgetStateProperty<Icon?>? thumbIcon;
  final MaterialTapTargetSize? materialTapTargetSize;
  final DragStartBehavior dragStartBehavior;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final bool autofocus;
  final Size size;
  final bool? applyCupertinoTheme;
  final _SwitchType switchType;

  @override
  State<StatefulWidget> createState() => _MaterialSwitchState();
}

class _MaterialSwitchState extends State<_MaterialSwitch>
    with TickerProviderStateMixin, ToggleableStateMixin {
  final _SwitchPainter _painter = _SwitchPainter();

  @override
  void didUpdateWidget(_MaterialSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      // During a drag we may have modified the curve, reset it if its possible
      // to do without visual discontinuation.
      if (position.value == 0.0 || position.value == 1.0) {
        switch (widget.switchType) {
          case _SwitchType.adaptive:
            switch (Theme.of(context).platform) {
              case TargetPlatform.android:
              case TargetPlatform.fuchsia:
              case TargetPlatform.linux:
              case TargetPlatform.windows:
                updateCurve();
              case TargetPlatform.iOS:
              case TargetPlatform.macOS:
                position
                  ..curve = Curves.linear
                  ..reverseCurve = Curves.linear;
            }
          case _SwitchType.material:
            updateCurve();
        }
      }
      animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;

  @override
  bool get tristate => false;

  @override
  bool? get value => widget.value;

  @override
  Duration? get reactionAnimationDuration => kRadialReactionDuration;

  void updateCurve() {
    if (Theme.of(context).useMaterial3) {
      position
        ..curve = Curves.easeOutBack
        ..reverseCurve = Curves.easeOutBack.flipped;
    } else {
      position
        ..curve = Curves.easeIn
        ..reverseCurve = Curves.easeOut;
    }
  }

  WidgetStateProperty<Color?> get _widgetThumbColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return widget.inactiveThumbColor;
      }
      if (states.contains(WidgetState.selected)) {
        return widget.activeColor;
      }
      return widget.inactiveThumbColor;
    });
  }

  WidgetStateProperty<Color?> get _widgetTrackColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return widget.activeTrackColor;
      }
      return widget.inactiveTrackColor;
    });
  }

  double get _trackInnerLength {
    switch (widget.switchType) {
      case _SwitchType.adaptive:
        switch (Theme.of(context).platform) {
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.linux:
          case TargetPlatform.windows:
            return widget.size.width - _kSwitchMinSize;
          case TargetPlatform.iOS:
          case TargetPlatform.macOS:
            final _SwitchConfig config = _SwitchConfigCupertino(context);
            final trackInnerStart = config.trackHeight / 2.0;
            final trackInnerEnd = config.trackWidth - trackInnerStart;
            final trackInnerLength = trackInnerEnd - trackInnerStart;
            return trackInnerLength;
        }
      case _SwitchType.material:
        return widget.size.width - _kSwitchMinSize;
    }
  }

  void _handleDragStart(DragStartDetails details) {
    if (isInteractive) {
      reactionController.forward();
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (isInteractive) {
      position
        ..curve = Curves.linear
        ..reverseCurve = null;
      final delta = details.primaryDelta! / _trackInnerLength;
      positionController.value += switch (Directionality.of(context)) {
        TextDirection.rtl => -delta,
        TextDirection.ltr => delta,
      };
    }
  }

  bool _needsPositionAnimation = false;

  void _handleDragEnd(DragEndDetails details) {
    if (position.value >= 0.5 != widget.value) {
      widget.onChanged?.call(!widget.value);
      // Wait with finishing the animation until widget.value has changed to
      // !widget.value as part of the widget.onChanged call above.
      setState(() {
        _needsPositionAnimation = true;
      });
    } else {
      animateToValue();
    }
    reactionController.reverse();
  }

  void _handleChanged(bool? value) {
    assert(value != null);
    assert(widget.onChanged != null);
    widget.onChanged?.call(value!);
  }

  bool isCupertino = false;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    if (_needsPositionAnimation) {
      _needsPositionAnimation = false;
      animateToValue();
    }

    final theme = Theme.of(context);
    var switchTheme = SwitchTheme.of(context);
    final cupertinoPrimaryColor =
        theme.cupertinoOverrideTheme?.primaryColor ?? theme.colorScheme.primary;

    _SwitchConfig switchConfig;
    SwitchThemeData defaults;
    var applyCupertinoTheme = false;
    double disabledOpacity = 1;
    switch (widget.switchType) {
      case _SwitchType.material:
        switchConfig =
            // theme.useMaterial3 ? _SwitchConfigM3(context) :
            _SwitchConfigM2();
        defaults =
            //  theme.useMaterial3
            // ? _SwitchDefaultsM3(context)
            // :
            _SwitchDefaultsM2(context);
      case _SwitchType.adaptive:
        final switchAdaptation =
            theme.getAdaptation<SwitchThemeData>() ??
                const _SwitchThemeAdaptation();
        switchTheme = switchAdaptation.adapt(theme, switchTheme);
        switch (theme.platform) {
          case TargetPlatform.android:
          case TargetPlatform.fuchsia:
          case TargetPlatform.linux:
          case TargetPlatform.windows:
            switchConfig =
                //  theme.useMaterial3
                //     ? _SwitchConfigM3(context)
                //     :
                _SwitchConfigM2();
            defaults =
                // theme.useMaterial3
                //     ? _SwitchDefaultsM3(context)
                //     :
                _SwitchDefaultsM2(context);
          case TargetPlatform.iOS:
          case TargetPlatform.macOS:
            isCupertino = true;
            applyCupertinoTheme = widget.applyCupertinoTheme ??
                theme.cupertinoOverrideTheme?.applyThemeToAll ??
                false;
            disabledOpacity = 0.5;
            switchConfig = _SwitchConfigCupertino(context);
            defaults = _SwitchDefaultsCupertino(context);
            reactionController.duration = const Duration(milliseconds: 200);
        }
    }

    positionController.duration =
        Duration(milliseconds: switchConfig.toggleDuration);

    // Colors need to be resolved in selected and non selected states separately
    // so that they can be lerped between.
    final activeStates = states..add(WidgetState.selected);
    final inactiveStates = states
      ..remove(WidgetState.selected);

    final activeThumbColor = widget.thumbColor?.resolve(activeStates) ??
        _widgetThumbColor.resolve(activeStates) ??
        switchTheme.thumbColor?.resolve(activeStates);
    final effectiveActiveThumbColor =
        activeThumbColor ?? defaults.thumbColor!.resolve(activeStates)!;
    final inactiveThumbColor =
        widget.thumbColor?.resolve(inactiveStates) ??
            _widgetThumbColor.resolve(inactiveStates) ??
            switchTheme.thumbColor?.resolve(inactiveStates);
    final effectiveInactiveThumbColor =
        inactiveThumbColor ?? defaults.thumbColor!.resolve(inactiveStates)!;
    final effectiveActiveTrackColor =
        widget.trackColor?.resolve(activeStates) ??
            _widgetTrackColor.resolve(activeStates) ??
            (applyCupertinoTheme
                ? cupertinoPrimaryColor
                : switchTheme.trackColor?.resolve(activeStates)) ??
            _widgetThumbColor.resolve(activeStates)?.withAlpha(0x80) ??
            defaults.trackColor!.resolve(activeStates)!;
    final effectiveActiveTrackOutlineColor =
        widget.trackOutlineColor?.resolve(activeStates) ??
            switchTheme.trackOutlineColor?.resolve(activeStates) ??
            defaults.trackOutlineColor!.resolve(activeStates);
    final effectiveActiveTrackOutlineWidth =
        widget.trackOutlineWidth?.resolve(activeStates) ??
            switchTheme.trackOutlineWidth?.resolve(activeStates) ??
            defaults.trackOutlineWidth?.resolve(activeStates);

    final effectiveInactiveTrackColor =
        widget.trackColor?.resolve(inactiveStates) ??
            _widgetTrackColor.resolve(inactiveStates) ??
            switchTheme.trackColor?.resolve(inactiveStates) ??
            defaults.trackColor!.resolve(inactiveStates)!;
    final effectiveInactiveTrackOutlineColor =
        widget.trackOutlineColor?.resolve(inactiveStates) ??
            switchTheme.trackOutlineColor?.resolve(inactiveStates) ??
            defaults.trackOutlineColor?.resolve(inactiveStates);
    final effectiveInactiveTrackOutlineWidth =
        widget.trackOutlineWidth?.resolve(inactiveStates) ??
            switchTheme.trackOutlineWidth?.resolve(inactiveStates) ??
            defaults.trackOutlineWidth?.resolve(inactiveStates);

    final effectiveActiveIcon = widget.thumbIcon?.resolve(activeStates) ??
        switchTheme.thumbIcon?.resolve(activeStates);
    final effectiveInactiveIcon =
        widget.thumbIcon?.resolve(inactiveStates) ??
            switchTheme.thumbIcon?.resolve(inactiveStates);

    final effectiveActiveIconColor = effectiveActiveIcon?.color ??
        switchConfig.iconColor.resolve(activeStates);
    final effectiveInactiveIconColor = effectiveInactiveIcon?.color ??
        switchConfig.iconColor.resolve(inactiveStates);

    final focusedStates = states..add(WidgetState.focused);
    final effectiveFocusOverlayColor =
        widget.overlayColor?.resolve(focusedStates) ??
            widget.focusColor ??
            switchTheme.overlayColor?.resolve(focusedStates) ??
            (applyCupertinoTheme
                ? HSLColor.fromColor(cupertinoPrimaryColor.withOpacity(0.80))
                    .withLightness(0.69)
                    .withSaturation(0.835)
                    .toColor()
                : null) ??
            defaults.overlayColor!.resolve(focusedStates)!;

    final hoveredStates = states..add(WidgetState.hovered);
    final effectiveHoverOverlayColor =
        widget.overlayColor?.resolve(hoveredStates) ??
            widget.hoverColor ??
            switchTheme.overlayColor?.resolve(hoveredStates) ??
            defaults.overlayColor!.resolve(hoveredStates)!;

    final activePressedStates = activeStates
      ..add(WidgetState.pressed);
    final effectiveActivePressedThumbColor =
        widget.thumbColor?.resolve(activePressedStates) ??
            _widgetThumbColor.resolve(activePressedStates) ??
            switchTheme.thumbColor?.resolve(activePressedStates) ??
            defaults.thumbColor!.resolve(activePressedStates)!;
    final effectiveActivePressedOverlayColor =
        widget.overlayColor?.resolve(activePressedStates) ??
            switchTheme.overlayColor?.resolve(activePressedStates) ??
            activeThumbColor?.withAlpha(kRadialReactionAlpha) ??
            defaults.overlayColor!.resolve(activePressedStates)!;

    final inactivePressedStates = inactiveStates
      ..add(WidgetState.pressed);
    final effectiveInactivePressedThumbColor =
        widget.thumbColor?.resolve(inactivePressedStates) ??
            _widgetThumbColor.resolve(inactivePressedStates) ??
            switchTheme.thumbColor?.resolve(inactivePressedStates) ??
            defaults.thumbColor!.resolve(inactivePressedStates)!;
    final effectiveInactivePressedOverlayColor =
        widget.overlayColor?.resolve(inactivePressedStates) ??
            switchTheme.overlayColor?.resolve(inactivePressedStates) ??
            inactiveThumbColor?.withAlpha(kRadialReactionAlpha) ??
            defaults.overlayColor!.resolve(inactivePressedStates)!;

    final effectiveMouseCursor =
        WidgetStateProperty.resolveWith<MouseCursor>(
            (Set<WidgetState> states) {
      return WidgetStateProperty.resolveAs<MouseCursor?>(
              widget.mouseCursor, states,) ??
          switchTheme.mouseCursor?.resolve(states) ??
          defaults.mouseCursor!.resolve(states)!;
    });

    final effectiveActiveThumbRadius = effectiveActiveIcon == null
        ? switchConfig.activeThumbRadius
        : switchConfig.thumbRadiusWithIcon;
    final effectiveInactiveThumbRadius =
        effectiveInactiveIcon == null && widget.inactiveThumbImage == null
            ? switchConfig.inactiveThumbRadius
            : switchConfig.thumbRadiusWithIcon;
    final effectiveSplashRadius = widget.splashRadius ??
        switchTheme.splashRadius ??
        defaults.splashRadius!;

    return Semantics(
      toggled: widget.value,
      child: GestureDetector(
        excludeFromSemantics: true,
        onHorizontalDragStart: _handleDragStart,
        onHorizontalDragUpdate: _handleDragUpdate,
        onHorizontalDragEnd: _handleDragEnd,
        dragStartBehavior: widget.dragStartBehavior,
        child: Opacity(
          opacity: onChanged == null ? disabledOpacity : 1,
          child: buildToggleable(
            mouseCursor: effectiveMouseCursor,
            focusNode: widget.focusNode,
            onFocusChange: widget.onFocusChange,
            autofocus: widget.autofocus,
            size: widget.size,
            painter: _painter
              ..position = position
              ..reaction = reaction
              ..reactionFocusFade = reactionFocusFade
              ..reactionHoverFade = reactionHoverFade
              ..inactiveReactionColor = effectiveInactivePressedOverlayColor
              ..reactionColor = effectiveActivePressedOverlayColor
              ..hoverColor = effectiveHoverOverlayColor
              ..focusColor = effectiveFocusOverlayColor
              ..splashRadius = effectiveSplashRadius
              ..downPosition = downPosition
              ..isFocused = states.contains(WidgetState.focused)
              ..isHovered = states.contains(WidgetState.hovered)
              ..activeColor = effectiveActiveThumbColor
              ..inactiveColor = effectiveInactiveThumbColor
              ..activePressedColor = effectiveActivePressedThumbColor
              ..inactivePressedColor = effectiveInactivePressedThumbColor
              ..activeThumbImage = widget.activeThumbImage
              ..onActiveThumbImageError = widget.onActiveThumbImageError
              ..inactiveThumbImage = widget.inactiveThumbImage
              ..onInactiveThumbImageError = widget.onInactiveThumbImageError
              ..activeTrackColor = effectiveActiveTrackColor
              ..activeTrackOutlineColor = effectiveActiveTrackOutlineColor
              ..activeTrackOutlineWidth = effectiveActiveTrackOutlineWidth
              ..inactiveTrackColor = effectiveInactiveTrackColor
              ..inactiveTrackOutlineColor = effectiveInactiveTrackOutlineColor
              ..inactiveTrackOutlineWidth = effectiveInactiveTrackOutlineWidth
              ..configuration = createLocalImageConfiguration(context)
              ..isInteractive = isInteractive
              ..trackInnerLength = _trackInnerLength
              ..textDirection = Directionality.of(context)
              ..surfaceColor = theme.colorScheme.surface
              ..inactiveThumbRadius = effectiveInactiveThumbRadius
              ..activeThumbRadius = effectiveActiveThumbRadius
              ..pressedThumbRadius = switchConfig.pressedThumbRadius
              ..thumbOffset = switchConfig.thumbOffset
              ..trackHeight = switchConfig.trackHeight
              ..trackWidth = switchConfig.trackWidth
              ..activeIconColor = effectiveActiveIconColor
              ..inactiveIconColor = effectiveInactiveIconColor
              ..activeIcon = effectiveActiveIcon
              ..inactiveIcon = effectiveInactiveIcon
              ..iconTheme = IconTheme.of(context)
              ..thumbShadow = switchConfig.thumbShadow
              ..transitionalThumbSize = switchConfig.transitionalThumbSize
              ..positionController = positionController
              ..isCupertino = isCupertino,
          ),
        ),
      ),
    );
  }
}

class _SwitchPainter extends ToggleablePainter {
  AnimationController get positionController => _positionController!;
  AnimationController? _positionController;
  set positionController(AnimationController? value) {
    assert(value != null);
    if (value == _positionController) {
      return;
    }
    _positionController = value;
    _colorAnimation?.dispose();
    _colorAnimation = CurvedAnimation(
        parent: positionController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,);
    notifyListeners();
  }

  CurvedAnimation? _colorAnimation;

  Icon? get activeIcon => _activeIcon;
  Icon? _activeIcon;
  set activeIcon(Icon? value) {
    if (value == _activeIcon) {
      return;
    }
    _activeIcon = value;
    notifyListeners();
  }

  Icon? get inactiveIcon => _inactiveIcon;
  Icon? _inactiveIcon;
  set inactiveIcon(Icon? value) {
    if (value == _inactiveIcon) {
      return;
    }
    _inactiveIcon = value;
    notifyListeners();
  }

  IconThemeData? get iconTheme => _iconTheme;
  IconThemeData? _iconTheme;
  set iconTheme(IconThemeData? value) {
    if (value == _iconTheme) {
      return;
    }
    _iconTheme = value;
    notifyListeners();
  }

  Color get activeIconColor => _activeIconColor!;
  Color? _activeIconColor;
  set activeIconColor(Color value) {
    if (value == _activeIconColor) {
      return;
    }
    _activeIconColor = value;
    notifyListeners();
  }

  Color get inactiveIconColor => _inactiveIconColor!;
  Color? _inactiveIconColor;
  set inactiveIconColor(Color value) {
    if (value == _inactiveIconColor) {
      return;
    }
    _inactiveIconColor = value;
    notifyListeners();
  }

  Color get activePressedColor => _activePressedColor!;
  Color? _activePressedColor;
  set activePressedColor(Color? value) {
    assert(value != null);
    if (value == _activePressedColor) {
      return;
    }
    _activePressedColor = value;
    notifyListeners();
  }

  Color get inactivePressedColor => _inactivePressedColor!;
  Color? _inactivePressedColor;
  set inactivePressedColor(Color? value) {
    assert(value != null);
    if (value == _inactivePressedColor) {
      return;
    }
    _inactivePressedColor = value;
    notifyListeners();
  }

  double get activeThumbRadius => _activeThumbRadius!;
  double? _activeThumbRadius;
  set activeThumbRadius(double value) {
    if (value == _activeThumbRadius) {
      return;
    }
    _activeThumbRadius = value;
    notifyListeners();
  }

  double get inactiveThumbRadius => _inactiveThumbRadius!;
  double? _inactiveThumbRadius;
  set inactiveThumbRadius(double value) {
    if (value == _inactiveThumbRadius) {
      return;
    }
    _inactiveThumbRadius = value;
    notifyListeners();
  }

  double get pressedThumbRadius => _pressedThumbRadius!;
  double? _pressedThumbRadius;
  set pressedThumbRadius(double value) {
    if (value == _pressedThumbRadius) {
      return;
    }
    _pressedThumbRadius = value;
    notifyListeners();
  }

  double? get thumbOffset => _thumbOffset;
  double? _thumbOffset;
  set thumbOffset(double? value) {
    if (value == _thumbOffset) {
      return;
    }
    _thumbOffset = value;
    notifyListeners();
  }

  Size get transitionalThumbSize => _transitionalThumbSize!;
  Size? _transitionalThumbSize;
  set transitionalThumbSize(Size value) {
    if (value == _transitionalThumbSize) {
      return;
    }
    _transitionalThumbSize = value;
    notifyListeners();
  }

  double get trackHeight => _trackHeight!;
  double? _trackHeight;
  set trackHeight(double value) {
    if (value == _trackHeight) {
      return;
    }
    _trackHeight = value;
    notifyListeners();
  }

  double get trackWidth => _trackWidth!;
  double? _trackWidth;
  set trackWidth(double value) {
    if (value == _trackWidth) {
      return;
    }
    _trackWidth = value;
    notifyListeners();
  }

  ImageProvider? get activeThumbImage => _activeThumbImage;
  ImageProvider? _activeThumbImage;
  set activeThumbImage(ImageProvider? value) {
    if (value == _activeThumbImage) {
      return;
    }
    _activeThumbImage = value;
    notifyListeners();
  }

  ImageErrorListener? get onActiveThumbImageError => _onActiveThumbImageError;
  ImageErrorListener? _onActiveThumbImageError;
  set onActiveThumbImageError(ImageErrorListener? value) {
    if (value == _onActiveThumbImageError) {
      return;
    }
    _onActiveThumbImageError = value;
    notifyListeners();
  }

  ImageProvider? get inactiveThumbImage => _inactiveThumbImage;
  ImageProvider? _inactiveThumbImage;
  set inactiveThumbImage(ImageProvider? value) {
    if (value == _inactiveThumbImage) {
      return;
    }
    _inactiveThumbImage = value;
    notifyListeners();
  }

  ImageErrorListener? get onInactiveThumbImageError =>
      _onInactiveThumbImageError;
  ImageErrorListener? _onInactiveThumbImageError;
  set onInactiveThumbImageError(ImageErrorListener? value) {
    if (value == _onInactiveThumbImageError) {
      return;
    }
    _onInactiveThumbImageError = value;
    notifyListeners();
  }

  Color get activeTrackColor => _activeTrackColor!;
  Color? _activeTrackColor;
  set activeTrackColor(Color value) {
    if (value == _activeTrackColor) {
      return;
    }
    _activeTrackColor = value;
    notifyListeners();
  }

  Color? get activeTrackOutlineColor => _activeTrackOutlineColor;
  Color? _activeTrackOutlineColor;
  set activeTrackOutlineColor(Color? value) {
    if (value == _activeTrackOutlineColor) {
      return;
    }
    _activeTrackOutlineColor = value;
    notifyListeners();
  }

  Color? get inactiveTrackOutlineColor => _inactiveTrackOutlineColor;
  Color? _inactiveTrackOutlineColor;
  set inactiveTrackOutlineColor(Color? value) {
    if (value == _inactiveTrackOutlineColor) {
      return;
    }
    _inactiveTrackOutlineColor = value;
    notifyListeners();
  }

  double? get activeTrackOutlineWidth => _activeTrackOutlineWidth;
  double? _activeTrackOutlineWidth;
  set activeTrackOutlineWidth(double? value) {
    if (value == _activeTrackOutlineWidth) {
      return;
    }
    _activeTrackOutlineWidth = value;
    notifyListeners();
  }

  double? get inactiveTrackOutlineWidth => _inactiveTrackOutlineWidth;
  double? _inactiveTrackOutlineWidth;
  set inactiveTrackOutlineWidth(double? value) {
    if (value == _inactiveTrackOutlineWidth) {
      return;
    }
    _inactiveTrackOutlineWidth = value;
    notifyListeners();
  }

  Color get inactiveTrackColor => _inactiveTrackColor!;
  Color? _inactiveTrackColor;
  set inactiveTrackColor(Color value) {
    if (value == _inactiveTrackColor) {
      return;
    }
    _inactiveTrackColor = value;
    notifyListeners();
  }

  ImageConfiguration get configuration => _configuration!;
  ImageConfiguration? _configuration;
  set configuration(ImageConfiguration value) {
    if (value == _configuration) {
      return;
    }
    _configuration = value;
    notifyListeners();
  }

  TextDirection get textDirection => _textDirection!;
  TextDirection? _textDirection;
  set textDirection(TextDirection value) {
    if (_textDirection == value) {
      return;
    }
    _textDirection = value;
    notifyListeners();
  }

  Color get surfaceColor => _surfaceColor!;
  Color? _surfaceColor;
  set surfaceColor(Color value) {
    if (value == _surfaceColor) {
      return;
    }
    _surfaceColor = value;
    notifyListeners();
  }

  bool get isInteractive => _isInteractive!;
  bool? _isInteractive;
  set isInteractive(bool value) {
    if (value == _isInteractive) {
      return;
    }
    _isInteractive = value;
    notifyListeners();
  }

  double get trackInnerLength => _trackInnerLength!;
  double? _trackInnerLength;
  set trackInnerLength(double value) {
    if (value == _trackInnerLength) {
      return;
    }
    _trackInnerLength = value;
    notifyListeners();
  }

  bool get isCupertino => _isCupertino!;
  bool? _isCupertino;
  set isCupertino(bool? value) {
    assert(value != null);
    if (value == _isCupertino) {
      return;
    }
    _isCupertino = value;
    notifyListeners();
  }

  List<BoxShadow>? get thumbShadow => _thumbShadow;
  List<BoxShadow>? _thumbShadow;
  set thumbShadow(List<BoxShadow>? value) {
    if (value == _thumbShadow) {
      return;
    }
    _thumbShadow = value;
    notifyListeners();
  }

  final TextPainter _textPainter = TextPainter();
  Color? _cachedThumbColor;
  ImageProvider? _cachedThumbImage;
  ImageErrorListener? _cachedThumbErrorListener;
  BoxPainter? _cachedThumbPainter;

  ShapeDecoration _createDefaultThumbDecoration(
      Color color, ImageProvider? image, ImageErrorListener? errorListener,) {
    return ShapeDecoration(
      color: color,
      image: image == null
          ? null
          : DecorationImage(image: image, onError: errorListener),
      shape: const StadiumBorder(),
      shadows: isCupertino ? null : thumbShadow,
    );
  }

  bool _isPainting = false;

  void _handleDecorationChanged() {
    // If the image decoration is available synchronously, we'll get called here
    // during paint. There's no reason to mark ourselves as needing paint if we
    // are already in the middle of painting. (In fact, doing so would trigger
    // an assert).
    if (!_isPainting) {
      notifyListeners();
    }
  }

  bool _stopPressAnimation = false;
  double? _pressedInactiveThumbRadius;
  double? _pressedActiveThumbRadius;
  late double? _pressedThumbExtension;

  @override
  void paint(Canvas canvas, Size size) {
    final currentValue = position.value;

    final visualPosition = switch (textDirection) {
      TextDirection.rtl => 1.0 - currentValue,
      TextDirection.ltr => currentValue,
    };
    if (reaction.status == AnimationStatus.reverse && !_stopPressAnimation) {
      _stopPressAnimation = true;
    } else {
      _stopPressAnimation = false;
    }

    // To get the thumb radius when the press ends, the value can be any number
    // between activeThumbRadius/inactiveThumbRadius and pressedThumbRadius.
    if (!_stopPressAnimation) {
      _pressedThumbExtension = isCupertino ? reaction.value * 7 : 0;
      if (reaction.isCompleted) {
        // This happens when the thumb is dragged instead of being tapped.
        _pressedInactiveThumbRadius =
            lerpDouble(inactiveThumbRadius, pressedThumbRadius, reaction.value);
        _pressedActiveThumbRadius =
            lerpDouble(activeThumbRadius, pressedThumbRadius, reaction.value);
      }
      if (currentValue == 0) {
        _pressedInactiveThumbRadius =
            lerpDouble(inactiveThumbRadius, pressedThumbRadius, reaction.value);
        _pressedActiveThumbRadius = activeThumbRadius;
      }
      if (currentValue == 1) {
        _pressedActiveThumbRadius =
            lerpDouble(activeThumbRadius, pressedThumbRadius, reaction.value);
        _pressedInactiveThumbRadius = inactiveThumbRadius;
      }
    }
    final inactiveThumbSize = isCupertino
        ? Size(_pressedInactiveThumbRadius! * 2 + _pressedThumbExtension!,
            _pressedInactiveThumbRadius! * 2,)
        : Size.fromRadius(_pressedInactiveThumbRadius ?? inactiveThumbRadius);
    final activeThumbSize = isCupertino
        ? Size(_pressedActiveThumbRadius! * 2 + _pressedThumbExtension!,
            _pressedActiveThumbRadius! * 2,)
        : Size.fromRadius(_pressedActiveThumbRadius ?? activeThumbRadius);
    Animation<Size> thumbSizeAnimation(bool isForward) {
      List<TweenSequenceItem<Size>> thumbSizeSequence;
      if (isForward) {
        thumbSizeSequence = <TweenSequenceItem<Size>>[
          TweenSequenceItem<Size>(
            tween: Tween<Size>(
                    begin: inactiveThumbSize, end: transitionalThumbSize,)
                .chain(CurveTween(curve: const Cubic(0.31, 0, 0.56, 1))),
            weight: 11,
          ),
          TweenSequenceItem<Size>(
            tween: Tween<Size>(
                    begin: transitionalThumbSize, end: activeThumbSize,)
                .chain(CurveTween(curve: const Cubic(0.20, 0, 0, 1))),
            weight: 72,
          ),
          TweenSequenceItem<Size>(
            tween: ConstantTween<Size>(activeThumbSize),
            weight: 17,
          ),
        ];
      } else {
        thumbSizeSequence = <TweenSequenceItem<Size>>[
          TweenSequenceItem<Size>(
            tween: ConstantTween<Size>(inactiveThumbSize),
            weight: 17,
          ),
          TweenSequenceItem<Size>(
            tween: Tween<Size>(
                    begin: inactiveThumbSize, end: transitionalThumbSize,)
                .chain(CurveTween(
                    curve: const Cubic(0.20, 0, 0, 1).flipped,),),
            weight: 72,
          ),
          TweenSequenceItem<Size>(
            tween:
                Tween<Size>(begin: transitionalThumbSize, end: activeThumbSize)
                    .chain(CurveTween(
                        curve: const Cubic(0.31, 0, 0.56, 1).flipped,),),
            weight: 11,
          ),
        ];
      }

      return TweenSequence<Size>(thumbSizeSequence).animate(positionController);
    }

    Size? thumbSize;
    if (isCupertino) {
      if (reaction.isCompleted) {
        thumbSize = Size(
            _pressedInactiveThumbRadius! * 2 + _pressedThumbExtension!,
            _pressedInactiveThumbRadius! * 2,);
      } else {
        if (position.isDismissed ||
            position.status == AnimationStatus.forward) {
          thumbSize =
              Size.lerp(inactiveThumbSize, activeThumbSize, position.value);
        } else {
          thumbSize =
              Size.lerp(inactiveThumbSize, activeThumbSize, position.value);
        }
      }
    } else {
      if (reaction.isCompleted) {
        thumbSize = Size.fromRadius(pressedThumbRadius);
      } else {
        if (position.isDismissed ||
            position.status == AnimationStatus.forward) {
          thumbSize = thumbSizeAnimation(true).value;
        } else {
          thumbSize = thumbSizeAnimation(false).value;
        }
      }
    }

    // The thumb contracts slightly during the animation in Material 2.
    final inset = thumbOffset == null
        ? 0
        : 1.0 - (currentValue - thumbOffset!).abs() * 2.0;
    thumbSize = Size(thumbSize!.width - inset, thumbSize.height - inset);

    final colorValue = _colorAnimation!.value;
    final trackColor =
        Color.lerp(inactiveTrackColor, activeTrackColor, colorValue)!;
    final trackOutlineColor =
        inactiveTrackOutlineColor == null || activeTrackOutlineColor == null
            ? null
            : Color.lerp(
                inactiveTrackOutlineColor, activeTrackOutlineColor, colorValue,);
    final trackOutlineWidth = lerpDouble(
        inactiveTrackOutlineWidth, activeTrackOutlineWidth, colorValue,);
    Color lerpedThumbColor;
    if (!reaction.isDismissed) {
      lerpedThumbColor =
          Color.lerp(inactivePressedColor, activePressedColor, colorValue)!;
    } else if (positionController.status == AnimationStatus.forward) {
      lerpedThumbColor =
          Color.lerp(inactivePressedColor, activeColor, colorValue)!;
    } else if (positionController.status == AnimationStatus.reverse) {
      lerpedThumbColor =
          Color.lerp(inactiveColor, activePressedColor, colorValue)!;
    } else {
      lerpedThumbColor = Color.lerp(inactiveColor, activeColor, colorValue)!;
    }

    // Blend the thumb color against a `surfaceColor` background in case the
    // thumbColor is not opaque. This way we do not see through the thumb to the
    // track underneath.
    final thumbColor = Color.alphaBlend(lerpedThumbColor, surfaceColor);

    final thumbIcon = currentValue < 0.5 ? inactiveIcon : activeIcon;

    final thumbImage =
        currentValue < 0.5 ? inactiveThumbImage : activeThumbImage;

    final thumbErrorListener = currentValue < 0.5
        ? onInactiveThumbImageError
        : onActiveThumbImageError;

    final paint = Paint()..color = trackColor;

    final trackPaintOffset =
        _computeTrackPaintOffset(size, trackWidth, trackHeight);
    final thumbPaintOffset =
        _computeThumbPaintOffset(trackPaintOffset, thumbSize, visualPosition);
    final radialReactionOrigin =
        Offset(thumbPaintOffset.dx + thumbSize.height / 2, size.height / 2);

    _paintTrackWith(
        canvas, paint, trackPaintOffset, trackOutlineColor, trackOutlineWidth,);
    paintRadialReaction(canvas: canvas, origin: radialReactionOrigin);
    _paintThumbWith(
      thumbPaintOffset,
      canvas,
      colorValue,
      thumbColor,
      thumbImage,
      thumbErrorListener,
      thumbIcon,
      thumbSize,
      inset,
    );
  }

  /// Computes canvas offset for track's upper left corner
  Offset _computeTrackPaintOffset(
      Size canvasSize, double trackWidth, double trackHeight,) {
    final horizontalOffset = (canvasSize.width - trackWidth) / 2.0;
    final verticalOffset = (canvasSize.height - trackHeight) / 2.0;

    return Offset(horizontalOffset, verticalOffset);
  }

  /// Computes canvas offset for thumb's upper left corner as if it were a
  /// square
  Offset _computeThumbPaintOffset(
      Offset trackPaintOffset, Size thumbSize, double visualPosition,) {
    // How much thumb radius extends beyond the track
    final trackRadius = trackHeight / 2;
    final additionalThumbRadius = thumbSize.height / 2 - trackRadius;

    final horizontalProgress =
        visualPosition * (trackInnerLength - _pressedThumbExtension!);
    final thumbHorizontalOffset = trackPaintOffset.dx +
        trackRadius +
        (_pressedThumbExtension! / 2) -
        thumbSize.width / 2 +
        horizontalProgress;
    final thumbVerticalOffset =
        trackPaintOffset.dy - additionalThumbRadius;
    return Offset(thumbHorizontalOffset, thumbVerticalOffset);
  }

  void _paintTrackWith(Canvas canvas, Paint paint, Offset trackPaintOffset,
      Color? trackOutlineColor, double? trackOutlineWidth,) {
    final trackRect = Rect.fromLTWH(
      trackPaintOffset.dx,
      trackPaintOffset.dy,
      trackWidth,
      trackHeight,
    );
    final trackRadius = trackHeight / 2;
    final trackRRect = RRect.fromRectAndRadius(
      trackRect,
      Radius.circular(trackRadius),
    );

    canvas.drawRRect(trackRRect, paint);

    // paint track outline
    if (trackOutlineColor != null) {
      final outlineTrackRect = Rect.fromLTWH(
        trackPaintOffset.dx + 1,
        trackPaintOffset.dy + 1,
        trackWidth - 2,
        trackHeight - 2,
      );
      final outlineTrackRRect = RRect.fromRectAndRadius(
        outlineTrackRect,
        Radius.circular(trackRadius),
      );

      final outlinePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = trackOutlineWidth ?? 2.0
        ..color = trackOutlineColor;

      canvas.drawRRect(outlineTrackRRect, outlinePaint);
    }

    if (isCupertino) {
      if (isFocused) {
        final focusedOutline = trackRRect.inflate(1.75);
        final focusedPaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = focusColor
          ..strokeWidth = _kCupertinoFocusTrackOutline;
        canvas.drawRRect(focusedOutline, focusedPaint);
      }
      canvas.clipRRect(trackRRect);
    }
  }

  void _paintThumbWith(
    Offset thumbPaintOffset,
    Canvas canvas,
    double currentValue,
    Color thumbColor,
    ImageProvider? thumbImage,
    ImageErrorListener? thumbErrorListener,
    Icon? thumbIcon,
    Size thumbSize,
    double inset,
  ) {
    try {
      _isPainting = true;
      if (_cachedThumbPainter == null ||
          thumbColor != _cachedThumbColor ||
          thumbImage != _cachedThumbImage ||
          thumbErrorListener != _cachedThumbErrorListener) {
        _cachedThumbColor = thumbColor;
        _cachedThumbImage = thumbImage;
        _cachedThumbErrorListener = thumbErrorListener;
        _cachedThumbPainter?.dispose();
        _cachedThumbPainter = _createDefaultThumbDecoration(
                thumbColor, thumbImage, thumbErrorListener,)
            .createBoxPainter(_handleDecorationChanged);
      }
      final thumbPainter = _cachedThumbPainter!;

      if (isCupertino) {
        _paintCupertinoThumbShadowAndBorder(
            canvas, thumbPaintOffset, thumbSize,);
      }

      thumbPainter.paint(
        canvas,
        thumbPaintOffset,
        configuration.copyWith(size: thumbSize),
      );

      if (thumbIcon != null && thumbIcon.icon != null) {
        final iconColor =
            Color.lerp(inactiveIconColor, activeIconColor, currentValue)!;
        final iconSize = thumbIcon.size ?? _SwitchConfigM3.iconSize;
        final iconData = thumbIcon.icon!;
        final iconWeight = thumbIcon.weight ?? iconTheme?.weight;
        final iconFill = thumbIcon.fill ?? iconTheme?.fill;
        final iconGrade = thumbIcon.grade ?? iconTheme?.grade;
        final iconOpticalSize =
            thumbIcon.opticalSize ?? iconTheme?.opticalSize;
        final iconShadows =
            thumbIcon.shadows ?? iconTheme?.shadows;

        final textSpan = TextSpan(
          text: String.fromCharCode(iconData.codePoint),
          style: TextStyle(
            fontVariations: <FontVariation>[
              if (iconFill != null) FontVariation('FILL', iconFill),
              if (iconWeight != null) FontVariation('wght', iconWeight),
              if (iconGrade != null) FontVariation('GRAD', iconGrade),
              if (iconOpticalSize != null)
                FontVariation('opsz', iconOpticalSize),
            ],
            color: iconColor,
            fontSize: iconSize,
            inherit: false,
            fontFamily: iconData.fontFamily,
            package: iconData.fontPackage,
            shadows: iconShadows,
          ),
        );
        _textPainter
          ..textDirection = textDirection
          ..text = textSpan;
        _textPainter.layout();
        final additionalHorizontalOffset =
            (thumbSize.width - iconSize) / 2;
        final additionalVerticalOffset =
            (thumbSize.height - iconSize) / 2;
        final offset = thumbPaintOffset +
            Offset(additionalHorizontalOffset, additionalVerticalOffset);

        _textPainter.paint(canvas, offset);
      }
    } finally {
      _isPainting = false;
    }
  }

  void _paintCupertinoThumbShadowAndBorder(
    Canvas canvas,
    Offset thumbPaintOffset,
    Size thumbSize,
  ) {
    final thumbBounds = RRect.fromLTRBR(
      thumbPaintOffset.dx,
      thumbPaintOffset.dy,
      thumbPaintOffset.dx + thumbSize.width,
      thumbPaintOffset.dy + thumbSize.height,
      Radius.circular(thumbSize.height / 2.0),
    );
    if (thumbShadow != null) {
      for (final shadow in thumbShadow!) {
        canvas.drawRRect(thumbBounds.shift(shadow.offset), shadow.toPaint());
      }
    }

    canvas.drawRRect(
      thumbBounds.inflate(0.5),
      Paint()..color = const Color(0x0A000000),
    );
  }

  @override
  void dispose() {
    _textPainter.dispose();
    _cachedThumbPainter?.dispose();
    _cachedThumbPainter = null;
    _cachedThumbColor = null;
    _cachedThumbImage = null;
    _cachedThumbErrorListener = null;
    _colorAnimation?.dispose();
    super.dispose();
  }
}

class _SwitchThemeAdaptation extends Adaptation<SwitchThemeData> {
  const _SwitchThemeAdaptation();

  @override
  SwitchThemeData adapt(ThemeData theme, SwitchThemeData defaultValue) {
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return defaultValue;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const SwitchThemeData();
    }
  }
}

mixin _SwitchConfig {
  double get trackHeight;
  double get trackWidth;
  double get switchWidth;
  double get switchHeight;
  double get switchHeightCollapsed;
  double get activeThumbRadius;
  double get inactiveThumbRadius;
  double get pressedThumbRadius;
  double get thumbRadiusWithIcon;
  List<BoxShadow>? get thumbShadow;
  WidgetStateProperty<Color> get iconColor;
  double? get thumbOffset;
  Size get transitionalThumbSize;
  int get toggleDuration;
}

// Hand coded defaults for iOS/macOS Switch
class _SwitchDefaultsCupertino extends SwitchThemeData {
  const _SwitchDefaultsCupertino(this.context);

  final BuildContext context;

  @override
  WidgetStateProperty<MouseCursor?> get mouseCursor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return SystemMouseCursors.basic;
      }
      return kIsWeb ? SystemMouseCursors.click : SystemMouseCursors.basic;
    });
  }

  @override
  WidgetStateProperty<Color> get thumbColor =>
      const WidgetStatePropertyAll<Color>(Colors.white);

  @override
  WidgetStateProperty<Color> get trackColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return CupertinoDynamicColor.resolve(
            CupertinoColors.systemGreen, context,);
      }
      return CupertinoDynamicColor.resolve(
          CupertinoColors.secondarySystemFill, context,);
    });
  }

  @override
  WidgetStateProperty<Color?> get trackOutlineColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<Color?> get overlayColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.focused)) {
        return HSLColor.fromColor(CupertinoDynamicColor.resolve(
                    CupertinoColors.systemGreen, context,)
                .withOpacity(0.80),)
            .withLightness(0.69)
            .withSaturation(0.835)
            .toColor();
      }
      return Colors.transparent;
    });
  }

  @override
  double get splashRadius => 0;
}

const double _kCupertinoFocusTrackOutline = 3.5;

class _SwitchConfigCupertino with _SwitchConfig {
  _SwitchConfigCupertino(this.context)
      : _colors = Theme.of(context).colorScheme;

  BuildContext context;
  final ColorScheme _colors;

  @override
  WidgetStateProperty<Color> get iconColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return _colors.onSurface.withOpacity(0.38);
      }
      return _colors.onPrimaryContainer;
    });
  }

  @override
  double get activeThumbRadius => 14;

  @override
  double get inactiveThumbRadius => 14;

  @override
  double get pressedThumbRadius => 14;

  @override
  double get switchHeight => _kSwitchMinSize + 8.0;

  @override
  double get switchHeightCollapsed => _kSwitchMinSize;

  @override
  double get switchWidth => 60;

  @override
  double get thumbRadiusWithIcon => 14;

  @override
  List<BoxShadow>? get thumbShadow => const <BoxShadow>[
        BoxShadow(
          color: Color(0x26000000),
          offset: Offset(0, 3),
          blurRadius: 8,
        ),
        BoxShadow(
          color: Color(0x0F000000),
          offset: Offset(0, 3),
          blurRadius: 1,
        ),
      ];

  @override
  double get trackHeight => 31;

  @override
  double get trackWidth => 51;

  // The thumb size at the middle of the track. Hand coded default based on the animation specs.
  @override
  Size get transitionalThumbSize => const Size(28, 28);

  // Hand coded default by comparing with [CupertinoSwitch].
  @override
  int get toggleDuration => 140;

  // Hand coded default based on the animation specs.
  @override
  double? get thumbOffset => null;
}

// Hand coded defaults based on Material Design 2.
class _SwitchConfigM2 with _SwitchConfig {
  _SwitchConfigM2();

  @override
  double get activeThumbRadius => 10;

  @override
  WidgetStateProperty<Color> get iconColor =>
      WidgetStateProperty.all<Color>(Colors.transparent);

  @override
  double get inactiveThumbRadius => 10;

  @override
  double get pressedThumbRadius => 10;

  @override
  double get switchHeight => _kSwitchMinSize + 8.0;

  @override
  double get switchHeightCollapsed => _kSwitchMinSize;

  @override
  double get switchWidth =>
      trackWidth - 2 * (trackHeight / 2.0) + _kSwitchMinSize;

  @override
  double get thumbRadiusWithIcon => 10;

  @override
  List<BoxShadow>? get thumbShadow => kElevationToShadow[1];

  @override
  double get trackHeight => 14;

  @override
  double get trackWidth => 33;

  @override
  double get thumbOffset => 0.5;

  @override
  Size get transitionalThumbSize => const Size(20, 20);

  @override
  int get toggleDuration => 200;
}

class _SwitchDefaultsM2 extends SwitchThemeData {
  _SwitchDefaultsM2(BuildContext context)
      : _theme = Theme.of(context),
        _colors = Theme.of(context).colorScheme;

  final ThemeData _theme;
  final ColorScheme _colors;

  @override
  WidgetStateProperty<Color> get thumbColor {
    final isDark = _theme.brightness == Brightness.dark;

    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return isDark ? Colors.grey.shade800 : Colors.grey.shade400;
      }
      if (states.contains(WidgetState.selected)) {
        return _colors.secondary;
      }
      return isDark ? Colors.grey.shade400 : Colors.grey.shade50;
    });
  }

  @override
  WidgetStateProperty<Color> get trackColor {
    final isDark = _theme.brightness == Brightness.dark;
    const black32 = Color(0x52000000); // Black with 32% opacity

    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return isDark ? Colors.white10 : Colors.black12;
      }
      if (states.contains(WidgetState.selected)) {
        final activeColor = _colors.secondary;
        return activeColor.withAlpha(0x80);
      }
      return isDark ? Colors.white30 : black32;
    });
  }

  @override
  WidgetStateProperty<Color?>? get trackOutlineColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  MaterialTapTargetSize get materialTapTargetSize =>
      _theme.materialTapTargetSize;

  @override
  WidgetStateProperty<MouseCursor> get mouseCursor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) =>
          WidgetStateMouseCursor.clickable.resolve(states),);

  @override
  WidgetStateProperty<Color?> get overlayColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return thumbColor.resolve(states).withAlpha(kRadialReactionAlpha);
      }
      if (states.contains(WidgetState.hovered)) {
        return _theme.hoverColor;
      }
      if (states.contains(WidgetState.focused)) {
        return _theme.focusColor;
      }
      return null;
    });
  }

  @override
  double get splashRadius => kRadialReactionRadius;
}

// BEGIN GENERATED TOKEN PROPERTIES - Switch

// Do not edit by hand. The code between the "BEGIN GENERATED" and
// "END GENERATED" comments are generated from data in the Material
// Design token database by the script:
//   dev/tools/gen_defaults/bin/gen_defaults.dart.

class _SwitchDefaultsM3 extends SwitchThemeData {
  _SwitchDefaultsM3(this.context);

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  WidgetStateProperty<Color> get thumbColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return _colors.surface.withOpacity(1);
        }
        return _colors.onSurface.withOpacity(0.38);
      }
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          return _colors.primaryContainer;
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.primaryContainer;
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.primaryContainer;
        }
        return _colors.onPrimary;
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.onSurfaceVariant;
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.onSurfaceVariant;
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.onSurfaceVariant;
      }
      return _colors.outline;
    });
  }

  @override
  WidgetStateProperty<Color> get trackColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return _colors.onSurface.withOpacity(0.12);
        }
        return _colors.surfaceContainerHighest.withOpacity(0.12);
      }
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          return _colors.primary;
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.primary;
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.primary;
        }
        return _colors.primary;
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.surfaceContainerHighest;
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.surfaceContainerHighest;
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.surfaceContainerHighest;
      }
      return _colors.surfaceContainerHighest;
    });
  }

  @override
  WidgetStateProperty<Color?> get trackOutlineColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.transparent;
      }
      if (states.contains(WidgetState.disabled)) {
        return _colors.onSurface.withOpacity(0.12);
      }
      return _colors.outline;
    });
  }

  @override
  WidgetStateProperty<Color?> get overlayColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          return _colors.primary.withOpacity(0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.primary.withOpacity(0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.primary.withOpacity(0.1);
        }
        return null;
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.onSurface.withOpacity(0.1);
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.onSurface.withOpacity(0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.onSurface.withOpacity(0.1);
      }
      return null;
    });
  }

  @override
  WidgetStateProperty<MouseCursor> get mouseCursor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) =>
        WidgetStateMouseCursor.clickable.resolve(states),);
  }

  @override
  WidgetStatePropertyAll<double> get trackOutlineWidth =>
      const WidgetStatePropertyAll<double>(2);

  @override
  double get splashRadius => 40.0 / 2;
}

class _SwitchConfigM3 with _SwitchConfig {
  _SwitchConfigM3(this.context) : _colors = Theme.of(context).colorScheme;

  BuildContext context;
  final ColorScheme _colors;

  static const double iconSize = 16;

  @override
  double get activeThumbRadius => 24.0 / 2;

  @override
  WidgetStateProperty<Color> get iconColor {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return _colors.onSurface.withOpacity(0.38);
        }
        return _colors.surfaceContainerHighest.withOpacity(0.38);
      }
      if (states.contains(WidgetState.selected)) {
        if (states.contains(WidgetState.pressed)) {
          return _colors.onPrimaryContainer;
        }
        if (states.contains(WidgetState.hovered)) {
          return _colors.onPrimaryContainer;
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.onPrimaryContainer;
        }
        return _colors.onPrimaryContainer;
      }
      if (states.contains(WidgetState.pressed)) {
        return _colors.surfaceContainerHighest;
      }
      if (states.contains(WidgetState.hovered)) {
        return _colors.surfaceContainerHighest;
      }
      if (states.contains(WidgetState.focused)) {
        return _colors.surfaceContainerHighest;
      }
      return _colors.surfaceContainerHighest;
    });
  }

  @override
  double get inactiveThumbRadius => 16.0 / 2;

  @override
  double get pressedThumbRadius => 28.0 / 2;

  @override
  double get switchHeight => _kSwitchMinSize + 8.0;

  @override
  double get switchHeightCollapsed => _kSwitchMinSize;

  @override
  double get switchWidth =>
      trackWidth - 2 * (trackHeight / 2.0) + _kSwitchMinSize;

  @override
  double get thumbRadiusWithIcon => 24.0 / 2;

  @override
  List<BoxShadow>? get thumbShadow => kElevationToShadow[0];

  @override
  double get trackHeight => 32;

  @override
  double get trackWidth => 52;

  // The thumb size at the middle of the track. Hand coded default based on the animation specs.
  @override
  Size get transitionalThumbSize => const Size(34, 22);

  // Hand coded default based on the animation specs.
  @override
  int get toggleDuration => 300;

  // Hand coded default based on the animation specs.
  @override
  double? get thumbOffset => null;
}

// END GENERATED TOKEN PROPERTIES - Switch
