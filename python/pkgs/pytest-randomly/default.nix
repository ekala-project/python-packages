{
  lib,
  buildPythonPackage,
  factory-boy,
  faker,
  fetchFromGitHub,
  model-bakery,
  numpy,
  pytest,
  pytest-xdist,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pytest-randomly";
  version = "4.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    repo = "pytest-randomly";
    owner = "pytest-dev";
    tag = version;
    hash = "sha256-UQ1G9o4dsVEEo4y2u1TYYurJPfih7QlbilkwPqi39H0=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];
  # needs special invocation, copied from tox.ini
  pythonImportsCheck = [ "pytest_randomly" ];

  meta = {
    description = "Pytest plugin to randomly order tests and control random.seed";
    homepage = "https://github.com/pytest-dev/pytest-randomly";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
