{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tzdata";
  version = "2026.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ShUYuJkwhqeYJSPgcWQ/PA5fIT51shMY54vKv/+dFBU=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "tzdata" ];

  meta = {
    description = "Provider of IANA time zone data";
    homepage = "https://github.com/python/tzdata";
    license = lib.licenses.asl20;
  };
}
