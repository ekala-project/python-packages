{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  websockets,
}:

buildPythonPackage rec {
  pname = "graphql-subscription-manager";
  version = "0.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Danielhiversen";
    repo = "PyGraphqlWebsocketManager";
    tag = version;
    hash = "sha256-6/REvY5QxsAPV41Pvg8vrJPYbDrGUrpOPn0vzIcCu0k=";
  };

  build-system = [ setuptools ];

  dependencies = [
    setuptools
    websockets
  ];

  # no tests implemented

  pythonImportsCheck = [ "graphql_subscription_manager" ];

  meta = {
    description = "Python3 library for graphql subscription manager";
    homepage = "https://github.com/Danielhiversen/PyGraphqlWebsocketManager";
    license = lib.licenses.mit;
  };
}
