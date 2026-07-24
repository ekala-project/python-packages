{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  python-dateutil,
  tokenize-rt,
  freezegun,
}:

buildPythonPackage (finalAttrs: {
  pname = "time-machine";
  version = "3.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "adamchainz";
    repo = "time-machine";
    tag = finalAttrs.version;
    hash = "sha256-UWoKvNz0ojVZtkIUGT02zJitza+mkyToANQMsU64xL4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-dateutil
  ];

  optional-dependencies.cli = [
    tokenize-rt
  ];
  pythonImportsCheck = [ "time_machine" ];

  meta = {
    description = "Travel through time in your tests";
    homepage = "https://github.com/adamchainz/time-machine";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
