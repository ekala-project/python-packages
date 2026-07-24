{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  build,
  cython,
  findutils,
  pip,
  setuptools-scm,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "extension-helpers";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "astropy";
    repo = "extension-helpers";
    tag = "v${version}";
    hash = "sha256-coSgaPoz93CqJRb65xYs1sNOwoGhcxWGJF7Jc9N2W1I=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ setuptools ];
  pythonImportsCheck = [ "extension_helpers" ];
  meta = {
    description = "Helpers to assist with building Python packages with compiled C/Cython extensions";
    homepage = "https://github.com/astropy/extension-helpers";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
