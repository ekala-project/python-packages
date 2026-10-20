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
  version = "0.12.1";
  pyproject = true;

  src = fetchPypi {
    pname = "WSME";
    inherit (finalAttrs) version;
    hash = "sha256-m36yJErzxwSskUte0iGVS7aK3QqLKy84okSwZ7M3mS0=";
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
