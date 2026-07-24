{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "absl-py";
  version = "2.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "abseil";
    repo = "abseil-py";
    tag = "v${version}";
    hash = "sha256-BnR9QnZ5AaSlboQuQnX4UKGjAVVpyzMLZ68Do3VZrE0=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "absl" ];

  meta = {
    description = "Abseil Python Common Libraries";
    homepage = "https://github.com/abseil/abseil-py";
    license = lib.licenses.asl20;
  };
}
