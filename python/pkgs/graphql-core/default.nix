{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "graphql-core";
  version = "3.2.12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "graphql-python";
    repo = "graphql-core";
    tag = "v${version}";
    hash = "sha256-KzPjD/5HGPI2lrsCfW8aocXMhXc7YB7N+WUukc9Ru3s=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail ', "setuptools>=59,<85"' ""

    # avoid big pytest-benchmark dependency
    substituteInPlace setup.cfg \
      --replace-fail "addopts = --benchmark-disable" ""
  '';

  build-system = [
    poetry-core
  ];

  pythonImportsCheck = [ "graphql" ];

  meta = {
    description = "Port of graphql-js to Python";
    homepage = "https://github.com/graphql-python/graphql-core";
    license = lib.licenses.mit;
  };
}
