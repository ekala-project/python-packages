{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  apispec,
  colorama,
  click,
  email-validator,
  flask,
  flask-babel,
  flask-limiter,
  flask-login,
  flask-openid,
  flask-sqlalchemy,
  flask-wtf,
  flask-jwt-extended,
  jsonschema,
  marshmallow,
  marshmallow-sqlalchemy,
  python-dateutil,
  prison,
  pyjwt,
  pyyaml,
  sqlalchemy-utils,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-appbuilder";
  version = "5.0.2";
  pyproject = true;

  src = fetchPypi {
    pname = "Flask-AppBuilder";
    inherit (finalAttrs) version;
    hash = "sha256-9Xe5gqGuQLwhMjjO25PDnGfPIZmqHgBuCH6hs1B9VFA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    apispec
    colorama
    click
    email-validator
    flask
    flask-babel
    flask-limiter
    flask-login
    flask-openid
    flask-sqlalchemy
    flask-wtf
    flask-jwt-extended
    jsonschema
    marshmallow
    marshmallow-sqlalchemy
    python-dateutil
    prison
    pyjwt
    pyyaml
    sqlalchemy-utils
  ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "apispec[yaml]>=3.3, <6" "apispec[yaml]" \
      --replace "Flask-SQLAlchemy>=2.4, <3" "Flask-SQLAlchemy" \
      --replace "Flask-Babel>=1, <3" "Flask-Babel" \
      --replace "marshmallow-sqlalchemy>=0.22.0, <0.27.0" "marshmallow-sqlalchemy" \
      --replace "prison>=0.2.1, <1.0.0" "prison"
  '';

  pythonImportsCheck = [ "flask_appbuilder" ];

  meta = {
    description = "Application development framework, built on top of Flask";
    homepage = "https://github.com/dpgaspar/flask-appbuilder/";
    license = lib.licenses.bsd3;
  };
})
