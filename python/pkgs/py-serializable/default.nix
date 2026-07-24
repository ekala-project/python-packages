{
  lib,
  buildPythonPackage,
  defusedxml,
  fetchFromGitHub,
  lxml,
  poetry-core,
  xmldiff,
}:

buildPythonPackage rec {
  pname = "py-serializable";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "madpah";
    repo = "serializable";
    tag = "v${version}";
    hash = "sha256-nou1/80t9d2iKOdZZbcN4SI3dlvuC8T55KMCP/cDEEU=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [ "defusedxml" ];

  dependencies = [ defusedxml ];
  pythonImportsCheck = [ "py_serializable" ];
  meta = {
    description = "Library to aid with serialisation and deserialisation to/from JSON and XML";
    homepage = "https://github.com/madpah/serializable";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
