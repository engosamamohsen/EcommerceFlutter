import 'package:flutter/material.dart';
import 'dart:async';

class GlobalAppBarSearch extends StatefulWidget implements PreferredSizeWidget {
  final Function(String)? onChanged;

  const GlobalAppBarSearch({Key? key, this.onChanged}) : super(key: key);

  @override
  _GlobalAppBarSearchState createState() => _GlobalAppBarSearchState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _GlobalAppBarSearchState extends State<GlobalAppBarSearch> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if (widget.onChanged != null) {
        widget.onChanged!(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey[600]),
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                controller: _controller,
                onChanged: _onTextChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search in restart name",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
