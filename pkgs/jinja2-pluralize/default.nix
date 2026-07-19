{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  jinja2,
  inflect,
}:

buildPythonPackage rec {
  pname = "jinja2-pluralize";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jinja2_pluralize";
    inherit version;
    hash = "sha256-31wtUBe5tUwKZst5DMqfwIlFg3w9v8MjWJID8f+3PBw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    jinja2
    inflect
  ];

  pythonImportsCheck = [ "jinja2_pluralize" ];

  meta = {
    description = "Jinja2 pluralize filters";
    homepage = "https://github.com/audreyr/jinja2_pluralize";
    license = lib.licenses.bsd3;
  };
}
