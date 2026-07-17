{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cstruct";
  version = "6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "andreax79";
    repo = "python-cstruct";
    tag = "v${version}";
    hash = "sha256-jLpuvApEP8Acva/OV3ulwl4+dOy8t/cD/LFJWWnD3BM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "cstruct" ];

  meta = {
    description = "C-style structs for Python";
    homepage = "https://github.com/andreax79/python-cstruct";
    license = lib.licenses.mit;
  };
}
