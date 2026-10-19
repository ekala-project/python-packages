{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pylev";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "toastdriven";
    repo = "pylev";
    tag = "v${finalAttrs.version}";
    hash = "sha256-gZUE2n3VFH9Z93wZocYLw4nsZaEOtN5rt1ttu22T/Tk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pylev" ];

  meta = {
    description = "Python Levenshtein implementation";
    homepage = "https://github.com/toastdriven/pylev";
    license = lib.licenses.bsd3;
  };
})
