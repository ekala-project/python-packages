{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "docstring-parser";
  version = "0.17.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rr-";
    repo = "docstring_parser";
    tag = version;
    hash = "sha256-hR+i1HU/ZpN6I3a8k/Wv2OrXgB4ls/A5OHZRqxEZS78=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "docstring_parser" ];

  meta = {
    description = "Parse Python docstrings in various flavors";
    homepage = "https://github.com/rr-/docstring_parser";
    license = lib.licenses.mit;
  };
}
