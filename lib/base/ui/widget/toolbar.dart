import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/base/ui/theme/provider.dart';

class ToolbarAddress extends HookConsumerWidget {
  const ToolbarAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/ic_point.svg',
          width: 24,
          height: 24,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Укажите адрес доставки',
                style: Theme.of(context).textTheme.button,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Чтобы видеть актуальные цены',
                  style: Theme.of(context).textTheme.button?.copyWith(color: theme.onSurfaceDisabled),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 32,
          width: 32,
          child: Container(
            decoration: BoxDecoration(
              color: theme.surfaceNative,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/icons/ic_forward.svg',
              width: 24,
              height: 24,
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}

class ToolbarSearch extends HookConsumerWidget {
  const ToolbarSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: 44,
          decoration: BoxDecoration(color: theme.surfaceNative),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/ic_magnifier.svg',
                width: 24,
                height: 24,
                fit: BoxFit.none,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  'Искать в гипермаркете',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(color: theme.onSurfaceMediumEmphasis),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
