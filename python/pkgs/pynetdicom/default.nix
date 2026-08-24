{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  pydicom,
}:

buildPythonPackage rec {
  pname = "pynetdicom";
  version = "3.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydicom";
    repo = "pynetdicom";
    tag = "v${version}";
    hash = "sha256-4LISckHH+fVBmPcBr8rM62E6r3IkKAgdUneVHyc5Vm8=";
  };

  build-system = [ flit-core ];

  dependencies = [ pydicom ];

  pythonImportsCheck = [ "pynetdicom" ];

  meta = {
    description = "Python implementation of the DICOM networking protocol";
    homepage = "https://github.com/pydicom/pynetdicom";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
