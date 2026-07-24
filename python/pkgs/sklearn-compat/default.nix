{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  scikit-learn,
}:

buildPythonPackage rec {
  pname = "sklearn-compat";
  version = "0.1.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sklearn-compat";
    repo = "sklearn-compat";
    tag = version;
    hash = "sha256-bziweext3Mqq0Wa9KlX1gp5NpVYX8IpcvS1gTjxQa70=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    scikit-learn
  ];
  pythonImportsCheck = [
    "sklearn_compat"
  ];

  meta = {
    description = "Ease multi-version support for scikit-learn compatible library";
    homepage = "https://github.com/sklearn-compat/sklearn-compat";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
