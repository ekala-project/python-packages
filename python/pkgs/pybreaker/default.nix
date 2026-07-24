{
  buildPythonPackage,
  fakeredis,
  fetchFromGitHub,
  flit-core,
  lib,
  pybreaker,
  redis,
  tornado,
}:

buildPythonPackage rec {
  pname = "pybreaker";
  version = "1.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "danielfm";
    repo = "pybreaker";
    tag = "v${version}";
    hash = "sha256-Cxer6EDfi4fvs7XENwpUUMcCiRX6eDNJz0s57l9U+zQ=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "pybreaker" ];
  meta = {
    description = "Python implementation of the Circuit Breaker pattern";
    homepage = "https://github.com/danielfm/pybreaker";
    license = lib.licenses.bsd3;
    maintainers = [ lib.maintainers.dotlambda ];
  };
}
