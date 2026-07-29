{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rapidjson,
  setuptools,
  replaceVars,
}:

buildPythonPackage rec {
  version = "1.23";
  pname = "python-rapidjson";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-rapidjson";
    repo = "python-rapidjson";
    tag = "v${version}";
    hash = "sha256-BlEmEvwGAm3Ix2YwJSwrxgqqANqmgiWRiRWP91JITio=";
  };

  patches = [
    (replaceVars ./rapidjson-include-dir.patch {
      rapidjson = lib.getDev rapidjson;
    })
  ];

  build-system = [ setuptools ];
  meta = {
    homepage = "https://github.com/python-rapidjson/python-rapidjson";
    description = "Python wrapper around rapidjson";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
