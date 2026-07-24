{
  lib,
  buildPythonPackage,
  decorator,
  deprecated,
  fetchFromGitHub,
  icecream,
  invoke,
  mock,
  paramiko,
  pytest-relaxed,
  setuptools,
}:

buildPythonPackage rec {
  pname = "fabric";
  version = "3.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fabric";
    repo = "fabric";
    tag = version;
    hash = "sha256-GbZQ6rFKQyJZXYfe9b4j6yjKgAB0ct8AD1xYG0yGZl8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    invoke
    paramiko
    deprecated
    decorator
  ];
  pythonImportsCheck = [ "fabric" ];
  meta = {
    description = "Pythonic remote execution";
    homepage = "https://www.fabfile.org/";
    license = lib.licenses.bsd2;
    maintainers = [ ];
    mainProgram = "fab";
  };
}
