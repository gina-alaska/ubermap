class @FieldTagHandler
  constructor: (el, @editor) ->
    $(document).on('click', "#{el} [data-behavior=\"editor-action\"]", @actionHandler)

  actionHandler: (e) =>
    e.preventDefault()
    target = $(e.target)
    
    switch target.data('action')
      when 'insert'
        content = target.data('content')
        before = target.data('before')
        pos = null
    
        if before?
          search = @editor.find(before, { wrap: true })
          @editor.moveCursorToPosition(search.start) if search?
          
        if content instanceof Array
          for item in content            
            if item != '{cursor}'
              @editor.insert(item)
            else
              pos = @editor.getCursorPosition()
        else
          @editor.insert(content);

        if pos?
          @editor.moveCursorToPosition(pos);

        this.editor.focus();