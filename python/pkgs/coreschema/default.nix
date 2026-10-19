{
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  buildPythonPackage,
  jinja2,
  pytest,
}:

buildPythonPackage rec {
  pname = "coreschema";
  version = "0.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    repo = "python-coreschema";
    owner = "core-api";
    tag = version;
    sha256 = "027pc753mkgbb3r1v1x7dsdaarq93drx0f79ppvw9pfkcjcq6wb1";
  };

  build-system = [ setuptools ];

  dependencies = [ jinja2 ];
  checkPhase = ''
    cd ./tests
    pytest
  '';

  meta = {
    description = "Python client library for Core Schema";
    homepage = "https://github.com/ivegotasthma/python-coreschema";
    license = lib.licenses.bsd3;
  };
}
