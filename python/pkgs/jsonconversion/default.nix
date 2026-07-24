{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  pdm-backend,
  pythonAtLeast,
  setuptools,
}:

buildPythonPackage rec {
  pname = "jsonconversion";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "DLR-RM";
    repo = "python-jsonconversion";
    tag = version;
    hash = "sha256-yWRpILAkwCvgh5bMiN9/XmS6U9zIQdDS8KVeTYxzDDw=";
  };

  build-system = [ pdm-backend ];

  pythonRemoveDeps = [
    "pytest-runner"
    "pytest"
  ];

  pythonRelaxDeps = [ "numpy" ];

  dependencies = [
    numpy
    setuptools
  ];
  pythonImportsCheck = [ "jsonconversion" ];

  disabledTests = lib.optionals (pythonAtLeast "3.13") [ "test_dict" ];

  meta = {
    description = "This python module helps converting arbitrary Python objects into JSON strings and back";
    homepage = "https://github.com/DLR-RM/python-jsonconversion";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
