import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
              Text(
                'Images',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 0.0,
                    ),
              ),
              StreamBuilder<List<ImageRequestsRecord>>(
                stream: queryImageRequestsRecord(
                  queryBuilder: (imageRequestsRecord) =>
                      imageRequestsRecord.where(
                    'userid',
                    isEqualTo: currentUserUid,
                  ),
                  singleRecord: true,
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
                  List<ImageRequestsRecord> listViewImageRequestsRecordList =
                      snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final listViewImageRequestsRecord =
                      listViewImageRequestsRecordList.isNotEmpty
                          ? listViewImageRequestsRecordList.first
                          : null;
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
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
                              imageImageRequestsRecordList = snapshot.data!;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://oaidalleapiprodscus.blob.core.windows.net/private/org-3RGssTc35zPsTVJGoQvD6o0W/user-aiwuVJNF7jc153413uFCpCOL/img-hURHRQfWmRT2yKwQ6P0NgTkO.png?st=2024-05-03T18%3A37%3A54Z&se=2024-05-03T20%3A37%3A54Z&sp=r&sv=2021-08-06&sr=b&rscd=inline&rsct=image/png&skoid=6aaadede-4fb3-4698-a8f6-684d7786b067&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2024-05-02T23%3A42%3A32Z&ske=2024-05-03T23%3A42%3A32Z&sks=b&skv=2021-08-06&sig=XSQTrbOkaQBODNMmA9b24h5tHgpKfyiCgRqy0WrvNYM%3D',
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                      StreamBuilder<List<ImageRequestsRecord>>(
                        stream: queryImageRequestsRecord(
                          queryBuilder: (imageRequestsRecord) =>
                              imageRequestsRecord.where(
                            'userid',
                            isEqualTo: currentUserUid,
                          ),
                          limit: 10,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Image.network(
                              '',
                            );
                          }
                          List<ImageRequestsRecord>
                              carouselImageRequestsRecordList = snapshot.data!;
                          return SizedBox(
                            width: double.infinity,
                            height: 180.0,
                            child: CarouselSlider.builder(
                              itemCount: carouselImageRequestsRecordList.length,
                              itemBuilder: (context, carouselIndex, _) {
                                final carouselImageRequestsRecord =
                                    carouselImageRequestsRecordList[
                                        carouselIndex];
                                return StreamBuilder<List<ImageRequestsRecord>>(
                                  stream: queryImageRequestsRecord(
                                    queryBuilder: (imageRequestsRecord) =>
                                        imageRequestsRecord.where(
                                      'userid',
                                      isEqualTo: currentUserUid,
                                    ),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ImageRequestsRecord>
                                        imageImageRequestsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final imageImageRequestsRecord =
                                        imageImageRequestsRecordList.isNotEmpty
                                            ? imageImageRequestsRecordList.first
                                            : null;
                                    return Hero(
                                      tag: 'herotag',
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              const Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              const Duration(milliseconds: 500),
                                          imageUrl:
                                              'imageRequests.responseBody',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              carouselController: _model.carouselController ??=
                                  CarouselController(),
                              options: CarouselOptions(
                                initialPage: min(1,
                                    carouselImageRequestsRecordList.length - 1),
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
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
