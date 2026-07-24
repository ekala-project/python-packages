{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "dotty-dict";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pawelzny";
    repo = "dotty_dict";
    tag = "v${version}";
    hash = "sha256-kY7o9wgfsV7oc5twOeuhG47C0Js6JzCt02S9Sd8dSGc=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "dotty_dict" ];
  meta = {
    description = "Dictionary wrapper for quick access to deeply nested keys";
    homepage = "https://dotty-dict.readthedocs.io";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
