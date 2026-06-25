{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytest,
  coverage,
  hatchling,
  hatch-fancy-pypi-readme,
  toml,
  tomli,
}:

buildPythonPackage rec {
  pname = "pytest-cov";
  version = "7.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_cov";
    inherit version;
    hash = "sha256-MGdPK19jUaoJcCqcjDZPagHCeq4ME2augBYWDR78VrI=";
  };

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
  ];

  buildInputs = [ pytest ];

  dependencies = [
    coverage
    toml
    tomli
  ];

  doCheck = false;

  pythonImportsCheck = [ "pytest_cov" ];

  meta = {
    description = "Plugin for coverage reporting with support for both centralised and distributed testing, including subprocesses and multiprocessing";
    homepage = "https://github.com/pytest-dev/pytest-cov";
    license = lib.licenses.mit;
  };
}
