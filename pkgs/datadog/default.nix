{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  requests,
}:

buildPythonPackage rec {
  pname = "datadog";
  version = "0.52.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "DataDog";
    repo = "datadogpy";
    tag = "v${version}";
    hash = "sha256-WhfCREEuFT4b75C62KWnAyYGt4/j5tuuP8hZOHGNo10=";
  };

  build-system = [ hatchling ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "datadog" ];

  meta = {
    description = "Datadog Python library";
    homepage = "https://github.com/DataDog/datadogpy";
    license = lib.licenses.bsd3;
  };
}
