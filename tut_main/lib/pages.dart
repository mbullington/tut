library tut.pages;

import "package:flutter/material.dart";

import "package:dartkit/dartkit.dart";
import "package:dartkit/collection.dart";
import "package:telefrag/telefrag.dart";

import "package:tut_spec/tut_spec.dart";

import "models.dart";
import "widgets.dart";

part "src/pages/util/scroll_view_glue.dart";

part "src/pages/page_definition.dart";

part "src/pages/items/my_tutor_request_item.dart";
part "src/pages/items/tutor_request_item.dart";
part "src/pages/items/conversation_item.dart";

part "src/pages/ask_help_page.dart";
part "src/pages/tutor_page.dart";
part "src/pages/messages_page.dart";

typedef Widget UniqueWidgetBuilder<T extends Unique>(BuildContext context, T spec);