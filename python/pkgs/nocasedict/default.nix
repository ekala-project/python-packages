{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  setuptools,
  setuptools-scm,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "nocasedict";
  version = "2.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pywbem";
    repo = "nocasedict";
    tag = finalAttrs.version;
    hash = "sha256-zrFmADdfa3QL4o7Idkp3tDHIihQfQj8zxtiox/qeP9g=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ typing-extensions ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "nocasedict" ];

  meta = {
    description = "Case-insensitive ordered dictionary for Python";
    homepage = "https://github.com/pywbem/nocasedict";
    license = lib.licenses.lgpl21Plus;
    maintainers = [ ];
  };
})
