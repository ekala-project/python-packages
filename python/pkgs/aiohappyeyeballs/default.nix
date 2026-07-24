{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "aiohappyeyeballs";
  version = "2.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bdraco";
    repo = "aiohappyeyeballs";
    tag = "v${version}";
    hash = "sha256-smpdmmut4wYekVew13KZXluI71lSUdZriPejUumkLNU=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "aiohappyeyeballs" ];

  meta = {
    description = "Happy Eyeballs for pre-resolved hosts";
    homepage = "https://github.com/bdraco/aiohappyeyeballs";
    license = lib.licenses.psfl;
  };
}
