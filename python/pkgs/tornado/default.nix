{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tornado";
  version = "6.5.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tornadoweb";
    repo = "tornado";
    tag = "v${version}";
    hash = "sha256-d6lKg8yrQqaCeKxdPjQNzv7Nc23U/v8d5x3sE3trRM4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "tornado" ];

  meta = {
    description = "Web framework and asynchronous networking library";
    homepage = "https://www.tornadoweb.org/";
    license = lib.licenses.asl20;
  };
}
