{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,

  inflection,
  pydantic,
  requests,
  typing-extensions,
  urllib3,
  click,
}:

buildPythonPackage rec {
  pname = "pyairtable";
  version = "3.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-apF01DgAlmZgVH4H0Ac2s6D973W1CHt27oug6AnAQu4=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    inflection
    pydantic
    requests
    typing-extensions
    urllib3
    click
  ];
  pythonImportsCheck = [ "pyairtable" ];

  meta = {
    description = "Python API Client for Airtable";
    homepage = "https://pyairtable.readthedocs.io/";
    license = lib.licenses.mit;
    mainProgram = "pyairtable";
    maintainers = [ ];
  };
}
