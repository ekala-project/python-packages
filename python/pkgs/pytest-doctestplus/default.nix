{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  gitMinimal,
  numpy,
  packaging,
  pytest,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "pytest-doctestplus";
  version = "1.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scientific-python";
    repo = "pytest-doctestplus";
    tag = "v${version}";
    hash = "sha256-5vvLnvE0dvLYBNx34gsyQEcWlr7Cd063+rRjlnHM7OE=";
  };

  postPatch = ''
    substituteInPlace pytest_doctestplus/plugin.py \
      --replace-fail '"git"' '"${lib.getExe gitMinimal}"'
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  buildInputs = [ pytest ];

  dependencies = [
    packaging
  ];

  pythonImportsCheck = [ "pytest_doctestplus" ];
  meta = {
    description = "Pytest plugin with advanced doctest features";
    homepage = "https://astropy.org";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
