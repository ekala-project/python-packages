{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  robotframework,
}:

buildPythonPackage rec {
  pname = "robotframework-pythonlibcore";
  version = "4.6.0";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "robotframework";
    repo = "PythonLibCore";
    tag = "v${version}";
    hash = "sha256-H13b25M4vEymXZzhAm/EXMx7v5u/9rgkBXv7nBaxAvo=";
  };

  build-system = [ setuptools ];

  dependencies = [ robotframework ];

  pythonImportsCheck = [ "robotlibcore" ];

  meta = {
    description = "Tools to ease creating larger test libraries for Robot Framework using Python";
    homepage = "https://github.com/robotframework/PythonLibCore";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
