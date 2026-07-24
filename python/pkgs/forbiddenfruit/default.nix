{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "forbiddenfruit";
  version = "0.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "clarete";
    repo = "forbiddenfruit";
    tag = version;
    hash = "sha256-yHIZsVn2UVmWeBNIzWDE6AOwAXZilPqXo+bVtXqGkJk=";
  };

  build-system = [ setuptools ];

  env.FFRUIT_EXTENSION = "true";

  pythonImportsCheck = [ "forbiddenfruit" ];

  doCheck = false;

  meta = {
    description = "Patch python built-in objects";
    homepage = "https://github.com/clarete/forbiddenfruit";
    license = with lib.licenses; [
      mit
      gpl3Plus
    ];
  };
}
