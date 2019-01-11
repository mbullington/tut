library tut.widgets;

import "dart:async";
import "dart:math" as math;
import "dart:io" show HttpClient;
import "dart:typed_data";
import "dart:ui" as ui;

import "package:flutter/foundation.dart" show defaultTargetPlatform, consolidateHttpClientResponseBytes, SynchronousFuture;
import "package:flutter/material.dart" hide Card;
import "package:flutter/rendering.dart";

import "package:gradient_widgets/gradient_widgets.dart";
import "package:outline_material_icons/outline_material_icons.dart";

import "package:quiver/collection.dart";

import "package:sliver_glue/sliver_glue.dart";

import "package:dartkit/intl.dart";
import "package:dartkit/cache.dart";
import "package:dartkit/collection.dart";

import "package:telefrag/telefrag.dart";

import "package:tut_spec/tut_spec.dart";

import "models.dart";
import "theme.dart";

// Cards.
part "widgets/cards/card.dart";
part "widgets/cards/card_background.dart";
part "widgets/cards/my_tutor_request_card.dart";

// Pages.
part "widgets/pages/page.dart";
part "widgets/pages/my_requests_page.dart";
part "widgets/pages/account_page.dart";

// Header-related widgets.
part "widgets/header.dart";

// Card-related widgets.
part "widgets/mini_pill.dart";
part "widgets/avatar.dart";
part "widgets/tactile_dismissable.dart";

// Misc widgets.
part "widgets/bottom_navigation.dart";
part "widgets/faux_material.dart";
part "widgets/padded_text.dart";
part "widgets/expanded_align.dart";

// Utility widgets.
part "widgets/refresh_scroll_view.dart";
part "widgets/image_cache_provider.dart";
part "widgets/infinite_row_builder.dart";

// Physics for scroll views in the application.
const kPhysics = const AlwaysScrollableScrollPhysics(parent: const BouncingScrollPhysics());
