class BuchheimWalkerConfiguration {
  int siblingSeparation = defaultSiblingSeperation;
  int levelSeparation = defaultLevelSeperation;
  int subtreeSeparation = defaultSubtreeSeperation;
  int orientation = defaultOrientation;
  static const orientationTopBottom = 1;
  static const orientationBottomTop = 2;
  static const orientationLeftRight = 3;
  static const orientationRightLeft = 4;
  static const defaultSiblingSeperation = 100;
  static const defaultSubtreeSeperation = 100;
  static const defaultLevelSeperation = 100;
  static const defaultOrientation = 1;

  int getSiblingSeparation() {
    return siblingSeparation;
  }

  int getLevelSeparation() {
    return levelSeparation;
  }

  int getSubtreeSeparation() {
    return subtreeSeparation;
  }
}
