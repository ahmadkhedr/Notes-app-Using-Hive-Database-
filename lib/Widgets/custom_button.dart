import 'package:flutter/material.dart';
import 'package:notes_app_hive/constants.dart';

class CutomButton extends StatelessWidget {
  const CutomButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55.0,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    "Add",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  )),
      ),
    );
  }
}
