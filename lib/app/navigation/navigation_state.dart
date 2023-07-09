class NavigationState {
  final bool? _unknown;
  final bool? _add;
  String? selectedTaskId;

  bool get isAdd => _add == true;

  bool get isDetailsScreen => selectedTaskId != null;

  bool get isRoot => !isAdd && !isDetailsScreen && !isUnknown;

  bool get isUnknown => _unknown == true;

  NavigationState.root()
      : _add = false,
        _unknown = false,
        selectedTaskId = null;

  NavigationState.add()
      : _add = true,
        _unknown = false,
        selectedTaskId = null;

  NavigationState.item(this.selectedTaskId)
      : _add = false,
        _unknown = false;

  NavigationState.unknown()
      : _unknown = true,
        _add = false,
        selectedTaskId = null;
}
