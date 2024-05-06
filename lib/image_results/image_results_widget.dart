import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'image_results_model.dart';
export 'image_results_model.dart';

class ImageResultsWidget extends StatefulWidget {
  const ImageResultsWidget({super.key});

  @override
  State<ImageResultsWidget> createState() => _ImageResultsWidgetState();
}

class _ImageResultsWidgetState extends State<ImageResultsWidget> {
  late ImageResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageResultsModel());

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('createImage');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
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
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Hero(
                                tag: carouselImageRequestsRecord.responseURL,
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl:
                                        carouselImageRequestsRecord.responseURL,
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                carouselImageRequestsRecord.requestPrompt,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          );
                        },
                        carouselController: _model.carouselController ??=
                            CarouselController(),
                        options: CarouselOptions(
                          initialPage: min(
                              1, carouselImageRequestsRecordList.length - 1),
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
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: gridViewImageRequestsRecord.responseURL,
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
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
