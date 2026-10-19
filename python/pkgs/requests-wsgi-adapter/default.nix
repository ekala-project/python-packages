{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "requests-wsgi-adapter";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-WncJ6Qq/SdGB9sMqo3eUU39yXeD23UI2K8jIyQgSyHg=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "wsgiadapter" ];

  meta = {
    description = "WSGI Transport Adapter for Requests";
    homepage = "https://github.com/seanbrant/requests-wsgi-adapter";
    license = lib.licenses.bsd3;
  };
})
