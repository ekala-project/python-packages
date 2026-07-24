{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  requests,
}:

buildPythonPackage rec {
  pname = "datadog";
  version = "0.52.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "DataDog";
    repo = "datadogpy";
    tag = "v${version}";
    hash = "sha256-ykZb6wm/hwYyQu6+cdtA33J82SLle5iJlmV5mNHTkv0=";
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
