import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: const [],
              ),
              StreamBuilder<List<ImageRequestsRecord>>(
                stream: queryImageRequestsRecord(
                  queryBuilder: (imageRequestsRecord) =>
                      imageRequestsRecord.where(
                    'userid',
                    isEqualTo: currentUserUid,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Image.network(
                      '',
                    );
                  }
                  List<ImageRequestsRecord> carouselImageRequestsRecordList =
                      snapshot.data!;
                  return SizedBox(
                    width: double.infinity,
                    height: 180.0,
                    child: CarouselSlider.builder(
                      itemCount: carouselImageRequestsRecordList.length,
                      itemBuilder: (context, carouselIndex, _) {
                        final carouselImageRequestsRecord =
                            carouselImageRequestsRecordList[carouselIndex];
                        return Hero(
                          tag: carouselImageRequestsRecord.responseURL,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration: const Duration(milliseconds: 500),
                              imageUrl: carouselImageRequestsRecord.responseURL,
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      carouselController: _model.carouselController ??=
                          CarouselController(),
                      options: CarouselOptions(
                        initialPage:
                            min(1, carouselImageRequestsRecordList.length - 1),
                        viewportFraction: 0.5,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.25,
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                        onPageChanged: (index, _) =>
                            _model.carouselCurrentIndex = index,
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                child: StreamBuilder<List<ImageRequestsRecord>>(
                  stream: queryImageRequestsRecord(
                    queryBuilder: (imageRequestsRecord) =>
                        imageRequestsRecord.where(
                      'userid',
                      isEqualTo: currentUserUid,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ImageRequestsRecord>
                        swipeableStackImageRequestsRecordList = snapshot.data!;
                    return FlutterFlowSwipeableStack(
                      onSwipeFn: (index) {},
                      onLeftSwipe: (index) {},
                      onRightSwipe: (index) {},
                      onUpSwipe: (index) {},
                      onDownSwipe: (index) {},
                      itemBuilder: (context, swipeableStackIndex) {
                        final swipeableStackImageRequestsRecord =
                            swipeableStackImageRequestsRecordList[
                                swipeableStackIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl: swipeableStackImageRequestsRecord
                                        .responseURL,
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: swipeableStackImageRequestsRecord
                                      .responseURL,
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: swipeableStackImageRequestsRecord.responseURL,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: swipeableStackImageRequestsRecord
                                    .responseURL,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: swipeableStackImageRequestsRecordList.length,
                      controller: _model.swipeableStackController,
                      loop: false,
                      cardDisplayCount: 3,
                      scale: 0.9,
                    );
                  },
                ),
              ),
              Expanded(
                child: StreamBuilder<List<ImageRequestsRecord>>(
                  stream: queryImageRequestsRecord(
                    queryBuilder: (imageRequestsRecord) =>
                        imageRequestsRecord.where(
                      'userid',
                      isEqualTo: currentUserUid,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<ImageRequestsRecord> gridViewImageRequestsRecordList =
                        snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: gridViewImageRequestsRecordList.length,
                      itemBuilder: (context, gridViewIndex) {
                        final gridViewImageRequestsRecord =
                            gridViewImageRequestsRecordList[gridViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await actions.downloadFile(
                              gridViewImageRequestsRecord.responseBody,
                              gridViewImageRequestsRecord.requestJSON,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              gridViewImageRequestsRecord.responseURL,
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
