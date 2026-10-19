{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  # build-system
  setuptools,
  freezegun,
  pytest,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-freezegun";
  version = "0.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ktosiek";
    repo = "pytest-freezegun";
    tag = finalAttrs.version;
    sha256 = "10c4pbh03b4s1q8cjd75lr0fvyf9id0zmdk29566qqsmaz28npas";
  };

  build-system = [ setuptools ];

  patches = [
    (fetchpatch {
      # https://github.com/ktosiek/pytest-freezegun/pull/38
      name = "pytest-freezegun-drop-distutils.patch";
      url = "https://github.com/ktosiek/pytest-freezegun/commit/03d7107a877e8f07617f931a379f567d89060085.patch";
      hash = "sha256-/7GTQdidVbE2LT5hwxjEc2dr+aWr6TX1131U4KMQhns=";
    })
  ];

  buildInputs = [ pytest ];

  dependencies = [ freezegun ];
  meta = {
    description = "Wrap tests with fixtures in freeze_time";
    homepage = "https://github.com/ktosiek/pytest-freezegun";
    license = lib.licenses.mit;
  };
})
