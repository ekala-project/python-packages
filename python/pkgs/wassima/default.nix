{
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  lib,
}:

buildPythonPackage (finalAttrs: {
  pname = "wassima";
  version = "2.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jawah";
    repo = "wassima";
    tag = finalAttrs.version;
    hash = "sha256-cAJLjcFSabSQi7GQTFjaZNxq4BCXCSiCJIFHGZ/Lsyo=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "wassima" ];

  meta = {
    description = "Access your OS root certificates with utmost ease";
    homepage = "https://github.com/jawah/wassima";
    license = lib.licenses.mit;
  };
})
