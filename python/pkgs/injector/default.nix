{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytest-cov-stub,
}:

buildPythonPackage (finalAttrs: {
  pname = "injector";
  version = "0.24.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-injector";
    repo = "injector";
    tag = finalAttrs.version;
    hash = "sha256-Pv+3D2eyZiposXMsfhVniGNvlNGb3xSZfjIQBLMcbLA=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "injector" ];

  meta = {
    description = "Python dependency injection framework, inspired by Guice";
    homepage = "https://github.com/alecthomas/injector";
    license = lib.licenses.bsd3;
  };
})
