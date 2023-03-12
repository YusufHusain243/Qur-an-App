import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';

class Appbar extends StatefulWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  bool isSearch = false;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMagrin),
      child: isSearch == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleAppbar(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  child: Icon(
                    Icons.search,
                    color: secondary,
                  ),
                )
              ],
            )
          : search(),
    );
  }

  Widget search() {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: searchController,
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          hintText: 'Search...',
          hintStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isSearch = false;
              });
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: secondary,
        ),
      ),
    );
  }

  Text titleAppbar() {
    return const Text(
      'Qur`an App',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: Colors.white,
      ),
    );
  }
}
