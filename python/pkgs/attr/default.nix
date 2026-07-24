{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "attr";
  version = "0.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "denis-ryzhkov";
    repo = "attr";
    rev = version;
    hash = "sha256-1gOAONDuZb7xEPFZJc00BRtFF06uX65S8b3RRRNGeSo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "attr" ];

  meta = {
    description = "Simple decorator to set attributes of target function or class in a DRY way";
    homepage = "https://github.com/denis-ryzhkov/attr";
    license = lib.licenses.mit;
  };
}
