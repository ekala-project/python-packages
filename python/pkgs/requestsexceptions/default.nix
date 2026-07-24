{
  lib,
  fetchPypi,
  buildPythonPackage,
  pbr,
  setuptools,
}:

buildPythonPackage rec {
  pname = "requestsexceptions";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-sJXLx3YY8GbUWaArE3sCDDfan0bZsFdwQBnJ9326MGU=";
  };

  nativeBuildInputs = [
    pbr
    setuptools
  ];

  pythonImportsCheck = [ "requestsexceptions" ];

  doCheck = false;

  meta = {
    homepage = "https://pypi.org/project/requestsexceptions/";
    description = "Import exceptions from potentially bundled packages in requests";
    license = lib.licenses.asl20;
  };
}
