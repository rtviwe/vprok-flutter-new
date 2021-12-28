import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:perek_main/base/data/api/block/screen.dart';
import 'package:perek_main/base/data/api/block/screen_block_item.dart';
import 'package:perek_main/base/ui/theme/provider.dart';
import 'package:perek_main/base/ui/widget/toolbar.dart';
import 'package:perek_main/feature/main/ui/state.dart';

class MainContentScreen extends StatelessWidget {
  const MainContentScreen(this.contentState, {Key? key}) : super(key: key);

  final ContentState contentState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (_, __) => [const MainSliverAppBar()],
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: contentState.screenItemRemote.sections.items.length,
          itemBuilder: (_, index) => BlockCard(contentState.screenItemRemote.sections.items[index]),
        ),
      ),
    );
  }
}

class MainSliverAppBar extends HookConsumerWidget {
  const MainSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverSafeArea(
        top: false,
        sliver: SliverAppBar(
          backgroundColor: theme.surfaceVariant,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          title: const ToolbarAddress(),
          pinned: true,
          floating: true,
          snap: true,
          forceElevated: true,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: ToolbarSearch(),
          ),
        ),
      ),
    );
  }
}

class BlockCard extends HookConsumerWidget {
  const BlockCard(this.block, {Key? key}) : super(key: key);

  final ScreenBlockRemote block;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                block.title ?? '',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Spacer(),
              Text(
                block.type == ScreenBlockTypes.products ? 'Все' : '',
                style: Theme.of(context).textTheme.button?.copyWith(color: theme.primary),
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: block.type == ScreenBlockTypes.buttons
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  for (final item in block.elements?.items ?? <ScreenBlockItemRemote>[])
                    item.map(
                      button: (button) => ButtonCard(button),
                      products: (product) => ProductCard(product),
                      // TODO(Sergey): https://github.com/rtviwe/vprok-flutter/issues/6
                      banner: (banner) => const SizedBox.shrink(),
                      // TODO(Sergey): https://github.com/rtviwe/vprok-flutter/issues/9
                      corner: (corner) => const SizedBox.shrink(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BannerCard extends StatelessWidget {
  const BannerCard(this.banner, {Key? key}) : super(key: key);

  final BannerRemote banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 200,
          child: CachedNetworkImage(
            imageUrl: banner.image,
          ),
        ),
      ),
    );
  }
}

class CornerCard extends HookConsumerWidget {
  const CornerCard(this.corner, {Key? key}) : super(key: key);

  final CornerRemote corner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Padding(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        width: 100,
        child: Card(
          color: theme.onSurfaceMain,
          elevation: 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const SizedBox(
                    width: double.infinity,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonCard extends HookConsumerWidget {
  const ButtonCard(this.button, {Key? key}) : super(key: key);

  final ButtonRemote button;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthOfCard = (MediaQuery.of(context).size.width - 48) / 3;
    final theme = ref.watch(themeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.surfaceBackground,
          borderRadius: BorderRadius.circular(8),
          boxShadow: theme.boxShadow,
        ),
        width: widthOfCard,
        height: 72,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: SvgPicture.asset(
                button.asset,
                width: 24,
                height: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
              child: Text(
                button.title,
                textAlign: TextAlign.center,
                style: theme.data.textTheme.caption?.copyWith(color: theme.onSurfaceMediumEmphasis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension GetAssetByType on ButtonRemote {
  String get asset {
    switch (type) {
      case 'catalog':
        return 'assets/icons/ic_catalog_button.svg';
      case 'address':
        return 'assets/icons/ic_address.svg';
      case 'registration':
        return 'assets/icons/ic_login.svg';
      default:
        return 'Bro, there is no type like that';
    }
  }
}

class ProductCard extends HookConsumerWidget {
  const ProductCard(this.product, {Key? key}) : super(key: key);

  final ProductsRemote product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.surfaceBackground,
          borderRadius: BorderRadius.circular(8),
          boxShadow: theme.boxShadow,
        ),
        width: 104,
        height: 176,
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: SizedBox(
                    width: 88,
                    height: 77,
                    child: CachedNetworkImage(
                      imageUrl: product.image ?? '',
                      placeholder: (context, url) => SvgPicture.asset(
                        'assets/icons/ic_placeholder.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.none,
                      ),
                      errorWidget: (context, url, dynamic error) => SvgPicture.asset(
                        'assets/icons/ic_placeholder.svg',
                        width: 24,
                        height: 24,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
                if (product.brightLabelRemote != null)
                  Container(
                    decoration: BoxDecoration(
                      color: theme.promoted,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        product.brightLabelRemote?.title ?? '',
                        style: theme.data.textTheme.overline?.copyWith(color: theme.surfaceAccent),
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 76, 32, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: product.discount != null
                          ? Container(
                              decoration: BoxDecoration(
                                color: theme.accented,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1),
                                child: Text(
                                  '-${product.discount.toString()}%',
                                  style: theme.data.textTheme.overline?.copyWith(color: theme.onSurfaceAccent),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: product.oldPrice != null
                  ? Text(
                      '${product.oldPrice.toString()} ₽',
                      style: theme.data.textTheme.overline?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: theme.onSurfaceDisabled,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Center(
              child: product.discount != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Text(
                        '${product.price.toString()} ₽',
                        style: theme.data.textTheme.subtitle2?.copyWith(color: theme.primary),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: Text(
                        '${product.price.toString()} ₽',
                        style: theme.data.textTheme.subtitle2?.copyWith(color: theme.onSurfaceHighEmphasis),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Divider(
                height: 1,
                color: theme.surfaceNative,
              ),
            ),
            BuyButton(product),
          ],
        ),
      ),
    );
  }
}

class BuyButton extends HookConsumerWidget {
  BuyButton(this.product, {Key? key}) : super(key: key);

  final ProductsRemote product;

  final _show = useState(false);
  final _isInCart = useState(false);

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    var start = 2;

    _show.value = true;

    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          _show.value = false;
          _isInCart.value = true;
          timer.cancel();
        } else {
          start--;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Stack(
      children: [
        GestureDetector(
          onTap: _startTimer,
          child: Container(
            height: 34,
            width: 104,
            decoration: BoxDecoration(
              color: theme.surfaceBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/ic_cart.svg',
                width: 24,
                height: 24,
                color: theme.primary,
              ),
            ),
          ),
        ),
        if (_isInCart.value)
          Container(
            width: 104,
            height: 37,
            decoration: BoxDecoration(
              color: theme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${product.fraction} ${product.fractionTextRound}',
                  style: theme.data.textTheme.bodyText2?.copyWith(color: theme.surfaceAccent),
                ),
                SvgPicture.asset(
                  'assets/icons/ic_cart.svg',
                  width: 24,
                  height: 24,
                  color: theme.surfaceAccent,
                ),
              ],
            ),
          )
        else
          const SizedBox.shrink(),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          bottom: _show.value ? 0 : -104,
          child: Container(
            width: 104,
            height: 37,
            decoration: BoxDecoration(
              color: theme.surfaceBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_minus.svg',
                    width: 24,
                    height: 24,
                    color: theme.onSurfaceDisabled,
                  ),
                  Text(
                    '${product.fraction} ${product.fractionTextRound}',
                    style: theme.data.textTheme.bodyText2?.copyWith(color: theme.onSurfaceHighEmphasis),
                  ),
                  SvgPicture.asset(
                    'assets/icons/ic_plus.svg',
                    width: 24,
                    height: 24,
                    color: theme.onSurfaceDisabled,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
