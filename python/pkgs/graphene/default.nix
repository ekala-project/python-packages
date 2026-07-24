{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  graphql-core,
  graphql-relay,
  pytest-asyncio,
  pytest-benchmark,
  pytest-mock,
  typing-extensions,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "graphene";
  version = "3.4.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "graphql-python";
    repo = "graphene";
    tag = "v${version}";
    hash = "sha256-K1IGKK3nTsRBe2D/cKJ/ahnAO5xxjf4gtollzTwt1zU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    graphql-core
    graphql-relay
    python-dateutil
    typing-extensions
  ];
  pythonImportsCheck = [ "graphene" ];

  meta = {
    description = "GraphQL Framework for Python";
    homepage = "https://github.com/graphql-python/graphene";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
