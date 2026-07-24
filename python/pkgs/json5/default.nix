{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "json5";
  version = "0.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dpranke";
    repo = "pyjson5";
    tag = "v${version}";
    hash = "sha256-KL5YsWSHS8xI+lQB+ZtdEKUHGKICOduZsBd51z4jItw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "json5" ];

  meta = {
    description = "Python implementation of the JSON5 data format";
    homepage = "https://github.com/dpranke/pyjson5";
    license = lib.licenses.asl20;
    mainProgram = "pyjson5";
  };
}
