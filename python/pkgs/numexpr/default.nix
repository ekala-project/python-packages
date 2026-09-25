{
  lib,
  buildPythonPackage,
  fetchPypi,
  numpy,
  setuptools,
}:

buildPythonPackage rec {
  pname = "numexpr";
  version = "2.14.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5xROg+qeWB8ic+AwTxWDZzbE5HDivS43jOYXZiocong=";
  };

  build-system = [
    setuptools
    numpy
  ];

  dependencies = [ numpy ];

  preBuild = ''
    # Remove existing site.cfg, use the one we built for numpy
    ln -s ${numpy.cfg} site.cfg
  '';
  # tests check for OMP_NUM_THREADS application and complete quick enough
  env.dontLimitCheckPhaseThreads = 1;
  postCheck = ''
    popd
  '';
  pythonImportsCheck = [ "numexpr" ];

  meta = {
    description = "Fast numerical array expression evaluator for NumPy";
    homepage = "https://github.com/pydata/numexpr";
    license = lib.licenses.mit;
  };
}
