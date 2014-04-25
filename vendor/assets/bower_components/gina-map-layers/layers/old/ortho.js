/**
 * Name: TILE.EPSG:3857.ORTHO_RGB
 * Projection: EPSG:3857 Google Mercator
 * Tiles from the Alaska Ortho Project
 */
Gina.Layers.define('TILE.EPSG:3857.ORTHO_RGB', {
  name: 'SDMI Ortho Natural Color',
  type: Gina.Layers.Types.TILE,
  url: 'http://tiles.gina.alaska.edu/tiles/SPOT5.SDMI.ORTHO_RGB/tile/${x}/${y}/${z}',
  layerOptions: {
    type: 'jpeg',
    transitionEffect: 'resize',
    wrapDateLine: false,
    visibility: false,
    isBaseLayer: false,
    sphericalMercator: true
  }
});

/**
 * Name: TILE.EPSG:3857.ORTHO_CIR
 * Projection: EPSG:3857 Google Mercator
 * Tiles from the Alaska Ortho Project
 */
Gina.Layers.define('TILE.EPSG:3857.ORTHO_CIR', {
  name: 'SDMI Ortho Color Infrared',
  type: Gina.Layers.Types.TILE,
  url: 'http://tiles.gina.alaska.edu/tiles/SPOT5.SDMI.ORTHO_CIR/tile/${x}/${y}/${z}',
  layerOptions: {
    type: 'jpeg',
    transitionEffect: 'resize',
    wrapDateLine: false,
    visibility: false,
    isBaseLayer: false,
    sphericalMercator: true
  }
});

/**
 * Name: TILE.EPSG:3857.ORTHO_GS
 * Projection: EPSG:3857 Google Mercator
 * Tiles from the Alaska Ortho Project, Grayscale
 */
Gina.Layers.define('TILE.EPSG:3857.ORTHO_GS', {
  name: 'SDMI Ortho Grayscale',
  type: Gina.Layers.Types.TILE,
  url: 'http://tiles.gina.alaska.edu/tiles/SPOT5.SDMI.ORTHO_PAN/tile/${x}/${y}/${z}',
  layerOptions: {
    type: 'jpeg',
    transitionEffect: 'resize',
    wrapDateLine: false,
    visibility: false,
    isBaseLayer: false,
    sphericalMercator: true
  }
});

/**
 * Name: TILE.EPSG:3338.ORTHO_RGB
 * Projection: EPSG:3338 Google Mercator
 * Tiles from the Alaska Ortho Project
 */
Gina.Layers.define('TILE.EPSG:3338.ORTHO_RGB', {
  name: 'SDMI Ortho Natural Color',
  type: Gina.Layers.Types.TILE,
  url: 'http://tiles.gina.alaska.edu/tiles/SPOT5.SDMI.ORTHO_RGB_aa/tile/${x}/${y}/${z}',
  layerOptions: {
    type: 'jpeg',
    transitionEffect: 'resize',
    wrapDateLine: false,
    visibility: false,
    isBaseLayer: false
  }
});

/**
 * Name: TILE.EPSG:3338.ORTHO_CIR
 * Projection: EPSG:3338 Google Mercator
 * Tiles from the Alaska Ortho Project, Color Infrared
 */
Gina.Layers.define('TILE.EPSG:3338.ORTHO_CIR', {
  name: 'SDMI Ortho Color Infrared',
  type: Gina.Layers.Types.TILE,
  url: 'http://tiles.gina.alaska.edu/tiles/SPOT5.SDMI.ORTHO_CIR_aa/tile/${x}/${y}/${z}',
  layerOptions: {
    type: 'jpeg',
    transitionEffect: 'resize',
    wrapDateLine: false,
    visibility: false,
    isBaseLayer: false
  }
});

/**
 * Name: TILE.EPSG:3338.ORTHO_GS
 * Projection: EPSG:3338 Google Mercator
 * Tiles from the Alaska Ortho Project, Grayscale
 */
Gina.Layers.define('TILE.EPSG:3338.ORTHO_GS', {
  name: 'SDMI Ortho Grayscale',
  type: Gina.Layers.Types.TILE,
  url: 'http://tiles.gina.alaska.edu/tiles/SPOT5.SDMI.ORTHO_PAN_aa/tile/${x}/${y}/${z}',
  layerOptions: {
    type: 'jpeg',
    transitionEffect: 'resize',
    wrapDateLine: false,
    visibility: false,
    isBaseLayer: false
  }
});