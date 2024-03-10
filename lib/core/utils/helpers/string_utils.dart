extension StringExtension on String {
  String capitalizeWord({String regex = " "}) {
    return split(regex)
        .map((word) => word.isEmpty
            ? word
            : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(" ");
  }
}

extension ListExtension on List<dynamic>? {
  bool isNullOrEmpty() {
    return this == null || this!.length == 0 || this!.isEmpty;
  }
}

extension StringNullExtension on String? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  bool isNotNullAndEmpty() {
    return this != null && this!.isNotEmpty;
  }

  String orEmpty() {
    return this ?? "";
  }

  String? sendNullIfEmpty() {
    return isNullOrEmpty() ? null : this;
  }
}

extension IntNullExtension on int? {
  int orZero() {
    return this ?? 0;
  }
}
