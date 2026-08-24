{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  requests,
  segno,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "fritzconnection";
  version = "1.15.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kbr";
    repo = "fritzconnection";
    tag = finalAttrs.version;
    hash = "sha256-J07zAXZxQc3TCfsjYcBhQdxsYwHabE9vdj3eMkWua54=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  optional-dependencies = {
    qr = [ segno ];
  };

  pythonImportsCheck = [ "fritzconnection" ];

  meta = {
    description = "Python module to communicate with the AVM Fritz!Box";
    homepage = "https://github.com/kbr/fritzconnection";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
