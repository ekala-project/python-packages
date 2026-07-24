{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mergedeep";
  version = "1.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "clarketm";
    repo = "mergedeep";
    rev = "v${version}";
    hash = "sha256-yRB0GqoIFu6BHuijAaR0J+qsaUPaEb39+12PMX/bW9c=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mergedeep" ];

  meta = {
    homepage = "https://github.com/clarketm/mergedeep";
    description = "Deep merge function for python";
    license = lib.licenses.mit;
  };
}
