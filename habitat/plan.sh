pkg_name=ubermap
pkg_origin=uafgina
pkg_version=$(cat $PLAN_CONTEXT/../VERSION)
# pkg_source=https://github.com/gina-alaska/${pkg_name}/archive/${pkg_version}.tar.gz
# pkg_shasum=62592f794d7405229e71fd04cc9f2235303f777f8408505b259a27e09cd53746
pkg_maintainer="Will Fisher will@alaska.edu"
pkg_description="Application Package for Ubermap"
pkg_license=('MIT')
pkg_bin_dirs=(bin)
pkg_expose=(9292)

pkg_deps=(
  core/cacerts
)

pkg_scaffolding=core/scaffolding-ruby

do_prepare() {
  do_default_prepare

  export SSL_CERT_FILE="$(pkg_path_for core/cacerts)/ssl/certs/cacert.pem"

  return 0
}
