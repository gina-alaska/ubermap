# Ubermap

[![Stories in Ready](https://badge.waffle.io/gina-alaska/ubermap.svg?label=ready&title=Ready)](http://waffle.io/gina-alaska/ubermap)

Currently this is a basic rails application that allows users to
build a custom map.

Additional layers can be created by uploading geojson files.

Application is written using the following tools/libs

* Rails
* Mapbox
* gina-map-layers
* PostgreSQL

## Styling

GeoJSON features can be styled by embeded the [simplestyle-spec](https://github.com/mapbox/simplestyle-spec) attribute values in your GeoJSON files.

This allows you to control the styling on a feature level.

The layer editor also allows you to specify the default styling that should be used any other feature styling not provided in the attribute list.

## TODO

* Fix up the way options are specified for layers
* Ability to add tile layers to a map
* Ability to add wms layers to a map
* Create geojson layer using a link to externally hosted geojson
* Time series support for geojson data
* Time series support for WMS/Tile layers
* Rather than uploading files ingest geojson into database (postgres w/hstore)
* Provide a paged API for loading geojson data into the map
