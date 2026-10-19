{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  inflection,
  more-itertools,
  numpy,
  pandas,
  python-dateutil,
  requests,
  six,
}:

buildPythonPackage rec {
  pname = "nasdaq-data-link";
  version = "1.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Nasdaq";
    repo = "data-link-python";
    tag = version;
    hash = "sha256-Q3Ay9FpJsvSVu0WU2bxFyo3ODKP/ZUo3SqsBtOGrIIE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    inflection
    more-itertools
    numpy
    pandas
    python-dateutil
    requests
    six
  ];

  pythonImportsCheck = [ "nasdaqdatalink" ];

  meta = {
    description = "Library for Nasdaq Data Link's RESTful API";
    homepage = "https://github.com/Nasdaq/data-link-python";
    license = lib.licenses.mit;
  };
}
