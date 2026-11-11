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

buildPythonPackage (finalAttrs: {
  pname = "pyairtable";
  version = "3.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-o44DKV3dotSuxskdw1yoQgtuNk5sFMhU3pzwH3imqIo=";
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
  };
})
