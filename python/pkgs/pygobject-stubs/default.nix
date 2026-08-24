{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "pygobject-stubs";
  version = "2.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pygobject";
    repo = "pygobject-stubs";
    tag = "v${version}";
    hash = "sha256-3gWz/mWAMoXAHMfCFv3ri680iuMm0WLtGyMODujq31M=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  # This package does not include any tests.

  meta = {
    description = "PEP 561 Typing Stubs for PyGObject";
    homepage = "https://github.com/pygobject/pygobject-stubs";
    license = lib.licenses.lgpl21Plus;
    maintainers = [ ];
  };
}
