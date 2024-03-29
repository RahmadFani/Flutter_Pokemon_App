import 'dart:math';

import 'package:esensi_solusi_buana_test/helpers/extension.dart';
import 'package:esensi_solusi_buana_test/helpers/theme.dart';
import 'package:esensi_solusi_buana_test/modules/favorites/bloc/favorites_bloc.dart';
import 'package:esensi_solusi_buana_test/modules/favorites/models/favorite.dart';
import 'package:esensi_solusi_buana_test/modules/generation_detail/models/generation_detail.dart';
import 'package:esensi_solusi_buana_test/modules/pokemon_detail/bloc/pokemon_detail_cubit.dart';
import 'package:esensi_solusi_buana_test/modules/pokemon_detail/models/pokemon_detail.dart';
import 'package:esensi_solusi_buana_test/widgets/app_bar/app_bar_transparant.dart';
import 'package:esensi_solusi_buana_test/widgets/background/background_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'view/pokemon_detail_page.dart';
part 'widgets/_pokemon_card.dart';
part 'widgets/_card_tab.dart';
