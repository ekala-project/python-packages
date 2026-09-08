{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  attrs,
  cattrs,
  platformdirs,
  requests,
  urllib3,
  url-normalize,
}:

buildPythonPackage rec {
  pname = "requests-cache";
  version = "1.3.3";
  pyproject = true;

  src = fetchPypi {
    pname = "requests_cache";
    inherit version;
    hash = "sha256-ebctWsUUOZLRg2rXj02OZWZgYd1E4iBUjKqzcjCJgms=";
  };

  build-system = [ hatchling ];

  dependencies = [
    attrs
    cattrs
    platformdirs
    requests
    urllib3
    url-normalize
  ];

  pythonImportsCheck = [ "requests_cache" ];

  meta = {
    description = "Persistent cache for requests library";
    homepage = "https://github.com/requests-cache/requests-cache";
    license = lib.licenses.bsd3;
  };
}
