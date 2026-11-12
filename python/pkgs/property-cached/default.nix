{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools_80,
}:

buildPythonPackage (finalAttrs: {
  pname = "property-cached";
  version = "1.6.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "althonos";
    repo = "property-cached";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8kityZ++1TS22Ff7a5x5bQi0QBaHsNaP4E/Man8A28A=";
  };

  # setup.py imports pkg_resources
  build-system = [ setuptools_80 ];

  pythonImportsCheck = [ "property_cached" ];

  meta = {
    description = "Decorator for caching properties in classes";
    homepage = "https://github.com/althonos/property-cached";
    license = lib.licenses.bsd3;
  };
})
