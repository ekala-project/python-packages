{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pathable,
  pyyaml,
  referencing,
}:

buildPythonPackage rec {
  pname = "jsonschema-path";
  version = "0.4.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "p1c2u";
    repo = "jsonschema-path";
    tag = version;
    hash = "sha256-abAhWtBnZUeg1VGphfnvxPzSnPM6VjM/XKLPJVIrIXg=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    pathable
    pyyaml
    referencing
  ];

  pythonImportsCheck = [ "jsonschema_path" ];

  meta = {
    description = "JSONSchema Spec with object-oriented paths";
    homepage = "https://github.com/p1c2u/jsonschema-path";
    license = lib.licenses.asl20;
  };
}
