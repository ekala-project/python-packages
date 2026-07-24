{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  webencodings,
}:

buildPythonPackage rec {
  pname = "tinyhtml5";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "CourtBouillon";
    repo = "tinyhtml5";
    tag = version;
    hash = "sha256-PSDlCLPK3JVMq5dyt6xzNb4xx3F8Jwf8HAgYLKoXH+E=";
  };

  build-system = [
    flit-core
  ];

  dependencies = [
    webencodings
  ];
  pythonImportsCheck = [
    "tinyhtml5"
  ];

  meta = {
    description = "Tiny HTML5 parser";
    homepage = "https://github.com/CourtBouillon/tinyhtml5";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
