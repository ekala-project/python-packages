{
  lib,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  fetchpatch,
  ijson,
  ply,
  six,
  setuptools,
  tornado,
}:

buildPythonPackage rec {
  pname = "thriftpy2";
  version = "0.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Thriftpy";
    repo = "thriftpy2";
    tag = "v${version}";
    hash = "sha256-vbNCPYWO/D+7/UJU/0ATdLzZ4lIPOKeBZ1sgWCdxx/c=";
  };

  patches = [
  ];
  build-system = [ setuptools ];

  nativeBuildInputs = [ cython ];

  dependencies = [
    ijson
    ply
    six
    tornado
  ];

  # Not all needed files seems to be present

  pythonImportsCheck = [ "thriftpy2" ];

  meta = {
    description = "Python module for Apache Thrift";
    homepage = "https://github.com/Thriftpy/thriftpy2";
    license = lib.licenses.mit;
  };
}
