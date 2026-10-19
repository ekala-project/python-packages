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
  version = "1.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-sH4bvLizPwXC5u08537pdWNUrahAoYqtfAU22Wf+TAs=";
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
