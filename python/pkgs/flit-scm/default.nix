{
  lib,
  buildPythonPackage,
  fetchFromGitLab,
  flit-core,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "flit-scm";
  version = "1.7.0";
  pyproject = true;

  src = fetchFromGitLab {
    owner = "WillDaSilva";
    repo = "flit_scm";
    tag = finalAttrs.version;
    hash = "sha256-2nx9kWq/2TzauOW+c67g9a3JZ2dhBM4QzKyK/sqWOPo=";
  };

  nativeBuildInputs = [
    flit-core
    setuptools-scm
  ];

  dependencies = [
    flit-core
    setuptools-scm
  ];

  pythonImportsCheck = [ "flit_scm" ];

  meta = {
    description = "PEP 518 build backend that uses setuptools_scm to generate a version file from your version control system, then flit to build the package";
    homepage = "https://gitlab.com/WillDaSilva/flit_scm";
    license = lib.licenses.mit;
  };
})
