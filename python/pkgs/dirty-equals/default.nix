{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pydantic,
  pytest-examples,
  pytz,
}:

let
  dirty-equals = buildPythonPackage rec {
    pname = "dirty-equals";
    version = "0.11.0";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "samuelcolvin";
      repo = "dirty-equals";
      tag = "v${version}";
      hash = "sha256-JFKWrbMdxhvSBbjQ+S9HPW87CK+5ZZiXHg8Wltlv2YY=";
    };

    build-system = [ hatchling ];

    dependencies = [ pytz ];

    doCheck = false;

    passthru.tests.pytest = dirty-equals.overrideAttrs { doCheck = true; };
    pythonImportsCheck = [ "dirty_equals" ];

    meta = {
      description = "Module for doing dirty (but extremely useful) things with equals";
      homepage = "https://github.com/samuelcolvin/dirty-equals";
      license = lib.licenses.mit;
      maintainers = [ ];
    };
  };
in
dirty-equals
