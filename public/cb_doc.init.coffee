$ -> 
    
  CB.Doc.Navigation.assign_data_groups_nav1()
  CB.Doc.Navigation.assign_data_groups_nav2()  
  CB.Doc.Navigation.collapse_all()
  CB.Doc.Navigation.reset_icons()
  
  hljs.initHighlightingOnLoad();
  
  $('div.codesample a').click (e) =>
    e.preventDefault()
    $(this).tab('show')
    
  CB.Doc.CodeSamples.assign_all_example_groups()
  CB.Doc.CodeSamples.hide_all_panes()
  CB.Doc.CodeSamples.show_first_pane()
