{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  packaging,
}:

buildPythonPackage rec {
  pname = "lazy-loader";
  version = "0.4";
  pyproject = true;

  src = fetchPypi {
    pname = "lazy_loader";
    inherit version;
    hash = "sha256-R8dRglibkaThqFoTbAdChaWtTZ85xj4Nf7djkcRXTNE=";
  };

  build-system = [ setuptools ];

  dependencies = [ packaging ];

  pythonImportsCheck = [ "lazy_loader" ];

  meta = {
    homepage = "https://github.com/scientific-python/lazy_loader";
    description = "Populate library namespace without incurring immediate import costs";
    license = lib.licenses.bsd3;
  };
}
