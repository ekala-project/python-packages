{
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  lib,
  # dependencies
  flask,
  jinja2,
  markupsafe,
  werkzeug,
  wtforms,
  # optional dependencies
  # sqlalchemy
  flask-sqlalchemy,
  sqlalchemy,
  # sqlalchemy-lite
  flask-sqlalchemy-lite,
  # sqlalchemy-with-utils
  arrow,
  colour,
  email-validator,
  sqlalchemy-citext ? null,
  sqlalchemy-utils,
  # geoalchemy
  geoalchemy2,
  shapely,
  # pymongo
  pymongo,
  # mongoengine
  mongoengine,
  # peewee
  peewee,
  wtf-peewee,
  # s3
  boto3,
  # azure-blob-storage
  azure-storage-blob,
  # images
  pillow,
  # export
  tablib,
  # rediscli
  redis,
  # translation
  flask-babel,
  # checks
  beautifulsoup4,
  moto,
  psycopg2,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-admin";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "flask-admin";
    repo = "flask-admin";
    tag = "v${finalAttrs.version}";
    hash = "sha256-lRLyGvCat6nBixFKkrn4NxeVF52Hl32admAL37mf9wc=";
  };

  build-system = [ flit-core ];

  dependencies = [
    flask
    jinja2
    markupsafe
    werkzeug
    wtforms
  ];

  optional-dependencies = {
    sqlalchemy = [
      flask-sqlalchemy
      sqlalchemy
    ];
    sqlalchemy-lite = [
      flask-sqlalchemy-lite
    ];
    sqlalchemy-with-utils =
      finalAttrs.optional-dependencies.sqlalchemy
      ++ [
        arrow
        colour
        email-validator
        sqlalchemy-utils
      ]
      ++ lib.optional (sqlalchemy-citext != null) sqlalchemy-citext;
    geoalchemy = finalAttrs.optional-dependencies.sqlalchemy ++ [
      geoalchemy2
      shapely
    ];
    pymongo = [ pymongo ];
    mongoengine = [ mongoengine ];
    peewee = [
      peewee
      wtf-peewee
    ];
    s3 = [ boto3 ];
    azure-blob-storage = [ azure-storage-blob ];
    images = [ pillow ];
    export = [ tablib ];
    rediscli = [ redis ];
    translation = [ flask-babel ];
    all = lib.flatten [
      finalAttrs.optional-dependencies.sqlalchemy
      finalAttrs.optional-dependencies.sqlalchemy-with-utils
      finalAttrs.optional-dependencies.geoalchemy
      finalAttrs.optional-dependencies.pymongo
      finalAttrs.optional-dependencies.mongoengine
      finalAttrs.optional-dependencies.peewee
      finalAttrs.optional-dependencies.s3
      finalAttrs.optional-dependencies.azure-blob-storage
      finalAttrs.optional-dependencies.images
      finalAttrs.optional-dependencies.export
      finalAttrs.optional-dependencies.rediscli
      finalAttrs.optional-dependencies.translation
    ];
  };
  pythonImportsCheck = [ "flask_admin" ];

  meta = {
    description = "Admin interface framework for Flask";
    homepage = "https://github.com/flask-admin/flask-admin/";
    license = lib.licenses.bsd3;
  };
})
