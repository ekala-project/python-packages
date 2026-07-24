{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "allpairspy";
  version = "2.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "thombashi";
    repo = "allpairspy";
    tag = "v${version}";
    hash = "sha256-0wzoQDHB7Tt80ZTlKrNxFutztsgUuin5D2eb80c4PBI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "allpairspy" ];

  meta = {
    description = "Pairwise test combinations generator";
    homepage = "https://github.com/thombashi/allpairspy";
    license = lib.licenses.mit;
  };
}
