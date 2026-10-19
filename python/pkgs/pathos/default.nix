{
  lib,
  buildPythonPackage,
  dill,
  fetchFromGitHub,
  # build-system
  setuptools,
  multiprocess,
  pox,
  ppft,
}:

buildPythonPackage (finalAttrs: {
  pname = "pathos";
  version = "0.3.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "uqfoundation";
    repo = "pathos";
    tag = finalAttrs.version;
    hash = "sha256-9ejrHHgSbDrbuq1bktyiKPJnQ1l52ug/lnJJbac7x4s=";
  };

  build-system = [ setuptools ];

  dependencies = [
    dill
    pox
    ppft
    multiprocess
  ];

  # Require network

  pythonImportsCheck = [ "pathos" ];

  meta = {
    description = "Parallel graph management and execution in heterogeneous computing";
    homepage = "https://pathos.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
})
