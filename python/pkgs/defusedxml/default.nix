{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  python,
}:

buildPythonPackage rec {
  pname = "defusedxml";
  version = "0.8.0rc2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tiran";
    repo = "defusedxml";
    tag = "v${version}";
    hash = "sha256-X88A5V9uXP3wJQ+olK6pZJT66LP2uCXLK8goa5bPARA=";
  };

  build-system = [ setuptools ];
  checkPhase = ''
    runHook preCheck
    ${python.interpreter} tests.py
    runHook postCheck
  '';

  pythonImportsCheck = [ "defusedxml" ];

  meta = {
    description = "Python module to defuse XML issues";
    homepage = "https://github.com/tiran/defusedxml";
    license = lib.licenses.psfl;
    maintainers = [ ];
  };
}
