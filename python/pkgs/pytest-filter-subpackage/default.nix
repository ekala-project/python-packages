{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytest,
  pytest-cov-stub,
  pytest-doctestplus,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-filter-subpackage";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-P0aPGzZRgSiGm5Xeq2YbpF7WKThUMp/vFNpMjKx4r1Y=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  buildInputs = [ pytest ];

  dependencies = [
    pytest-doctestplus
    pytest-cov-stub
  ];

  # missing some files

  meta = {
    description = "Meta-package containing dependencies for testing";
    homepage = "https://github.com/astropy/pytest-filter-subpackage";
    license = lib.licenses.bsd3;
  };
})
