class Navigation 
  _icon_collapsed_class = "icon-chevron-right"
  _icon_expanded_class = "icon-chevron-down"
  _single_node_expanded = true
    
  constructor: () ->
  
  @assign_data_groups_nav1: () ->
    $("#nav li.nav1").each (i, element) =>

      # Assign a Data Group # to Nav1 elements
      $(element).attr("data-group", i);

      # Assign an ID to the icon using Data Group
      icon_id = "nav-icon-" + i

      # Append Icon to Nav1 elements
      $(element).append('<i id="' + icon_id + '" class="pull-right ' + _icon_collapsed_class + ' icon-white"></i>')
      
      # Create Click event for Expand/Contract
      $(element).click ->
        icon = $(@).children("i").first()
        group = $(@).attr("data-group")
        if (icon.hasClass(_icon_collapsed_class))
          Navigation.expand_group(group)
        else
          Navigation.collapse_group(group)
          

  @assign_data_groups_nav2: () ->
    $("#nav li").each (i, element) =>
      @data_group = $(element).attr("data-group") if $(element).hasClass("nav1")
      $(element).attr("data-group", @data_group)
    
  @collapse_all: () ->
    Navigation.reset_icons()
    $('#nav ul li.nav2').each (i,element) => 
      $(element).hide()
    
  @reset_icons: () ->
    $('#nav ul li.nav1 i').each (i, element) => 
      $(element).removeClass(_icon_expanded_class).addClass(_icon_collapsed_class)
  
  @expand_group: (group) ->
    console.log('expand group ' + group)

    # If we have set to single main Nav1 expanded at a time
    if _single_node_expanded
      Navigation.collapse_all()
    
    # Swap Icons from Collapsed to Expanded
    $("#nav .nav1[data-group=" + group + "] i").removeClass(_icon_collapsed_class).addClass(_icon_expanded_class)
    
    # Show all Nav2 elements in the data-group
    $("#nav .nav2[data-group=" + group + "]").each (i, element) =>      
      $(element).show()

  @collapse_group: (group) ->
    console.log('collapse group ' + group)
    
    # Swap Icons from Expanded to Collapsed 
    $("#nav .nav1[data-group=" + group + "] i").removeClass(_icon_expanded_class).addClass(_icon_collapsed_class)
    
    # Hide all Nav2 elements in the data-group
    $("#nav .nav2[data-group=" + group + "]").each (i, element) =>      
      $(element).hide()


#
# Namespace the Class under CB.Doc, first define a namespace function, then export the namespace
#

namespace = (target, name, block) ->
  [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top

namespace "CB.Doc", (exports) ->
  exports.Navigation = Navigation

  
  
  