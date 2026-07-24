{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
  decopatch,
  makefun,
  packaging,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-cases";
  version = "3.10.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_cases";
    inherit version;
    hash = "sha256-RR+ePs1dLYGkNiwQxEESb1s9GuOn769Z9gsfuTDfLWk=";
  };

  build-system = [ setuptools-scm ];

  postPatch = ''
        # pytest 9.1 removed the func_name field from IdMaker, reducing its
        # positional argument count from 7 to 6. Add a version guard so that
        # the correct number of arguments is passed at import time.
        substituteInPlace src/pytest_cases/common_pytest_marks.py \
          --replace-fail \
            "PYTEST9_OR_GREATER = PYTEST_VERSION >= Version('9.0.0')" \
            "PYTEST9_OR_GREATER = PYTEST_VERSION >= Version('9.0.0')
    PYTEST91_OR_GREATER = PYTEST_VERSION >= Version('9.1.0')"
        substituteInPlace src/pytest_cases/common_pytest.py \
          --replace-fail \
            "PYTEST8_OR_GREATER, PYTEST84_OR_GREATER" \
            "PYTEST8_OR_GREATER, PYTEST84_OR_GREATER, PYTEST91_OR_GREATER"
        substituteInPlace src/pytest_cases/common_pytest.py \
          --replace-fail \
            "_idval = IdMaker([], [], None, None, None, None, None)._idval" \
            "_idval = (IdMaker([], [], None, None, None, None) if PYTEST91_OR_GREATER else IdMaker([], [], None, None, None, None, None))._idval"
  '';

  dependencies = [
    decopatch
    makefun
    packaging
    pytest
  ];

  pythonImportsCheck = [ "pytest_cases" ];

  meta = {
    description = "Separate test code from test cases in pytest";
    homepage = "https://github.com/smarie/python-pytest-cases";
    license = lib.licenses.bsd3;
  };
}
