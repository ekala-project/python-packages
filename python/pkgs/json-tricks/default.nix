{
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  buildPythonPackage,
}:

buildPythonPackage rec {
  pname = "json-tricks";
  version = "3.17.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mverleg";
    repo = "pyjson_tricks";
    tag = "v${version}";
    hash = "sha256-xddMc4PvVI+mqB3eeVqECZmdeSKAURsdbOnUAXahqM0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "json_tricks" ];

  meta = {
    description = "Extra features for Python JSON handling";
    homepage = "https://github.com/mverleg/pyjson_tricks";
    license = lib.licenses.bsd3;
  };
}
