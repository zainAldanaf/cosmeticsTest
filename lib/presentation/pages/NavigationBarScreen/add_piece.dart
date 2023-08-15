
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/AppText.dart';
import '../../../core/custom/CustomAppBar.dart';

class AddPiece extends StatefulWidget{
  @override
  State<AddPiece> createState() => _AddPieceState();
}

class _AddPieceState extends State<AddPiece> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(AppText.addPiece),

    );
  }
}
