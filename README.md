# Ubermap

[![Stories in Ready](https://badge.waffle.io/gina-alaska/ubermap.svg?label=ready&title=Ready)](http://waffle.io/gina-alaska/ubermap)

Currently this is a basic rails application that allows users to
build a custom map.

Additional layers can be created by uploading geojson files.

Application is written using the following tools/libs

* Rails
* Mapbox
* PostgreSQL
* Habitat
* AWS

## Styling

GeoJSON features can be styled by embeded the [simplestyle-spec](https://github.com/mapbox/simplestyle-spec) attribute values in your GeoJSON files.

This allows you to control the styling on a feature level.

The layer editor also allows you to specify the default styling that should be used any other feature styling not provided in the attribute list.

## Building packages

Make sure you have habitat installed and working, the following commands are generally used for upload new versions

```
hab studio enter
build
source results/last_build.env; aws s3 cp results/$pkg_artifact s3://gina-packages --acl=public-read --profile=uafgina; cat results/last_build.env
# update the chef environment with the `pkg_artifact` and `pkg_sha256sum` values the last command output
```

## TODO

* Fix up the way options are specified for layers
* Ability to add tile layers to a map
* Create geojson layer using a link to externally hosted geojson
* Time series support for geojson data
* Provide a paged API for loading geojson data into the map
