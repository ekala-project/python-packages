{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wirerope,
}:

buildPythonPackage rec {
  pname = "methodtools";
  version = "0.4.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "youknowone";
    repo = "methodtools";
    rev = version;
    hash = "sha256-Y5VdYVSb3A+32waUUoIDDGW+AhRapN71pebTTlJC0es=";
  };

  build-system = [ setuptools ];

  dependencies = [ wirerope ];

  pythonImportsCheck = [ "methodtools" ];
  meta = {
    description = "Expands the functools lru_cache to classes";
    homepage = "https://github.com/youknowone/methodtools";
    license = lib.licenses.bsd2WithViews;
    maintainers = [ ];
  };
}
