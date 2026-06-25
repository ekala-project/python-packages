{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "cppy";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nucleic";
    repo = "cppy";
    tag = version;
    hash = "sha256-/u9JQ2ivjSlBPodfAjeDmJ+HUu1rFZ58p3V5L2dy4Jk=";
  };

  build-system = [ setuptools-scm ];

  pythonImportsCheck = [ "cppy" ];

  meta = {
    description = "C++ headers for C extension development";
    homepage = "https://github.com/nucleic/cppy";
    license = lib.licenses.bsd3;
  };
}
