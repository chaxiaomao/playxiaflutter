import 'package:flutter/material.dart';

enum BottomNavigationBadgeShape {
  circle,
  square,
  rounded_corner,
}

enum BottomNavigationBadgePosition {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

class BottomNavigationBadge {
  Color? backgroundColor;
  Color? textColor;
  BottomNavigationBadgeShape? badgeShape;
  double? textSize;
  BottomNavigationBadgePosition? position;

  BorderRadius? _radius;
  AlignmentDirectional? alignment;

  BottomNavigationBadge({this.backgroundColor, this.textColor, this.badgeShape, this.position, this.textSize});

  BorderRadius? setBorder() {
    if (badgeShape == BottomNavigationBadgeShape.circle) {
      _radius = BorderRadius.circular(12);
    } else if (badgeShape == BottomNavigationBadgeShape.square) {
      _radius = BorderRadius.zero;
    } else if (badgeShape == BottomNavigationBadgeShape.rounded_corner) {
      _radius = BorderRadius.circular(4);
    }
    return _radius;
  }

  setPosition() {
    if (position == BottomNavigationBadgePosition.topLeft) {
      alignment = AlignmentDirectional.topStart;
    } else if (position == BottomNavigationBadgePosition.topCenter) {
      alignment = AlignmentDirectional.topCenter;
    } else if (position == BottomNavigationBadgePosition.topRight) {
      alignment = AlignmentDirectional.topEnd;
    } else if (position == BottomNavigationBadgePosition.centerLeft) {
      alignment = AlignmentDirectional.centerStart;
    } else if (position == BottomNavigationBadgePosition.center) {
      alignment = AlignmentDirectional.center;
    } else if (position == BottomNavigationBadgePosition.centerRight) {
      alignment = AlignmentDirectional.centerEnd;
    } else if (position == BottomNavigationBadgePosition.bottomLeft) {
      alignment = AlignmentDirectional.bottomStart;
    } else if (position == BottomNavigationBadgePosition.bottomCenter) {
      alignment = AlignmentDirectional.bottomCenter;
    } else if (position == BottomNavigationBadgePosition.bottomRight) {
      alignment = AlignmentDirectional.bottomEnd;
    }
    return alignment;
  }

  setBadge(List items, String? content, int index) {
    Widget badge = content == null
        ? Container()
        : Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.red,
              borderRadius: setBorder(),
            ),
            constraints: const BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Center(
              child: Text(
                content,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: textSize ?? 8,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
            ),
          );
    BottomNavigationBarItem _replacer = BottomNavigationBarItem(
        icon: Stack(
          alignment: setPosition(),
          children: <Widget>[
            SizedBox(
              child: items[index].icon,
              height: 24,
              width: 36,
            ),
            badge
          ],
          // overflow: Overflow.visible,
        ),
        label: items[index].label,
        activeIcon: Stack(
          alignment: setPosition(),
          children: <Widget>[
            SizedBox(
              child: items[index].activeIcon ?? items[index].icon,
              height: 24,
              width: 36,
            ),
            badge
          ],
        ),
        backgroundColor: items[index].backgroundColor
    );
    items.removeAt(index);
    items.insert(index, _replacer);
    return items;
  }

  List removeBadge(List items, int index) {
    if (items[index].icon is Stack) {
      BottomNavigationBarItem _replacer = BottomNavigationBarItem(
          icon: items[index].icon.children[0].child,
          label: items[index].label,
          activeIcon: items[index].activeIcon.children[0].child,
          backgroundColor: items[index].backgroundColor);
      items.removeAt(index);
      items.insert(index, _replacer);
    }
    return items;
  }

  List removeAll(List items) {
    for (var i = 0; i < items.length; i++) {
      if (items[i].icon is Stack) {
        BottomNavigationBarItem _replacer = BottomNavigationBarItem(
            icon: items[i].icon.children[0],
            label: items[i].label,
            activeIcon: items[i].activeIcon.children[0],
            backgroundColor: items[i].backgroundColor);
        items.removeAt(i);
        items.insert(i, _replacer);
      }
    }
    return items;
  }
}
