{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "arpy";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "viraptor";
    repo = "arpy";
    tag = version;
    hash = "sha256-SOJuk2JY952g6O3Tn2YA4Z3mYOnusERXmsHbfzD44kE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "arpy" ];

  meta = {
    description = "Library for accessing the archive files and reading the contents";
    homepage = "https://github.com/viraptor/arpy";
    license = lib.licenses.bsd2;
  };
}
