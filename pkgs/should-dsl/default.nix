{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "should-dsl";
  version = "2.1.2";
  pyproject = true;

  src = fetchPypi {
    pname = "should_dsl";
    inherit version;
    hash = "sha256-NvdT2Q+9+E7yt6ngeBPj76xyU3b+t6eTVJ8//3oDIyo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "should_dsl" ];

  meta = {
    description = "Should assertions in Python as clear and readable as possible";
    homepage = "https://github.com/nsi-iff/should-dsl";
    license = lib.licenses.mit;
  };
}
