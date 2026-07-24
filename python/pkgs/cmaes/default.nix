{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cmaes";
  version = "0.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "CyberAgentAILab";
    repo = "cmaes";
    tag = "v${version}";
    hash = "sha256-sH5iJ9iSWLniIRzKsUC9ODlmifIuJoIAkOPpmAQ6Hrs=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ numpy ];
  pythonImportsCheck = [ "cmaes" ];
  meta = {
    description = "Python library for CMA evolution strategy";
    homepage = "https://github.com/CyberAgentAILab/cmaes";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
