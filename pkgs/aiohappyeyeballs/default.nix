{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "aiohappyeyeballs";
  version = "2.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bdraco";
    repo = "aiohappyeyeballs";
    tag = "v${version}";
    hash = "sha256-qqe/h633uEbJPpdsuCzZKW86Z6BQUmPdCju1vg7OLXc=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "aiohappyeyeballs" ];

  meta = {
    description = "Happy Eyeballs for pre-resolved hosts";
    homepage = "https://github.com/bdraco/aiohappyeyeballs";
    license = lib.licenses.psfl;
  };
}
