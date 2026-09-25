{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cmaes";
  version = "0.13.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "CyberAgentAILab";
    repo = "cmaes";
    tag = "v${version}";
    hash = "sha256-GzBAymSb6frMXvHtd1Xl5gK62pYuXKd3XU9TLhe+sJ4=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ numpy ];
  pythonImportsCheck = [ "cmaes" ];
  meta = {
    description = "Python library for CMA evolution strategy";
    homepage = "https://github.com/CyberAgentAILab/cmaes";
    license = lib.licenses.mit;
  };
}
