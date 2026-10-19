{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  mutagen,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "music-tag";
  version = "0.4.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Cqtubu2o3w9TFuwtIZC9dFYbfgNWKrCRzo1Wh828//Y=";
  };

  build-system = [ setuptools ];

  dependencies = [ mutagen ];

  nativeCheckInputs = [ pytestCheckHook ];

  enabledTestPaths = [ "test" ];

  # Tests fail: ModuleNotFoundError: No module named '_test_common'

  pythonImportsCheck = [ "music_tag" ];

  meta = {
    description = "Simple interface to edit audio file metadata";
    homepage = "https://github.com/KristoforMaynard/music-tag";
    license = lib.licenses.mit;
  };
}
