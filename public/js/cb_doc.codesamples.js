// Generated by CoffeeScript 1.3.3
(function() {
  var CodeSamples, namespace,
    __slice = [].slice;

  CodeSamples = (function() {

    function CodeSamples() {}

    CodeSamples.assign_all_example_groups = function() {
      var _this = this;
      return $("div.code-example").each(function(i, element) {
        $(element).attr("example-group", i);
        CodeSamples.assign_example_group_subelements(i);
        CodeSamples.assign_button_tab_numbers(i);
        return CodeSamples.assign_button_clicks(i);
      });
    };

    CodeSamples.assign_example_group_subelements = function(example_group) {
      var _this = this;
      $("div.code-example[example-group=" + example_group + "] div").each(function(i, element) {
        return $(element).attr("example-group", example_group);
      });
      $("div.code-example[example-group=" + example_group + "] button").each(function(i, element) {
        return $(element).attr("example-group", example_group);
      });
      return $("div.code-example[example-group=" + example_group + "] pre").each(function(i, element) {
        return $(element).attr("example-group", example_group);
      });
    };

    CodeSamples.assign_button_tab_numbers = function(example_group) {
      var _this = this;
      $("div.code-example[example-group=" + example_group + "] div.code-example-buttons button").each(function(i, element) {
        return $(element).attr("button-tab", i);
      });
      return $("div.code-example[example-group=" + example_group + "] div.code-example-tabs div.tab-pane").each(function(i, element) {
        return $(element).attr("button-tab", i);
      });
    };

    CodeSamples.assign_button_clicks = function(example_group) {
      var _this = this;
      return $("div.code-example[example-group=" + example_group + "] div.code-example-buttons button").each(function(i, element) {
        return $(element).click(function() {
          var tab_number;
          tab_number = parseInt($(element).attr("button-tab"));
          example_group = parseInt($(element).attr("example-group"));
          console.log("Click! example-group: " + example_group + " button-click: " + tab_number);
          CodeSamples.hide_all_panes(example_group);
          CodeSamples.deactivate_all_buttons(example_group);
          $("div.code-example-buttons[example-group=" + example_group + "] button[button-tab=" + tab_number + "]").addClass("active");
          return $("div.code-example-tabs[example-group=" + example_group + "] div.tab-pane[button-tab=" + tab_number + "]").show();
        });
      });
    };

    CodeSamples.deactivate_all_buttons = function(example_group) {
      var _this = this;
      if (example_group == null) {
        example_group = -1;
      }
      if (example_group === -1) {
        return $("div.code-example-buttons button").each(function(i, element) {
          return $(element).removeClass("active");
        });
      } else {
        return $("div.code-example-buttons[example-group=" + example_group + "] button").each(function(i, element) {
          return $(element).removeClass("active");
        });
      }
    };

    CodeSamples.hide_all_panes = function(example_group) {
      var _this = this;
      if (example_group == null) {
        example_group = -1;
      }
      if (example_group === -1) {
        console.log("hide all panes");
        return $("div.code-example-tabs div.tab-pane").each(function(i, element) {
          return $(element).hide();
        });
      } else {
        console.log("hide panes for example_group:" + example_group);
        return $("div.code-example-tabs[example-group=" + example_group + "] div.tab-pane").each(function(i, element) {
          console.log($(element));
          return $(element).hide();
        });
      }
    };

    CodeSamples.show_first_pane = function() {
      var _this = this;
      return $("div.code-example").each(function(i, element) {
        $(element).find("button").first().addClass("active");
        return $(element).find("div.tab-pane").first().show();
      });
    };

    return CodeSamples;

  })();

  namespace = function(target, name, block) {
    var item, top, _i, _len, _ref, _ref1;
    if (arguments.length < 3) {
      _ref = [(typeof exports !== 'undefined' ? exports : window)].concat(__slice.call(arguments)), target = _ref[0], name = _ref[1], block = _ref[2];
    }
    top = target;
    _ref1 = name.split('.');
    for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
      item = _ref1[_i];
      target = target[item] || (target[item] = {});
    }
    return block(target, top);
  };

  namespace("CB.Doc", function(exports) {
    return exports.CodeSamples = CodeSamples;
  });

}).call(this);
