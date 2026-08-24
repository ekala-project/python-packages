{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage {
  pname = "zipfile2";
  version = "0.0.12-unstable-2024-09-28";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cournape";
    repo = "zipfile2";
    #tag = "v${version}";
    rev = "8823f7253772e5c5811343306a591c00c764c6d0";
    hash = "sha256-jDOyIj0sQS1dIsar4nyk5V2mme3Zc6VTms49/4n93ho=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zipfile2" ];

  meta = {
    description = "Backwards-compatible improved zipfile class";
    homepage = "https://github.com/cournape/zipfile2";
    license = lib.licenses.psfl;
    maintainers = [ ];
  };
}
