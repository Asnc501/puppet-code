class apache {

  include apache::prerequisite
  include apache::install
  include apache::service
  include apache::sitedata

}
