{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  packaging,
}:

buildPythonPackage rec {
  pname = "setuptools-scm";
  version = "9.2.2";
  pyproject = true;

  src = fetchPypi {
    pname = "setuptools_scm";
    inherit version;
    hash = "sha256-HGdKtGZWhqCIfX4kwDqyXyQgHCE+guponS8+Fp7371c=";
  };

  build-system = [ setuptools ];

  dependencies = [
    packaging
    setuptools
  ];

  pythonImportsCheck = [ "setuptools_scm" ];

  meta = {
    description = "Handles managing your python package versions in scm metadata";
    homepage = "https://github.com/pypa/setuptools_scm";
    license = lib.licenses.mit;
  };
}
