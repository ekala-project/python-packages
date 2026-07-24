{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,
  wheel,

  # dependencies
  typing-extensions,

  # checks
}:

buildPythonPackage rec {
  pname = "flexcache";
  version = "0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hgrecco";
    repo = "flexcache";
    rev = version;
    hash = "sha256-MAbTe7NxzfRPzo/Wnb5SnPJvJWf6zVeYsaw/g9OJYSE=";
  };

  build-system = [
    setuptools
    setuptools-scm
    wheel
  ];

  dependencies = [ typing-extensions ];
  pythonImportsCheck = [ "flexcache" ];

  meta = {
    description = "Robust and extensible package to cache on disk the result of expensive calculations";
    homepage = "https://github.com/hgrecco/flexcache";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
