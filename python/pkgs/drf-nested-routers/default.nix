{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  django,
  djangorestframework,
  pytest-django,
  ipdb,
}:

buildPythonPackage rec {
  pname = "drf-nested-routers";
  version = "0.95.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "alanjds";
    repo = "drf-nested-routers";
    tag = "v${version}";
    hash = "sha256-9oB6pmhZJVvVJeueY44q9ST1JgjmK1FF8QMx7mX5ZFI=";
  };

  buildInputs = [ django ];

  propagatedBuildInputs = [ djangorestframework ];
  meta = {
    homepage = "https://github.com/alanjds/drf-nested-routers";
    description = "Provides routers and fields to create nested resources in the Django Rest Framework";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
