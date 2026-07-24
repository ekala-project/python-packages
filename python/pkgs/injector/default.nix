{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-cov-stub,
}:

buildPythonPackage rec {
  pname = "injector";
  version = "0.24.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "python-injector";
    repo = "injector";
    tag = version;
    hash = "sha256-Pv+3D2eyZiposXMsfhVniGNvlNGb3xSZfjIQBLMcbLA=";
  };
  pythonImportsCheck = [ "injector" ];

  meta = {
    description = "Python dependency injection framework, inspired by Guice";
    homepage = "https://github.com/alecthomas/injector";
    maintainers = [ ];
    license = lib.licenses.bsd3;
  };
}
