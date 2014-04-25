class @Gina

class @Gina.Layers
  @return_by_name: true

  @tile_layer: (tilejson) =>
    console.log 'This should be reimplemented by the appropriate adapter!'

  @define: (name, tilejson) =>
    Gina.Definitions.define(name, tilejson)

  @find: (partial_name, return_by_name = @return_by_name) =>
    if return_by_name
      @find_with_name(partial_name)
    else
      @find_without_name(partial_name)


  @find_without_name: (partial_name) =>
    layers = []
    for layer in Gina.Definitions.find(partial_name)
      layers.push(@tile_layer(layer))

    layers


  @find_with_name: (partial_name) =>
    layers = {}
    for layer in Gina.Definitions.find(partial_name)
      layers[layer.name] = @tile_layer(layer)

    layers

  @get: (layer_name) =>
    @tile_layer(Gina.Definitions.get(layer_name))

class @Gina.Definitions
  @defs: {}

  @get: (layer_name) =>
    if layer_name.match(/\*/)
      @find(layer_name)
    else
      @defs[layer_name]
  @find: (partial_name) =>
    layers = []
    regexp = new RegExp(partial_name.replace(/\./g, '\\.').replace('*', '[^\\s]*'))

    for name,tilejson of @defs
      if name.match(regexp)
        layers.push(tilejson)

    layers

  @define: (name, tilejson) =>
    @defs[name] = tilejson
