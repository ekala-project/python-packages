{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "frozenlist2";
  version = "1.0.0";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "rohanpm";
    repo = "frozenlist2";
    tag = "v${finalAttrs.version}";
    hash = "sha256-fF0oFZ2q1wRH7IKBlCjm3Za4xtEMSHyEaGL09rHgtTY=";
  };

  dependencies = [ setuptools ];

  pythonImportsCheck = [ "frozenlist2" ];

  meta = {
    description = "Immutable list for Python";
    homepage = "https://github.com/rohanpm/frozenlist2";
    license = lib.licenses.gpl3Plus;
  };
})
