{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  poetry-core,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "fireflyalgorithm";
  version = "0.4.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "firefly-cpp";
    repo = "FireflyAlgorithm";
    tag = version;
    hash = "sha256-Zq1XaiEqfL+SmJu55rzVDXYBF2qyziviqw6qL+dcIb0=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'numpy = "^2.0.2"' ""
  '';

  build-system = [ poetry-core ];

  dependencies = [ numpy ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "fireflyalgorithm" ];

  meta = {
    description = "Implementation of the stochastic nature-inspired algorithm for optimization";
    mainProgram = "firefly-algorithm";
    homepage = "https://github.com/firefly-cpp/FireflyAlgorithm";
    license = lib.licenses.mit;
  };
}
