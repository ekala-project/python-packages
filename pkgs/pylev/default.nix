{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "pylev";
  version = "1.4.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "toastdriven";
    repo = "pylev";
    tag = "v${version}";
    hash = "sha256-gZUE2n3VFH9Z93wZocYLw4nsZaEOtN5rt1ttu22T/Tk=";
  };

  pythonImportsCheck = [ "pylev" ];

  meta = {
    description = "Python Levenshtein implementation";
    homepage = "https://github.com/toastdriven/pylev";
    license = lib.licenses.bsd3;
  };
}
