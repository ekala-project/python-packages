{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "coverage";
  version = "7.14.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "coveragepy";
    repo = "coveragepy";
    tag = finalAttrs.version;
    hash = "sha256-3/Q6TQfoZNM7bHjviw/C70i2ZgjobHnynmqX9qvreYQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "coverage" ];

  meta = {
    description = "Code coverage measurement for Python";
    homepage = "https://github.com/coveragepy/coveragepy";
    license = lib.licenses.asl20;
  };
})
