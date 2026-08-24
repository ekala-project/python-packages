{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
,
}:

buildPythonPackage rec {
  pname = "property-cached";
  version = "1.6.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "althonos";
    repo = "property-cached";
    tag = "v${version}";
    hash = "sha256-8kityZ++1TS22Ff7a5x5bQi0QBaHsNaP4E/Man8A28A=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "property_cached" ];

  meta = {
    description = "Decorator for caching properties in classes";
    homepage = "https://github.com/althonos/property-cached";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
