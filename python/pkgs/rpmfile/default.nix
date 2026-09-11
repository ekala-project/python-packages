{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage rec {
  pname = "rpmfile";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-CsK7qJJ3xxhcuGHJxtfQyaJovlFpUW28amjxVWqeP5k=";
  };

  build-system = [
    hatchling
  ];

  pythonImportsCheck = [ "rpmfile" ];

  meta = {
    description = "Read rpm archive files";
    homepage = "https://github.com/srossross/rpmfile";
    license = lib.licenses.mit;
  };
}
