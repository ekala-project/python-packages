{
  lib,
  buildPythonPackage,
  fetchPypi,
  pbr,
  setuptools,
  importlib-metadata,
  simplegeneric,
  netaddr,
  pytz,
  webob,
}:

buildPythonPackage (finalAttrs: {
  pname = "wsme";
  version = "0.13.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-W/MgEO2UPs+z8IeVpGAuJoPfXV6ozHHq8evj9EnzmDM=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ pbr ];

  dependencies = [
    importlib-metadata
    netaddr
    pytz
    simplegeneric
    webob
  ];

  meta = {
    description = "Simplify the writing of REST APIs, and extend them with additional protocols";
    homepage = "https://pythonhosted.org/WSME/";
    license = lib.licenses.mit;
  };
})
