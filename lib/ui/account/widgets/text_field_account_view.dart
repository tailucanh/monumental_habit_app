import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monumental_habit_app/services/app_colors.dart';
import 'package:monumental_habit_app/services/app_helpers.dart';
import 'package:monumental_habit_app/services/app_language_constants.dart';

class TextFieldAccountView extends StatelessWidget {
  final IconData icon;
  final String? hint;
  final Color? colorBackground;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;

  const TextFieldAccountView({
    super.key,
    required this.icon,
    this.hint,
    this.colorBackground,
    required this.controller,
    required this.focusNode,
    required this.isPassword,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return  TextFieldAccountViewChild(icon: icon,hint: hint,colorBackground: colorBackground, controller:controller,
      focusNode: focusNode, isPassword: isPassword, onChanged: onChanged,);
  }
}

class TextFieldAccountViewChild extends StatefulWidget {
  final IconData icon;
  final String? hint;
  final bool isPassword;
  final Color? colorBackground;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;

  const TextFieldAccountViewChild({
    super.key,
    required this.icon,
    this.hint,
    this.colorBackground,
    required this.controller,
    required this.focusNode,
    required this.isPassword,
    required this.onChanged,
  });
  @override
  State<TextFieldAccountViewChild> createState() => _TextFieldAccountViewChildState();
}

class _TextFieldAccountViewChildState extends State<TextFieldAccountViewChild> {
  bool _isChangeText = false;
  bool _isShowPass = true;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!widget.focusNode.hasFocus) {
      setState(() {
        if(AppHelpers.isStringNotEmpty(widget.controller.text)){
          _isChangeText = true;
        }else {
          _isChangeText = false;
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppHelpers.getSizeWithDevice(context),
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: widget.colorBackground ?? AppColors.color_bg_text_field,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: FaIcon(
                widget.icon,
                size: 25,
                color: _isChangeText
                    ? AppColors.color_text_field
                    : AppColors.color_text_field_hint,
              ),
            ),
            const SizedBox(
              height: 65,
              width: 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.gradient_home,
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                onChanged: widget.onChanged,
                onSubmitted: (value){
                  setState(() {
                       if(AppHelpers.isStringNotEmpty(value)){
                         _isChangeText = true;
                       }else {
                         _isChangeText = false;
                       }
                  });
                },
                onTap: (){
                  setState(() {
                    _isChangeText = true;
                  });
                },
                obscureText: widget.isPassword ? _isShowPass : false,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.rick_text_orange,
                showCursor: true,
                style: const TextStyle(
                    color: AppColors.color_text_field,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: AppHelpers.POPPINS_FONT),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle:const TextStyle(
                      color: AppColors.color_text_field_hint,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppHelpers.POPPINS_FONT),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0)),
                ),
              ),
            )),
            widget.isPassword
                ? InkWell(
                    onTap: () => {
                      setState(() {
                        _isShowPass = !_isShowPass;
                      }),
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 15, top: 8, bottom: 8),
                      child: Text(
                        translation(context).text_show_pass,
                        style: (const TextStyle(
                            color: AppColors.color_text_field_hint,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontFamily: AppHelpers.POPPINS_FONT)),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
