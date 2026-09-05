{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  requests,
}:

buildPythonPackage rec {
  pname = "datadog";
  version = "0.53.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "DataDog";
    repo = "datadogpy";
    tag = "v${version}";
    hash = "sha256-CCbeHDaRg+BV+nwoLbrhMUqtWFkjbvyq1XHAEtkXgW4=";
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
