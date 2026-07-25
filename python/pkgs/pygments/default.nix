{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
}:

let
  pygments = buildPythonPackage (finalAttrs: {
    pname = "pygments";
    version = "2.20.0";
    pyproject = true;

    src = fetchPypi {
      inherit (finalAttrs) pname version;
      hash = "sha256-Z1fNA3aAU/+Z8wOcGjbWwKoLJjQ4/KsXUgswowOoK18=";
    };

    build-system = [ hatchling ];

    # circular dependencies if enabled by default
    doCheck = false;
    pythonImportsCheck = [ "pygments" ];
    meta = {
      homepage = "https://pygments.org/";
      description = "Generic syntax highlighter";
      mainProgram = "pygmentize";
      license = lib.licenses.bsd2;
      maintainers = [ ];
    };
  });
in
pygments
