import 'package:flutter/material.dart';
import 'package:projek_wisata/constants.dart';
import 'package:projek_wisata/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.text,
    this.press,
  });
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: TextStyle(fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
