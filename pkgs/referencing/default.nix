{
  lib,
  attrs,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  rpds-py,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "referencing";
  version = "0.37.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-jsonschema";
    repo = "referencing";
    tag = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-4e06rzvIOyWAgkpzAisc4uUK8pWshDZiQ6qpvJCq3GY=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    attrs
    rpds-py
    typing-extensions
  ];

  pythonImportsCheck = [ "referencing" ];

  meta = {
    description = "Cross-specification JSON referencing";
    homepage = "https://github.com/python-jsonschema/referencing";
    license = lib.licenses.mit;
  };
}
