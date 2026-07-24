{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  dunamai,
  jinja2,
  tomlkit,
}:

buildPythonPackage rec {
  pname = "uv-dynamic-versioning";
  version = "0.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ninoseki";
    repo = "uv-dynamic-versioning";
    tag = "v${version}";
    hash = "sha256-PP8nDQD3T/0MIYX5TNUinDEuGt57+AzYFwMeGiRQ2Yg=";
  };

  build-system = [ hatchling ];

  dependencies = [
    dunamai
    hatchling
    jinja2
    tomlkit
  ];

  pythonImportsCheck = [ "uv_dynamic_versioning" ];

  setupHook = ./setup-hook.sh;

  meta = {
    description = "Dynamic versioning based on VCS tags for uv/hatch project";
    homepage = "https://github.com/ninoseki/uv-dynamic-versioning";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
