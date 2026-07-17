{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  xmod,
}:

buildPythonPackage rec {
  pname = "runs";
  version = "1.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ncGBXiiVz7Okgxexc7nx6sm6VUmzaoR7XMYMO/guzvE=";
  };

  build-system = [ poetry-core ];

  dependencies = [ xmod ];

  pythonImportsCheck = [ "runs" ];

  meta = {
    description = "Run a block of text as a subprocess";
    homepage = "https://github.com/rec/runs";
    license = lib.licenses.mit;
  };
}
