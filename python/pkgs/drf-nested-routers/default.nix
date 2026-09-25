{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  django,
  djangorestframework,
  pytest-django,
  ipdb,
}:

buildPythonPackage rec {
  pname = "drf-nested-routers";
  version = "0.95.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alanjds";
    repo = "drf-nested-routers";
    tag = "v${version}";
    hash = "sha256-09yMZW2dvXHQ8oak5skWQKCzqn9pcsgXpkQAkfR1lyA=";
  };

  build-system = [ setuptools ];

  dependencies = [ djangorestframework ];
  meta = {
    homepage = "https://github.com/alanjds/drf-nested-routers";
    description = "Provides routers and fields to create nested resources in the Django Rest Framework";
    license = lib.licenses.asl20;
  };
}
