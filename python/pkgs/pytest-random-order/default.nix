{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  py,
  pytest,
  pytest-xdist,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pytest-random-order";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jbasko";
    repo = "pytest-random-order";
    tag = "v${version}";
    hash = "sha256-c282PrdXxG7WChnkpLWe059OmtTOl1Mn6yWgMRfCjBA=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  buildInputs = [ pytest ];
  pythonImportsCheck = [ "random_order" ];

  meta = {
    homepage = "https://github.com/jbasko/pytest-random-order";
    description = "Randomise the order of tests with some control over the randomness";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
