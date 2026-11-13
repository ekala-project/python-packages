{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  runs,
  xmod,
}:

buildPythonPackage (finalAttrs: {
  pname = "editor";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-bs3/Qr9KMrolD0Jnbbzddc5fpJjKjdHhkYxjolGFOM8=";
  };

  build-system = [ hatchling ];

  dependencies = [
    runs
    xmod
  ];

  pythonImportsCheck = [ "editor" ];

  meta = {
    description = "Open the default text editor";
    homepage = "https://github.com/rec/editor";
    license = lib.licenses.mit;
  };
})
