class @AceEditor
  constructor: (@el, @options = {}) ->
    @field = $("##{@el}")
    @options['theme'] ||= 'ace/theme/chrome'
    @options['mode'] ||= 'ace/mode/javascript'
    # @editor = ace.edit(@el)
    @initEditor()
    if @options['toolbar']?
      @initToolbar(@options['toolbar'])

  htmlEncode: (str) ->
    str.replace /[&<>"']/g, ($0) ->
      "&" + {"&":"amp", "<":"lt", ">":"gt", '"':"quot", "'":"#39"}[$0] + ";"

  initToolbar: (el) =>
    @toolbar = new FieldTagHandler(el, @editor)

  initEditor: () =>
    editor_el = $("""<div class="editor">#{@htmlEncode(@field.val())}</div>""")
    editor_el.css(height: @field.height())
    @field.hide()

    editor_el.insertAfter(@field)

    @editor = ace.edit(editor_el.get(0))
    @editor.setTheme(@options['theme'])
    @editor.getSession().setMode(@options['mode'])
    @editor.getSession().setTabSize(2)
    @editor.getSession().setUseSoftTabs(true)
    @editor.getSession().setUseWrapMode(true)
    @editor.renderer.setShowGutter(false)

    # @editor.setValue @field.val()
    @editor.clearSelection()
    @editor.on 'change', =>
      @field.val(@editor.getValue())
