import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bookdetailsforuser_model.dart';
export 'bookdetailsforuser_model.dart';

/// Reader view of one book: details, Buy and Favourite.
class BookdetailsforuserWidget extends StatefulWidget {
  const BookdetailsforuserWidget({
    super.key,
    int? bookId,
  }) : this.bookId = bookId ?? 0;

  final int bookId;

  static String routeName = 'bookdetailsforuser';
  static String routePath = '/bookdetailsforuser';

  @override
  State<BookdetailsforuserWidget> createState() =>
      _BookdetailsforuserWidgetState();
}

class _BookdetailsforuserWidgetState extends State<BookdetailsforuserWidget> {
  late BookdetailsforuserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookdetailsforuserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loadedDetailBook = await BooksTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.bookId,
        ),
      );
      _model.bookRows = _model.loadedDetailBook!.toList().cast<BooksRow>();
      safeSetState(() {});
      _model.loadedDetailFavs = await FavoritesTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      _model.favoriteRows =
          _model.loadedDetailFavs!.toList().cast<FavoritesRow>();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'ubyh490m' /* Book details */,
            ),
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
              crossAxisAlignment: (FFCrossAxisAlignment.stretch).flutterValue,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Builder(
                  builder: (context) {
                    final bookRow = _model.bookRows.toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: bookRow.length,
                      itemBuilder: (context, bookRowIndex) {
                        final bookRowItem = bookRow[bookRowIndex];
                        return Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment:
                                (FFMainAxisAlignment.start).flutterValue,
                            crossAxisAlignment:
                                (FFCrossAxisAlignment.stretch).flutterValue,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              if (((String? v) {
                                    return (v ?? '').isNotEmpty == true;
                                  }(bookRowItem.coverUrl)) ??
                                  true)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        Duration(milliseconds: 500),
                                    imageUrl: ((String? v) {
                                      return (v ?? '').toString().isEmpty
                                          ? ''
                                          : v.toString();
                                    }(bookRowItem.coverUrl)),
                                    width: double.infinity,
                                    height: 260.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              if (((String? v) {
                                    return (v ?? '').isNotEmpty == false;
                                  }(bookRowItem.coverUrl)) ??
                                  true)
                                Container(
                                  height: 260.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x1F1B4D3E),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Icon(
                                    Icons.menu_book,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 72.0,
                                  ),
                                ),
                              Text(
                                ((String? v) {
                                  return (v ?? '').toString().isEmpty
                                      ? 'Untitled'
                                      : v.toString();
                                }(bookRowItem.title)),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.playfairDisplay(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                ((String? v) {
                                  return (v ?? '').toString().isEmpty
                                      ? 'Unknown author'
                                      : v.toString();
                                }(bookRowItem.author)),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    (FFMainAxisAlignment.start).flutterValue,
                                crossAxisAlignment:
                                    (FFCrossAxisAlignment.center).flutterValue,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 12.0, 4.0),
                                      child: Text(
                                        ((String? v) {
                                          return (v ?? '').toString().isEmpty
                                              ? 'Uncategorized'
                                              : v.toString();
                                        }(bookRowItem.category)),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0x33C9A227),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        (FFMainAxisAlignment.start)
                                            .flutterValue,
                                    crossAxisAlignment:
                                        (FFCrossAxisAlignment.center)
                                            .flutterValue,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              (FFMainAxisAlignment.start)
                                                  .flutterValue,
                                          crossAxisAlignment:
                                              (FFCrossAxisAlignment.start)
                                                  .flutterValue,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'eumb7t3o' /* Price */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                            Text(
                                              ((double? p) {
                                                return '${(p ?? 0).toStringAsFixed(3)} DT';
                                              }(bookRowItem.price)),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .playfairDisplay(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 2.0)),
                                        ),
                                      ),
                                      Text(
                                        ((int? c) {
                                          return (c ?? 0) > 0
                                              ? '${c} in stock'
                                              : 'Sold out';
                                        }(bookRowItem.bookCount)),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 16.0,
                                      color: Color(0x12000000),
                                      offset: Offset(
                                        0.0,
                                        6.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        (FFMainAxisAlignment.start)
                                            .flutterValue,
                                    crossAxisAlignment:
                                        (FFCrossAxisAlignment.stretch)
                                            .flutterValue,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            (FFMainAxisAlignment.start)
                                                .flutterValue,
                                        crossAxisAlignment:
                                            (FFCrossAxisAlignment.center)
                                                .flutterValue,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0x1F1B4D3E),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.qr_code,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 22.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2fef7we0' /* ISBN */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            ((String? v) {
                                              return (v ?? '')
                                                      .toString()
                                                      .isEmpty
                                                  ? '—'
                                                  : v.toString();
                                            }(bookRowItem.isbn)),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                      Container(
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            (FFMainAxisAlignment.start)
                                                .flutterValue,
                                        crossAxisAlignment:
                                            (FFCrossAxisAlignment.center)
                                                .flutterValue,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0x1F1B4D3E),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Icon(
                                                Icons.calendar_today,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 22.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                't2guhei1' /* Publish year */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            ((int? v) {
                                              return (v ?? '')
                                                      .toString()
                                                      .isEmpty
                                                  ? '—'
                                                  : v.toString();
                                            }(bookRowItem.publishYear)),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '9awskrzo' /* Description */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                ((String? v) {
                                  return (v ?? '').toString().isEmpty
                                      ? 'No description available.'
                                      : v.toString();
                                }(bookRowItem.description)),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    (FFMainAxisAlignment.start).flutterValue,
                                crossAxisAlignment:
                                    (FFCrossAxisAlignment.center).flutterValue,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          (FFMainAxisAlignment.start)
                                              .flutterValue,
                                      crossAxisAlignment:
                                          (FFCrossAxisAlignment.stretch)
                                              .flutterValue,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        if ((((bookRowItem.bookCount ?? 0) >
                                                    0) ==
                                                true) ??
                                            true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Buy this book?'),
                                                            content: Text(
                                                                '\"${bookRowItem.title}\" for ${(double? p) {
                                                              return '${(p ?? 0).toStringAsFixed(3)} DT';
                                                            }(bookRowItem.price)}.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child:
                                                                    Text('Buy'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                _model.rows =
                                                    await BoughtBooksTable()
                                                        .insert({
                                                  'user_id': currentUserUid,
                                                  'book_id': bookRowItem.id,
                                                  'quantity': 1,
                                                  'price_paid':
                                                      bookRowItem.price ?? 0,
                                                });
                                                await BooksTable().update(
                                                  data: {
                                                    'book_count': (int? c) {
                                                      return (c ?? 0) > 0
                                                          ? (c ?? 0) - 1
                                                          : 0;
                                                    }(bookRowItem.bookCount),
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eqOrNull(
                                                    'id',
                                                    widget.bookId,
                                                  ),
                                                );
                                                _model.detailBookAfterBuy =
                                                    await BooksTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eqOrNull(
                                                    'id',
                                                    widget.bookId,
                                                  ),
                                                );
                                                _model.bookRows = _model
                                                    .detailBookAfterBuy!
                                                    .toList()
                                                    .cast<BooksRow>();
                                                safeSetState(() {});
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Book bought! See it in My purchases.',
                                                      style: TextStyle(),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'k3jvrlum' /* Buy */,
                                            ),
                                            icon: Icon(
                                              Icons.shopping_cart,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 52.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor: Colors.white,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                          ),
                                        if ((((bookRowItem.bookCount ?? 0) >
                                                    0) ==
                                                false) ??
                                            true)
                                          FFButtonWidget(
                                            onPressed:
                                                (((bookRowItem.bookCount ?? 0) >
                                                            0) ==
                                                        false)
                                                    ? null
                                                    : () {
                                                        print(
                                                            'UserBookDetailsSoldOutButton pressed ...');
                                                      },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'd05ydw1a' /* Sold out */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 52.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          (FFMainAxisAlignment.start)
                                              .flutterValue,
                                      crossAxisAlignment:
                                          (FFCrossAxisAlignment.stretch)
                                              .flutterValue,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        if (!((List<FavoritesRow>? r, int? id) {
                                          return (r ?? [])
                                              .any((f) => f.bookId == id);
                                        }(_model.favoriteRows.toList(),
                                            bookRowItem.id)))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.rows3 =
                                                  await FavoritesTable()
                                                      .insert({
                                                'user_id': currentUserUid,
                                                'book_id': bookRowItem.id,
                                              });
                                              _model.detailFavsAfterAdd =
                                                  await FavoritesTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'user_id',
                                                  currentUserUid,
                                                ),
                                              );
                                              _model.favoriteRows = _model
                                                  .detailFavsAfterAdd!
                                                  .toList()
                                                  .cast<FavoritesRow>();
                                              safeSetState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Added to favourites',
                                                    style: TextStyle(),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                ),
                                              );

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'nonfr628' /* Favourite */,
                                            ),
                                            icon: Icon(
                                              Icons.favorite_border,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 52.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              color: Colors.transparent,
                                              textStyle: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                          ),
                                        if (((List<FavoritesRow>? r, int? id) {
                                              return (r ?? [])
                                                  .any((f) => f.bookId == id);
                                            }(_model.favoriteRows.toList(),
                                                bookRowItem.id)) ??
                                            true)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await FavoritesTable().delete(
                                                matchingRows: (rows) => rows
                                                    .eqOrNull(
                                                      'user_id',
                                                      currentUserUid,
                                                    )
                                                    .eqOrNull(
                                                      'book_id',
                                                      bookRowItem.id,
                                                    ),
                                              );
                                              _model.detailFavsAfterRemove =
                                                  await FavoritesTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'user_id',
                                                  currentUserUid,
                                                ),
                                              );
                                              _model.favoriteRows = _model
                                                  .detailFavsAfterRemove!
                                                  .toList()
                                                  .cast<FavoritesRow>();
                                              safeSetState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Removed from favourites',
                                                    style: TextStyle(),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                ),
                                              );

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'k5aikuwe' /* Favourited */,
                                            ),
                                            icon: Icon(
                                              Icons.favorite,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 52.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor: Colors.white,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
