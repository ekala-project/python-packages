{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "chainmap";
  version = "1.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5CqqSz4vZhAqEb/VYwaXBL+/2E/ctRe1ZO/9c2v1PNk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "chainmap" ];

  meta = {
    description = "Backport/clone of ChainMap";
    homepage = "https://bitbucket.org/jeunice/chainmap";
    license = lib.licenses.psfl;
  };
}
