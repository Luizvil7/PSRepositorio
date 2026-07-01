import 'package:flutter/material.dart';
import 'package:evolvo/theme/app_cores.dart';


// Customização do input de texto para login/cadastro do app
InputDecoration appInputDecoracao() {
  return InputDecoration(
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white.withOpacity(.12),
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppCores.roxo,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}