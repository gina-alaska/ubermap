class @FieldTagHandler
  constructor: (@editor) ->
    $(document).on('click', '[data-behavior="editor-action"]', @actionHandler)

  actionHandler: (e) =>
    console.log 'foo'
    e.preventDefault()
    target = $(e.target)
    switch target.data('action')
      when 'insert'
        @editor.insert(target.data('content'))
