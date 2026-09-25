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
    version = "2.21.0";
    pyproject = true;

    src = fetchPypi {
      inherit (finalAttrs) pname version;
      hash = "sha256-YQynUcm8JJKzjrmjin+8k+27stcYLtrzTmauST3uXIw=";
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
    };
  });
in
pygments
