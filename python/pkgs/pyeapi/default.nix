{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, netaddr
,
}:

buildPythonPackage rec {
  pname = "pyeapi";
  version = "1.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arista-eosplus";
    repo = "pyeapi";
    tag = "v${version}";
    hash = "sha256-eGNBQSnYMC9YVCw5mBRH6XRq139AcqFm6HnO2FUzLEE=";
  };

  build-system = [ setuptools ];

  dependencies = [ netaddr ];

  pythonImportsCheck = [ "pyeapi" ];

  meta = {
    description = "Client for Arista eAPI";
    homepage = "https://github.com/arista-eosplus/pyeapi";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
