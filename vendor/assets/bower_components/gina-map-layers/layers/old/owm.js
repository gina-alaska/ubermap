/* Layers from http://openweathermap.org/ */

/**
 * Name: TILE.EPSG:3857.OWM_CLOUDS
 * Projection: EPSG:3857 Web Mercator
 * OpenWeatherMap Clouds Overlay in web mercator
 */
Gina.Layers.define('TILE.EPSG:3857.OWM_CLOUDS', {
  name: 'OpenWeatherMap Clouds',
  type: Gina.Layers.Types.TILE,
  url: 'http://${s}.tile.openweathermap.org/map/clouds/${z}/${x}/${y}.png',
  layerOptions: {
    type: 'png',
    transitionEffect: 'resize',
    wrapDateLine: true,
    visibility: false,
    isBaseLayer: false,
    opacity: 0.5,
    attribution: '(c) <a href="http://www.openweathermap.org">Map data &copy; OpenWeatherMap</a>'
  }
});

/**
 * Name: TILE.EPSG:3857.OWM_PRECIP
 * Projection: EPSG:3857 Web Mercator
 * OpenWeatherMap Precipitation Overlay in web mercator
 */
Gina.Layers.define('TILE.EPSG:3857.OWM_PRECIP', {
  name: 'OpenWeatherMap Precipitation',
  type: Gina.Layers.Types.TILE,
  url: 'http://${s}.tile.openweathermap.org/map/precipitation/${z}/${x}/${y}.png',
  layerOptions: {
    type: 'png',
    transitionEffect: 'resize',
    wrapDateLine: true,
    visibility: false,
    isBaseLayer: false,
    opacity: 0.5,
    attribution: '(c) <a href="http://www.openweathermap.org">Map data &copy; OpenWeatherMap</a>'
  }
});

/**
 * Name: TILE.EPSG:3857.OWM_SNOW
 * Projection: EPSG:3857 Web Mercator
 * OpenWeatherMap Snow Overlay in web mercator
 */
Gina.Layers.define('TILE.EPSG:3857.OWM_SNOW', {
  name: 'OpenWeatherMap Snow',
  type: Gina.Layers.Types.TILE,
  url: 'http://${s}.tile.openweathermap.org/map/snow/${z}/${x}/${y}.png',
  layerOptions: {
    type: 'png',
    transitionEffect: 'resize',
    wrapDateLine: true,
    visibility: false,
    isBaseLayer: false,
    opacity: 0.5,
    attribution: '(c) <a href="http://www.openweathermap.org">Map data &copy; OpenWeatherMap</a>'
  }
});

/**
 * Name: TILE.EPSG:3857.OWM_TEMP
 * Projection: EPSG:3857 Web Mercator
 * OpenWeatherMap Temperature Overlay in web mercator
 */
Gina.Layers.define('TILE.EPSG:3857.OWM_TEMP', {
  name: 'OpenWeatherMap Temperature',
  type: Gina.Layers.Types.TILE,
  url: 'http://${s}.tile.openweathermap.org/map/temp/${z}/${x}/${y}.png',
  layerOptions: {
    type: 'png',
    transitionEffect: 'resize',
    wrapDateLine: true,
    visibility: false,
    isBaseLayer: false,
    opacity: 0.5,
    attribution: '(c) <a href="http://www.openweathermap.org">Map data &copy; OpenWeatherMap</a>'
  }
});

/**
 * Name: TILE.EPSG:3857.OWM_WIND
 * Projection: EPSG:3857 Web Mercator
 * OpenWeatherMap Wind speed Overlay in web mercator
 */
Gina.Layers.define('TILE.EPSG:3857.OWM_WIND', {
  name: 'OpenWeatherMap Wind Speed',
  type: Gina.Layers.Types.TILE,
  url: 'http://${s}.tile.openweathermap.org/map/wind/${z}/${x}/${y}.png',
  layerOptions: {
    type: 'png',
    transitionEffect: 'resize',
    wrapDateLine: true,
    visibility: false,
    isBaseLayer: false,
    opacity: 0.5,
    attribution: '(c) <a href="http://www.openweathermap.org">Map data &copy; OpenWeatherMap</a>'
  }
});

/**
 * Name: TILE.EPSG:3857.OWM_PRESSURE
 * Projection: EPSG:3857 Web Mercator
 * OpenWeatherMap Sea level pressure Overlay in web mercator
 */
Gina.Layers.define('TILE.EPSG:3857.OWM_PRESSURE', {
  name: 'OpenWeatherMap Sea level pressure contour',
  type: Gina.Layers.Types.TILE,
  url: 'http://${s}.tile.openweathermap.org/map/pressure/${z}/${x}/${y}.png',
  layerOptions: {
    type: 'png',
    transitionEffect: 'resize',
    wrapDateLine: true,
    visibility: false,
    isBaseLayer: false,
    opacity: 0.5,
    attribution: '(c) <a href="http://www.openweathermap.org">Map data &copy; OpenWeatherMap</a>'
  }
});

/**
 * Name: TILE.EPSG:3857.OWM_PRESSURE_CNTR
 * Projection: EPSG:3857 Web Mercator
 * OpenWeatherMap Sea level pressure contours Overlay in web mercator
 */
Gina.Layers.define('TILE.EPSG:3857.OWM_PRESSURE_CNTR', {
  name: 'OpenWeatherMap Sea level pressure contour',
  type: Gina.Layers.Types.TILE,
  url: 'http://${s}.tile.openweathermap.org/map/pressure_cntr/${z}/${x}/${y}.png',
  layerOptions: {
    type: 'png',
    transitionEffect: 'resize',
    wrapDateLine: true,
    visibility: false,
    isBaseLayer: false,
    opacity: 0.5,
    attribution: '(c) <a href="http://www.openweathermap.org">Map data &copy; OpenWeatherMap</a>'
  }
});
