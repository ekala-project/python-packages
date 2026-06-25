{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  python-dateutil,
  types-python-dateutil,
  tzdata,
}:

buildPythonPackage (finalAttrs: {
  pname = "arrow";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "crsmithdev";
    repo = "arrow";
    tag = finalAttrs.version;
    hash = "sha256-nK78Lo+7eitB+RS7BZkM+BNudviirAowc4a1uQdLC0w=";
  };

  build-system = [ flit-core ];

  dependencies = [
    python-dateutil
    types-python-dateutil
    tzdata
  ];

  pythonImportsCheck = [ "arrow" ];

  meta = {
    description = "Python library for date manipulation";
    homepage = "https://github.com/crsmithdev/arrow";
    license = lib.licenses.asl20;
  };
})
