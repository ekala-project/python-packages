{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, traitlets
,
}:

buildPythonPackage rec {
  pname = "traittypes";
  version = "0.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyter-widgets";
    repo = "traittypes";
    tag = version;
    hash = "sha256-RwEZs4QFK+IrPFPBI7+jnQSFQryQFzEbrnOF8OyExuk=";
  };

  build-system = [ setuptools ];

  dependencies = [ traitlets ];

  pythonImportsCheck = [ "traittypes" ];

  meta = {
    description = "Trait types for NumPy, SciPy, XArray, and Pandas";
    homepage = "https://github.com/jupyter-widgets/traittypes";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
