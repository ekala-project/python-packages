{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "coverage";
  version = "7.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "coveragepy";
    repo = "coveragepy";
    tag = finalAttrs.version;
    hash = "sha256-hXNT4mxXMGzlKbqbUkBAHLr1wfcoineTtbmF12I8zFs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "coverage" ];

  meta = {
    description = "Code coverage measurement for Python";
    homepage = "https://github.com/coveragepy/coveragepy";
    license = lib.licenses.asl20;
  };
})
