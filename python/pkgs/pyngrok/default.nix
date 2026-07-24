{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyngrok";
  version = "8.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-O1OD7H3EZGrA0EZDXrWMbNHLyaytcObe4BKwXcJbBwo=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyyaml ];

  pythonImportsCheck = [ "pyngrok" ];

  meta = {
    description = "Python wrapper for ngrok";
    homepage = "https://github.com/alexdlaird/pyngrok";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
