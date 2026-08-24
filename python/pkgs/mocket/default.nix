{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  hatchling,
  # dependencies
  decorator,
  h11,
  puremagic,
  typing-extensions,
  urllib3,
  # optional-dependencies
  xxhash,
  pook,
}:

buildPythonPackage rec {
  pname = "mocket";
  version = "3.14.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lDDPfk8a1/HPxIzgCKv4eq+asnJkFsWBCUROnF6g+wg=";
  };

  build-system = [ hatchling ];

  dependencies = [
    decorator
    h11
    puremagic
    typing-extensions
    urllib3
  ];

  optional-dependencies = {
    pook = [ pook ];
    speedups = [ xxhash ];
  };

  # Skip http tests, they require network access
  env.SKIP_TRUE_HTTP = true;

  pythonImportsCheck = [ "mocket" ];

  meta = {
    description = "Socket mock framework for all kinds of sockets including web-clients";
    homepage = "https://github.com/mindflayer/python-mocket";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
