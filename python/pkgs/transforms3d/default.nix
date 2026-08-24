{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  versioneer,
  numpy,
}:

buildPythonPackage rec {
  pname = "transforms3d";
  version = "0.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "matthew-brett";
    repo = "transforms3d";
    tag = version;
    hash = "sha256-9wICu7zNYF54e6xcDpZxqctB4GVu5Knf79Z36016Rpw=";
  };

  build-system = [
    setuptools
    versioneer
  ];

  dependencies = [
    numpy
  ];

  pythonImportsCheck = [ "transforms3d" ];

  meta = {
    homepage = "https://matthew-brett.github.io/transforms3d";
    description = "Convert between various geometric transformations";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
