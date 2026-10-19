{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "justnimbus";
  version = "0.7.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kvanzuijlen";
    repo = "justnimbus";
    tag = finalAttrs.version;
    hash = "sha256-FsuvpmMWBYI1LheO3NFfCeaW4m3YQ41Tc81TP3gdNqo=";
  };

  nativeBuildInputs = [ poetry-core ];

  dependencies = [ requests ];

  # Module has no tests

  pythonImportsCheck = [ "justnimbus" ];

  meta = {
    description = "Library for the JustNimbus API";
    homepage = "https://github.com/kvanzuijlen/justnimbus";
    license = lib.licenses.asl20;
  };
})
