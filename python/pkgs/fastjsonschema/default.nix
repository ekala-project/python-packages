{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "fastjsonschema";
  version = "2.21.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "horejsek";
    repo = "python-fastjsonschema";
    rev = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-EV7/vPYeJSG2uTLpENso9WhcR98/ZTbanKffJfmfZz4=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "fastjsonschema" ];

  meta = {
    description = "JSON schema validator for Python";
    downloadPage = "https://github.com/horejsek/python-fastjsonschema";
    homepage = "https://horejsek.github.io/python-fastjsonschema/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
