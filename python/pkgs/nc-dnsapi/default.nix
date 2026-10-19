{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "nc-dnsapi";
  version = "0.1.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nbuchwitz";
    repo = "nc_dnsapi";
    tag = "v${version}";
    hash = "sha256-OE4+wJbJbUZ+YB5J5OyvytLFCcrnXCeZEqmphHKKprQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "nc_dnsapi" ];

  # no tests

  meta = {
    description = "API wrapper for the netcup DNS api";
    homepage = "https://github.com/nbuchwitz/nc_dnsapi";
    license = lib.licenses.gpl3;
  };
}
