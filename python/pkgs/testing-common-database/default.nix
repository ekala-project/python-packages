{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "testing-common-database";
  version = "2.0.3";
  pyproject = true;

  src = fetchPypi {
    pname = "testing.common.database";
    inherit version;
    hash = "sha256-ll2AsphTFTJdw1jDBhsXSnEvTU1b9qgLWLEfmh3YbXM=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace src/testing/common/database.py \
      --replace-fail "collections.Callable" "collections.abc.Callable"
  '';

  pythonImportsCheck = [ "testing.common.database" ];

  meta = {
    description = "Utilities for testing.* packages";
    homepage = "https://github.com/tk0miya/testing.common.database";
    license = lib.licenses.asl20;
  };
}
