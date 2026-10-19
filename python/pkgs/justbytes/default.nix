{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  justbases,
  unittestCheckHook,
  hypothesis,
}:

buildPythonPackage (finalAttrs: {
  pname = "justbytes";
  version = "0.15.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mulkieran";
    repo = "justbytes";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+jwIK1ZU+j58VoOfZAm7GdFy7KHU28khwzxhYhcws74=";
  };

  build-system = [ setuptools ];

  dependencies = [ justbases ];
  nativeCheckInputs = [
    unittestCheckHook
    hypothesis
  ];

  meta = {
    description = "Computing with and displaying bytes";
    homepage = "https://github.com/mulkieran/justbytes";
    license = lib.licenses.lgpl2Plus;
  };
})
