{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pycodestyle,
  pytest,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pytest-pycodestyle";
  version = "2.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "henry0312";
    repo = "pytest-pycodestyle";
    tag = "v${version}";
    hash = "sha256-X/vacxI0RFHIqlZ2omzvvFDePS/SZYSFQHEmfcbvf/4=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ pycodestyle ];

  pythonImportsCheck = [ "pytest_pycodestyle" ];

  meta = {
    description = "Pytest plugin to run pycodestyle";
    homepage = "https://github.com/henry0312/pytest-pycodestyle";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
