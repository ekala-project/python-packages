{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  numpy,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydicom";
  version = "3.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydicom";
    repo = "pydicom";
    tag = "v${finalAttrs.version}";
    hash = "sha256-d7fFsNKzUoGUDg9E6KVHq64g7p8QzIAAEIk3vLQ+rQ0=";
  };

  build-system = [ flit-core ];

  dependencies = [
    numpy
  ];

  optional-dependencies = {
    pixeldata = [
      pillow
    ];
  };

  pythonImportsCheck = [ "pydicom" ];

  doCheck = false;

  meta = {
    description = "Pure Python package for DICOM medical file reading and writing";
    homepage = "https://pydicom.github.io";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
