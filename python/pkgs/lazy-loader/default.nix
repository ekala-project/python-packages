{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  packaging,
}:

buildPythonPackage (finalAttrs: {
  pname = "lazy-loader";
  version = "0.6";
  pyproject = true;

  src = fetchPypi {
    pname = "lazy_loader";
    inherit (finalAttrs) version;
    hash = "sha256-L0t4JNZAGVhjkAigyuIMd2th3/YZrM1okGk+LegmAWc=";
  };

  build-system = [ setuptools ];

  dependencies = [ packaging ];

  pythonImportsCheck = [ "lazy_loader" ];

  meta = {
    homepage = "https://github.com/scientific-python/lazy_loader";
    description = "Populate library namespace without incurring immediate import costs";
    license = lib.licenses.bsd3;
  };
})
