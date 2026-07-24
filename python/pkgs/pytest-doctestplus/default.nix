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
  version = "1.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scientific-python";
    repo = "pytest-doctestplus";
    tag = "v${version}";
    hash = "sha256-64I0K0+yYU1omGkVgfxeD9r9s9yHp0ik1HAsEc1NNtA=";
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
