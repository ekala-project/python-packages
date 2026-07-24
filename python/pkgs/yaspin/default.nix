{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pytest-mock,
  pytest-xdist,
  termcolor,
}:

buildPythonPackage rec {
  pname = "yaspin";
  version = "3.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pavdmyt";
    repo = "yaspin";
    tag = "v${version}";
    hash = "sha256-uHW0lSkmNYZh4OGCFgaiIoqhY6KFojSyyEezTNxYqMw=";
  };

  build-system = [ poetry-core ];

  dependencies = [ termcolor ];

  pythonRelaxDeps = [
    "termcolor"
  ];
  # tests assert for \033 which gets turned off in termcolor when TERM dumb is used which is used by nix
  pythonImportsCheck = [ "yaspin" ];

  meta = {
    description = "Yet Another Terminal Spinner";
    homepage = "https://github.com/pavdmyt/yaspin";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
