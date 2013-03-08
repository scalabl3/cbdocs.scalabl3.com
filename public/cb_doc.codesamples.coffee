class CodeSamples
    
  constructor: () ->
  
  @assign_all_example_groups: () ->
    $("div.code-example").each (i, element) =>

      # Assign a Data Group # to Nav1 elements
      $(element).attr("example-group", i);
      
      CodeSamples.assign_example_group_subelements(i);
      CodeSamples.assign_button_tab_numbers(i);
      CodeSamples.assign_button_clicks(i);

      
  @assign_example_group_subelements: (example_group) ->

    # Assign Example Group Number to all divs underneath
    $("div.code-example[example-group=" + example_group + "] div").each (i, element) =>
      $(element).attr("example-group", example_group);
    
    # Assign Example Group Number to all buttons underneath  
    $("div.code-example[example-group=" + example_group + "] button").each (i, element) =>
      $(element).attr("example-group", example_group);
      
    # Assign Example Group Number to all pre underneath  
    $("div.code-example[example-group=" + example_group + "] pre").each (i, element) =>
      $(element).attr("example-group", example_group);


      
  @assign_button_tab_numbers: (example_group) ->    
    $("div.code-example[example-group=" + example_group + "] div.code-example-buttons button").each (i, element) =>
      $(element).attr("button-tab", i);
      
    $("div.code-example[example-group=" + example_group + "] div.code-example-tabs div.tab-pane").each (i, element) =>
      $(element).attr("button-tab", i);


  @assign_button_clicks: (example_group) ->
    $("div.code-example[example-group=" + example_group + "] div.code-example-buttons button").each (i, element) =>
      $(element).click ->
        tab_number = parseInt $(element).attr("button-tab")
        example_group = parseInt $(element).attr("example-group")
        console.log("Click! example-group: " + example_group + " button-click: " + tab_number);
        CodeSamples.hide_all_panes(example_group)
        CodeSamples.deactivate_all_buttons(example_group)
        $("div.code-example-buttons[example-group=" + example_group + "] button[button-tab=" + tab_number + "]").addClass("active")
        $("div.code-example-tabs[example-group=" + example_group + "] div.tab-pane[button-tab=" + tab_number + "]").show()


        
  @deactivate_all_buttons: (example_group = -1) ->
    if example_group is -1
      $("div.code-example-buttons button").each (i, element) =>
        $(element).removeClass("active")
    else
      $("div.code-example-buttons[example-group=" + example_group + "] button").each (i, element) =>
        $(element).removeClass("active")




  @hide_all_panes: (example_group = -1) ->    
    if example_group is -1
      console.log("hide all panes")
      $("div.code-example-tabs div.tab-pane").each (i, element) =>
        $(element).hide();
    else
      console.log("hide panes for example_group:" + example_group)
      $("div.code-example-tabs[example-group=" + example_group + "] div.tab-pane").each (i, element) =>
        console.log($(element))
        $(element).hide();
      
      
  
  @show_first_pane: () ->
    $("div.code-example").each (i, element) =>
      $(element).find("button").first().addClass("active")
      $(element).find("div.tab-pane").first().show()

#
# Namespace the Class under CB.Doc, first define a namespace function, then export the namespace
#

namespace = (target, name, block) ->
  [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top

namespace "CB.Doc", (exports) ->
  exports.CodeSamples = CodeSamples

  
  
