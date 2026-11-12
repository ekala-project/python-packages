{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools_80,
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "graphql-subscription-manager";
  version = "0.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Danielhiversen";
    repo = "PyGraphqlWebsocketManager";
    tag = finalAttrs.version;
    hash = "sha256-6/REvY5QxsAPV41Pvg8vrJPYbDrGUrpOPn0vzIcCu0k=";
  };

  build-system = [ setuptools ];

  dependencies = [
    setuptools_80 # needs pkg_resources at runtime
    websockets
  ];

  # no tests implemented

  pythonImportsCheck = [ "graphql_subscription_manager" ];

  meta = {
    description = "Python3 library for graphql subscription manager";
    homepage = "https://github.com/Danielhiversen/PyGraphqlWebsocketManager";
    license = lib.licenses.mit;
  };
})
