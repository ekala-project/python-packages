{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "hiredis";
  version = "3.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-widZLMVrffJHq+R1XCZyOWW+aJcr4hSfpEGsM9ghMbo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "hiredis" ];

  meta = {
    description = "Wraps protocol parsing code in hiredis, speeds up parsing of multi bulk replies";
    homepage = "https://github.com/redis/hiredis-py";
    license = lib.licenses.bsd3;
  };
})
