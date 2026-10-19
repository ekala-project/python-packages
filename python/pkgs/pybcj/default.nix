{
  lib,
  buildPythonPackage,
  fetchFromCodeberg,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "pybcj";
  version = "1.0.3";
  pyproject = true;

  src = fetchFromCodeberg {
    owner = "miurahr";
    repo = "pybcj";
    tag = "v${finalAttrs.version}";
    hash = "sha256-nFPk+1V0VXDvFA2w42w4UBF9T6adwBXfH78kDNnMGSU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "bcj" ];

  meta = {
    description = "BCJ (Branch-Call-Jump) filter for Python";
    homepage = "https://codeberg.org/miurahr/pybcj";
    license = lib.licenses.gpl2Plus;
  };
})
