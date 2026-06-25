{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "pathable";
  version = "0.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "p1c2u";
    repo = "pathable";
    tag = version;
    hash = "sha256-D3TYVMcKXPA6fmy2JND5o8ja3Rk8Ne17Sxm4+fLw3Dw=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "pathable" ];

  meta = {
    description = "Library for object-oriented paths";
    homepage = "https://github.com/p1c2u/pathable";
    license = lib.licenses.asl20;
  };
}
