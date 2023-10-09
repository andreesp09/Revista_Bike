import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class MagazineScreen extends ConsumerStatefulWidget {
  static const name = 'magazine-screen';
  const MagazineScreen({super.key});

  @override
  MagazineScreenState createState() => MagazineScreenState();
}

class MagazineScreenState extends ConsumerState<MagazineScreen> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final Magazine selectedMagazine = ref.watch(selectedMagazineProvider);
    return Scaffold(
      appBar: CustomAppBar(
          pWidth: maxSizePhone.maxWidth * 0.15,
          pHeight: maxSizePhone.maxHeight * 0.08,
          pIconSize: maxSizePhone.maxHeight * 0.04,
          pColor: theme.primary,
          pOnTap: context.pop),
      body: Stack(
        children: [
          SfPdfViewer.network(
            selectedMagazine.pathMagazine,
            onDocumentLoaded: (details) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading == true ? const CustomLoadingAnimated() : Container(),
        ],
      ),
    );
  }
}
