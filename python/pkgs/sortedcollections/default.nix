{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  sortedcontainers,
}:

buildPythonPackage rec {
  pname = "sortedcollections";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "grantjenks";
    repo = "python-sortedcollections";
    tag = "v${version}";
    hash = "sha256-GkZO8afUAgDpDjIa3dhO6nxykqrljeKldunKMODSXfg=";
  };

  build-system = [ setuptools ];

  dependencies = [ sortedcontainers ];

  pythonImportsCheck = [ "sortedcollections" ];

  meta = {
    description = "Python Sorted Collections";
    homepage = "http://www.grantjenks.com/docs/sortedcollections/";
    license = lib.licenses.asl20;
  };
}
