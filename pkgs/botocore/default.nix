{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  jmespath,
  python-dateutil,
  urllib3,
}:

buildPythonPackage rec {
  pname = "botocore";
  version = "1.42.31";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "boto";
    repo = "botocore";
    tag = version;
    hash = "sha256-avuv1uXKMeSr3SL+BI9XW8tDCQM/dlXFn590di3S03k=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    jmespath
    python-dateutil
    urllib3
  ];

  pythonImportsCheck = [ "botocore" ];

  meta = {
    description = "Low-level interface to a growing number of Amazon Web Services";
    homepage = "https://github.com/boto/botocore";
    license = lib.licenses.asl20;
  };
}
