{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "openidc-client";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-aA6WnK4Ywwrb3dagh+0J9qKWtJN7TIvGm+gTvbv6mEc=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "openidc_client" ];

  meta = {
    description = "CLI python OpenID Connect client with token caching and management";
    homepage = "https://github.com/puiterwijk";
    license = lib.licenses.mit;
  };
}
